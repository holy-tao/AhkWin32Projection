#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct REG_POST_CREATE_KEY_INFORMATION {
    #StructPack 8

    CompleteName : UNICODE_STRING.Ptr

    Object : IntPtr

    Status : NTSTATUS

}
