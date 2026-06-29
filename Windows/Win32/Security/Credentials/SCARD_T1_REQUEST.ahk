#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SCARD_IO_REQUEST.ahk" { SCARD_IO_REQUEST }

/**
 * @namespace Windows.Win32.Security.Credentials
 */
export default struct SCARD_T1_REQUEST {
    #StructPack 4

    ioRequest : SCARD_IO_REQUEST

}
