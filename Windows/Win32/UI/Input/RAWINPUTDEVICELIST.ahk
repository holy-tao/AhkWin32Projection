#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\RID_DEVICE_INFO_TYPE.ahk

/**
 * Contains information about a raw input device.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-rawinputdevicelist
 * @namespace Windows.Win32.UI.Input
 */
class RAWINPUTDEVICELIST extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>HANDLE</b>
     * 
     * A handle to the raw input device.
     * @type {HANDLE}
     */
    hDevice {
        get {
            if(!this.HasProp("__hDevice"))
                this.__hDevice := HANDLE(0, this)
            return this.__hDevice
        }
    }

    /**
     * Type: <b>DWORD</b>
     * @type {RID_DEVICE_INFO_TYPE}
     */
    dwType {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
