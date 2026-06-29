#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct HTTP_FILTER_AUTH_COMPLETE_INFO {
    #StructPack 8

    GetHeader : IntPtr

    SetHeader : IntPtr

    AddHeader : IntPtr

    GetUserToken : IntPtr

    HttpStatus : UInt32

    fResetAuth : BOOL

    dwReserved : UInt32

}
