#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Security\SECURITY_ATTRIBUTES.ahk" { SECURITY_ATTRIBUTES }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct CREATEFILE3_EXTENDED_PARAMETERS {
    #StructPack 8

    dwSize : UInt32

    dwFileAttributes : UInt32

    dwFileFlags : UInt32

    dwSecurityQosFlags : UInt32

    lpSecurityAttributes : SECURITY_ATTRIBUTES.Ptr

    hTemplateFile : HANDLE

}
