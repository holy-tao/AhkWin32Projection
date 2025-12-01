#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The VMR9ProcAmpControlRange structure specifies the valid range for an image adjustment property. The range depends on the graphics device driver. This structure is used with the Video Mixing Renderer 9 Filter (VMR-9).
 * @see https://learn.microsoft.com/windows/win32/api/vmr9/ns-vmr9-vmr9procampcontrolrange
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VMR9ProcAmpControlRange extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * Size of the structure, in bytes. The value must be <c>sizeof(VMR9ProcAmpControlRange)</c>.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the image adjustment property to query, as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ne-vmr9-vmr9procampcontrolflags">VMR9ProcAmpControlFlags</a> enumeration. The caller should set this field.
     * @type {Integer}
     */
    dwProperty {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Specifies the minimum value for the property. The driver sets this field.
     * @type {Float}
     */
    MinValue {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * Specifies the maximum value for the property. The driver sets this field.
     * @type {Float}
     */
    MaxValue {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * Specifies the default value for the property. The default value is the value that does not alter the image. The driver sets this field.
     * @type {Float}
     */
    DefaultValue {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * Specifies the valid increments from <b>MinValue</b> to <b>MaxValue</b>. The driver sets this field.
     * @type {Float}
     */
    StepSize {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }
}
