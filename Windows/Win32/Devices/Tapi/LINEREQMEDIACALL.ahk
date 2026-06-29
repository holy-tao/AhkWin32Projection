#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Describes a request initiated by a call to the lineGetRequest function. This data structure is obsolete and should not be used.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-linereqmediacall
 * @namespace Windows.Win32.Devices.Tapi
 * @charset ANSI
 */
export default struct LINEREQMEDIACALL {
    #StructPack 8

    /**
     * A handle to the window of the application that  made the request.
     */
    hWnd : HWND

    /**
     * The identifier of the request. Used to match an asynchronous response.
     */
    wRequestID : WPARAM

    /**
     * The device class required to fill the request.
     */
    szDeviceClass : CHAR[40]

    /**
     * The device identifier.
     */
    ucDeviceID : Int8[40]

    /**
     * Size, in bytes, of this structure.
     */
    dwSize : UInt32

    /**
     * Not used.
     */
    dwSecure : UInt32

    /**
     * The destination address.
     */
    szDestAddress : CHAR[80]

    /**
     * The name of application that made the request.
     */
    szAppName : CHAR[40]

    /**
     * The called party name.
     */
    szCalledParty : CHAR[40]

    /**
     * The comment buffer.
     */
    szComment : CHAR[80]

}
