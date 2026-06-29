#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RAWHID.ahk" { RAWHID }
#Import ".\RAWMOUSE.ahk" { RAWMOUSE }
#Import ".\RAWKEYBOARD.ahk" { RAWKEYBOARD }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\RAWINPUTHEADER.ahk" { RAWINPUTHEADER }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }
#Import ".\MOUSE_STATE.ahk" { MOUSE_STATE }

/**
 * Contains the raw input from a device.
 * @remarks
 * The handle to this structure is passed in the <i>lParam</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-input">WM_INPUT</a>.
 * 
 * To get detailed information -- such as the header and the content of the raw input -- call <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getrawinputdata">GetRawInputData</a>.
 * 
 * To read the <b>RAWINPUT</b> in the message loop as a buffered read, call <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getrawinputbuffer">GetRawInputBuffer</a>. 
 * 
 * To get device specific information, call <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getrawinputdeviceinfoa">GetRawInputDeviceInfo</a> with the <i>hDevice</i> from <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-rawinputheader">RAWINPUTHEADER</a>.
 * 
 * Raw input is available only when the application calls <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-registerrawinputdevices">RegisterRawInputDevices</a> with valid device specifications.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-rawinput
 * @namespace Windows.Win32.UI.Input
 */
export default struct RAWINPUT {
    #StructPack 8


    struct _data {
        mouse : RAWMOUSE

        static __New() {
            DefineProp(this.Prototype, 'keyboard', { type: RAWKEYBOARD, offset: 0 })
            DefineProp(this.Prototype, 'hid', { type: RAWHID, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-rawinputheader">RAWINPUTHEADER</a></b>
     * 
     * The raw input data.
     */
    header : RAWINPUTHEADER

    data : RAWINPUT._data

}
