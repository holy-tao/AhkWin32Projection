#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }

/**
 * Contains the header information that is part of the raw input data.
 * @remarks
 * To get more information on the device, use <b>hDevice</b> in a call to [GetRawInputDeviceInfo](nf-winuser-getrawinputdeviceinfoa.md). <b>hDevice</b> can be zero if an input is received from a precision touchpad.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-rawinputheader
 * @namespace Windows.Win32.UI.Input
 */
export default struct RAWINPUTHEADER {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     */
    dwType : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The size, in bytes, of the entire input packet of data. This includes [RAWINPUT](ns-winuser-rawinput.md) plus possible extra input reports in the [RAWHID](ns-winuser-rawhid.md) variable length array.
     */
    dwSize : UInt32

    /**
     * Type: <b>HANDLE</b>
     * 
     * A handle to the device generating the raw input data.
     */
    hDevice : HANDLE

    /**
     * Type: <b>WPARAM</b>
     * 
     * The value passed in the <i>wParam</i> parameter of the [WM_INPUT](/windows/win32/inputdev/wm-input) message.
     */
    wParam : WPARAM

}
