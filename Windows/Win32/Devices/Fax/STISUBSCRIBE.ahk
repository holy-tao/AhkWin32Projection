#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct STISUBSCRIBE {
    #StructPack 8

    dwSize : UInt32

    dwFlags : UInt32

    dwFilter : UInt32

    hWndNotify : HWND

    hEvent : HANDLE

    uiNotificationMessage : UInt32

}
