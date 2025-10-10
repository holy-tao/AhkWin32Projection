#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RID_DEVICE_INFO_MOUSE.ahk
#Include .\RID_DEVICE_INFO_KEYBOARD.ahk
#Include .\RID_DEVICE_INFO_HID.ahk

/**
 * Defines the raw input data coming from any device.
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-rid_device_info
 * @namespace Windows.Win32.UI.Input
 * @version v4.0.30319
 */
class RID_DEVICE_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size, in bytes, of the <b>RID_DEVICE_INFO</b> structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {RID_DEVICE_INFO_MOUSE}
     */
    mouse{
        get {
            if(!this.HasProp("__mouse"))
                this.__mouse := RID_DEVICE_INFO_MOUSE(this.ptr + 8)
            return this.__mouse
        }
    }

    /**
     * @type {RID_DEVICE_INFO_KEYBOARD}
     */
    keyboard{
        get {
            if(!this.HasProp("__keyboard"))
                this.__keyboard := RID_DEVICE_INFO_KEYBOARD(this.ptr + 8)
            return this.__keyboard
        }
    }

    /**
     * @type {RID_DEVICE_INFO_HID}
     */
    hid{
        get {
            if(!this.HasProp("__hid"))
                this.__hid := RID_DEVICE_INFO_HID(this.ptr + 8)
            return this.__hid
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 32
    }
}
