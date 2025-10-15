#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\Foundation\WPARAM.ahk

/**
 * Contains the header information that is part of the raw input data.
 * @remarks
 * 
  * To get more information on the device, use <b>hDevice</b> in a call to [GetRawInputDeviceInfo](nf-winuser-getrawinputdeviceinfoa.md).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-rawinputheader
 * @namespace Windows.Win32.UI.Input
 * @version v4.0.30319
 */
class RAWINPUTHEADER extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The size, in bytes, of the entire input packet of data. This includes [RAWINPUT](ns-winuser-rawinput.md) plus possible extra input reports in the [RAWHID](ns-winuser-rawhid.md) variable length array.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>HANDLE</b>
     * 
     * A handle to the device generating the raw input data.
     * @type {HANDLE}
     */
    hDevice{
        get {
            if(!this.HasProp("__hDevice"))
                this.__hDevice := HANDLE(this.ptr + 8)
            return this.__hDevice
        }
    }

    /**
     * Type: <b>WPARAM</b>
     * 
     * The value passed in the <i>wParam</i> parameter of the [WM_INPUT](/windows/win32/inputdev/wm-input) message.
     * @type {WPARAM}
     */
    wParam{
        get {
            if(!this.HasProp("__wParam"))
                this.__wParam := WPARAM(this.ptr + 16)
            return this.__wParam
        }
    }
}
