#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HCONN.ahk" { HCONN }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
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

    GetServerVariable : IntPtr

    WriteClient : IntPtr

    ReadClient : IntPtr

    ServerSupportFunction : IntPtr

}
