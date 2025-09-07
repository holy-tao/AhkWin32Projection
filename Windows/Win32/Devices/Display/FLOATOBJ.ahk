#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The FLOATOBJ structure is used to emulate a floating-point number.
 * @remarks
 * This structure, in conjunction with the <b>FLOATOBJ_</b><i>Xxx</i> service routines, allows graphics drivers to emulate floating-point arithmetic in the NT kernel. Floating-point arithmetic is not otherwise supported in the NT kernel code.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-floatobj
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class FLOATOBJ extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Reserved for system use.
     * @type {Integer}
     */
    ul1 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reserved for system use.
     * @type {Integer}
     */
    ul2 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
