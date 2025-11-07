#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\WOW64_FLOATING_SAVE_AREA.ahk

/**
 * Represents a context frame on WOW64.
 * @remarks
 * 
 * In the following versions of Windows, Slot 1 of Thread Local Storage (TLS) holds a pointer to a structure that contains a <b>WOW64_CONTEXT</b> structure starting at offset 4. This might change in later versions of Windows.
 * 
 * <table>
 * <tr>
 * <td>Windows Vista</td>
 * <td>Windows Server 2008</td>
 * </tr>
 * <tr>
 * <td>Windows 7</td>
 * <td>Windows Server 2008 R2</td>
 * </tr>
 * <tr>
 * <td>Windows 8</td>
 * <td>Windows Server 2012</td>
 * </tr>
 * <tr>
 * <td>Windows 8.1</td>
 * <td>Windows Server 2012 R2</td>
 * </tr>
 * </table>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-wow64_context
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class WOW64_CONTEXT extends Win32Struct
{
    static sizeof => 720

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ContextFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Dr0 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Dr1 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Dr2 {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    Dr3 {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Dr6 {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    Dr7 {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {WOW64_FLOATING_SAVE_AREA}
     */
    FloatSave{
        get {
            if(!this.HasProp("__FloatSave"))
                this.__FloatSave := WOW64_FLOATING_SAVE_AREA(32, this)
            return this.__FloatSave
        }
    }

    /**
     * @type {Integer}
     */
    SegGs {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * @type {Integer}
     */
    SegFs {
        get => NumGet(this, 148, "uint")
        set => NumPut("uint", value, this, 148)
    }

    /**
     * @type {Integer}
     */
    SegEs {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * @type {Integer}
     */
    SegDs {
        get => NumGet(this, 156, "uint")
        set => NumPut("uint", value, this, 156)
    }

    /**
     * @type {Integer}
     */
    Edi {
        get => NumGet(this, 160, "uint")
        set => NumPut("uint", value, this, 160)
    }

    /**
     * @type {Integer}
     */
    Esi {
        get => NumGet(this, 164, "uint")
        set => NumPut("uint", value, this, 164)
    }

    /**
     * @type {Integer}
     */
    Ebx {
        get => NumGet(this, 168, "uint")
        set => NumPut("uint", value, this, 168)
    }

    /**
     * @type {Integer}
     */
    Edx {
        get => NumGet(this, 172, "uint")
        set => NumPut("uint", value, this, 172)
    }

    /**
     * @type {Integer}
     */
    Ecx {
        get => NumGet(this, 176, "uint")
        set => NumPut("uint", value, this, 176)
    }

    /**
     * @type {Integer}
     */
    Eax {
        get => NumGet(this, 180, "uint")
        set => NumPut("uint", value, this, 180)
    }

    /**
     * @type {Integer}
     */
    Ebp {
        get => NumGet(this, 184, "uint")
        set => NumPut("uint", value, this, 184)
    }

    /**
     * @type {Integer}
     */
    Eip {
        get => NumGet(this, 188, "uint")
        set => NumPut("uint", value, this, 188)
    }

    /**
     * @type {Integer}
     */
    SegCs {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }

    /**
     * @type {Integer}
     */
    EFlags {
        get => NumGet(this, 196, "uint")
        set => NumPut("uint", value, this, 196)
    }

    /**
     * @type {Integer}
     */
    Esp {
        get => NumGet(this, 200, "uint")
        set => NumPut("uint", value, this, 200)
    }

    /**
     * @type {Integer}
     */
    SegSs {
        get => NumGet(this, 204, "uint")
        set => NumPut("uint", value, this, 204)
    }

    /**
     * @type {Array<Byte>}
     */
    ExtendedRegisters{
        get {
            if(!this.HasProp("__ExtendedRegistersProxyArray"))
                this.__ExtendedRegistersProxyArray := Win32FixedArray(this.ptr + 208, 512, Primitive, "char")
            return this.__ExtendedRegistersProxyArray
        }
    }
}
