import winim

var shellcode: array[4, byte] = [0xDE, 0xAD, 0xBE, 0xFE]

var address = VirtualAlloc(NULL, 
                                
                            cast[SIZE_T] (shellcode.len)
                            MEM_COMMIT,
                            PAGE_EXECUTE_READWRITE,
                            )
copyMem(address, addr(shellcode), cast[SIZE_T](shellcode.len))

var thread_handle = CreateThread(
                                     Null,
                                     0,
                                     cast[LPTHREAD_START_ROUTINE] (address)
                                    Null,
                                    0,
                                     NULL
                                        )


WaitForSingleObject(thread_handle, -1)
CloseHandle(thread_handle)
                                        