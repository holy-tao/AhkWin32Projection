#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\Foundation\WPARAM.ahk
#Include .\RAWINPUTHEADER.ahk
#Include .\RAWMOUSE.ahk
#Include .\RAWKEYBOARD.ahk
#Include .\RAWHID.ahk

/**
 * Contains the raw input from a device.
 * @remarks
 * 
  * The handle to this structure is passed in the <i>lParam</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-input">WM_INPUT</a>.
  * 
  * To get detailed information -- such as the header and the content of the raw input -- call <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getrawinputdata">GetRawInputData</a>.
  * 
  * To read the <b>RAWINPUT</b> in the message loop as a buffered read, call <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getrawinputbuffer">GetRawInputBuffer</a>. 
  * 
  * To get device specific information, call <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getrawinputdeviceinfoa">GetRawInputDeviceInfo</a> with the <i>hDevice</i> from <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-rawinputheader">RAWINPUTHEADER</a>.
  * 
  * Raw input is available only when the application calls <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-registerrawinputdevices">RegisterRawInputDevices</a> with valid device specifications.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-rawinput
 * @namespace Windows.Win32.UI.Input
 * @version v4.0.30319
 */
class RAWINPUT extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-rawinputheader">RAWINPUTHEADER</a></b>
     * 
     * The raw input data.
     * @type {RAWINPUTHEADER}
     */
    header{
        get {
            if(!this.HasProp("__header"))
                this.__header := RAWINPUTHEADER(this.ptr + 0)
            return this.__header
        }
    }

    /**
     * @type {RAWMOUSE}
     */
    mouse{
        get {
            if(!this.HasProp("__mouse"))
                this.__mouse := RAWMOUSE(this.ptr + 24)
            return this.__mouse
        }
    }

    /**
     * @type {RAWKEYBOARD}
     */
    keyboard{
        get {
            if(!this.HasProp("__keyboard"))
                this.__keyboard := RAWKEYBOARD(this.ptr + 24)
            return this.__keyboard
        }
    }

    /**
     * @type {RAWHID}
     */
    hid{
        get {
            if(!this.HasProp("__hid"))
                this.__hid := RAWHID(this.ptr + 24)
            return this.__hid
        }
    }
}
