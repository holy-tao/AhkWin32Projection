#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PFN_IIS_SERVERSUPPORTFUNCTION.ahk" { PFN_IIS_SERVERSUPPORTFUNCTION }
#Import ".\HCONN.ahk" { HCONN }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\PFN_IIS_READCLIENT.ahk" { PFN_IIS_READCLIENT }
#Import ".\PFN_IIS_WRITECLIENT.ahk" { PFN_IIS_WRITECLIENT }
#Import ".\PFN_IIS_GETSERVERVARIABLE.ahk" { PFN_IIS_GETSERVERVARIABLE }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct EXTENSION_CONTROL_BLOCK {
    #StructPack 8

    cbSize : UInt32 := this.Size

    dwVersion : UInt32

    ConnID : HCONN

    dwHttpStatusCode : UInt32

    lpszLogData : CHAR[80]

    lpszMethod : PSTR

    lpszQueryString : PSTR

    lpszPathInfo : PSTR

    lpszPathTranslated : PSTR

    cbTotalBytes : UInt32

    cbAvailable : UInt32

    lpbData : IntPtr

    lpszContentType : PSTR

    GetServerVariable : PFN_IIS_GETSERVERVARIABLE

    WriteClient : PFN_IIS_WRITECLIENT

    ReadClient : PFN_IIS_READCLIENT

    ServerSupportFunction : PFN_IIS_SERVERSUPPORTFUNCTION

}
