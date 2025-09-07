#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\POINT.ahk
#Include .\POINTER_INFO.ahk
#Include ..\..\..\Foundation\RECT.ahk

/**
 * Defines basic touch information common to all pointer types.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-pointer_touch_info
 * @namespace Windows.Win32.UI.Input.Pointer
 * @version v4.0.30319
 */
class POINTER_TOUCH_INFO extends Win32Struct
{
    static sizeof => 144

    static packingSize => 8

    /**
     * Type: **[POINTER_INFO](ns-winuser-pointer_info.md)**
     * 
     * An embedded [POINTER_INFO](ns-winuser-pointer_info.md) header structure.
     * @type {POINTER_INFO}
     */
    pointerInfo{
        get {
            if(!this.HasProp("__pointerInfo"))
                this.__pointerInfo := POINTER_INFO(this.ptr + 0)
            return this.__pointerInfo
        }
    }

    /**
     * Type: **[Touch Flags](/windows/win32/inputmsg/touch-flags-constants)**
     * 
     * Currently none.
     * @type {Integer}
     */
    touchFlags {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Type: **[Touch Mask](/windows/win32/inputmsg/touch-mask-constants)**
     * 
     * Indicates which of the optional fields contain valid values. The member can be zero or any combination of the values from the [Touch Mask](/windows/win32/inputmsg/touch-mask-constants) constants.
     * @type {Integer}
     */
    touchMask {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * Type: **RECT**
     * 
     * The predicted screen coordinates of the contact area, in pixels.
     * By default, if the device does not report a contact area, this field defaults to a 0-by-0 rectangle centered around the pointer location.
     * 
     * The predicted value is based on the pointer position reported by the digitizer and the motion of the pointer. This correction can compensate for visual lag due to inherent delays in sensing and processing the pointer location on the digitizer. This is applicable to  pointers of type [PT_TOUCH](ne-winuser-tagpointer_input_type.md).
     * @type {RECT}
     */
    rcContact{
        get {
            if(!this.HasProp("__rcContact"))
                this.__rcContact := RECT(this.ptr + 104)
            return this.__rcContact
        }
    }

    /**
     * Type: **RECT**
     * 
     * The raw screen coordinates of the contact area, in pixels. For adjusted screen coordinates, see **rcContact**.
     * @type {RECT}
     */
    rcContactRaw{
        get {
            if(!this.HasProp("__rcContactRaw"))
                this.__rcContactRaw := RECT(this.ptr + 120)
            return this.__rcContactRaw
        }
    }

    /**
     * Type: **UINT32**
     * 
     * A pointer orientation, with a value between 0 and 359, where 0 indicates a touch pointer aligned with the x-axis and pointing from left to right; increasing values indicate degrees of rotation in the clockwise direction.
     * 
     * This field defaults to 0 if the device does not report orientation.
     * 
     * > [!NOTE]
     * > Some touchscreen devices that support orientation will only report half-range (0-180°) values, while other devices will only report full-range (0-359°) values.
     * @type {Integer}
     */
    orientation {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * Type: **UINT32**
     * 
     *  A pen pressure normalized to a range between 0 and 1024. The default is 512.
     * @type {Integer}
     */
    pressure {
        get => NumGet(this, 140, "uint")
        set => NumPut("uint", value, this, 140)
    }
}
