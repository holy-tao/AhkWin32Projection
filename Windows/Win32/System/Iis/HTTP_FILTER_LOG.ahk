#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct HTTP_FILTER_LOG {
    #StructPack 8

    pszClientHostName : PSTR

    pszClientUserName : PSTR

    pszServerName : PSTR

    pszOperation : PSTR

    pszTarget : PSTR

    pszParameters : PSTR

    dwHttpStatus : UInt32

    dwWin32Status : UInt32

    dwBytesSent : UInt32

    dwBytesRecvd : UInt32

    msTimeForProcessing : UInt32

}
