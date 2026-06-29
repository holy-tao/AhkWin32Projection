#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RID_DEVICE_INFO_TYPE.ahk" { RID_DEVICE_INFO_TYPE }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * Contains information about a raw input device.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-rawinputdevicelist
 * @namespace Windows.Win32.UI.Input
 */
export default struct RAWINPUTDEVICELIST {
    #StructPack 8

    /**
     * Type: <b>HANDLE</b>
     * 
     * A handle to the raw input device.
     */
    hDevice : HANDLE

    /**
     * Type: <b>DWORD</b>
     */
    dwType : RID_DEVICE_INFO_TYPE

}
