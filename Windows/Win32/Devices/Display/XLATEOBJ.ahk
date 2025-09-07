#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The XLATEOBJ structure is used to translate color indexes from one palette to another.
 * @remarks
 * The destination palette always belongs to the destination surface of some drawing operation. The source palette is an application-selected palette or a palette from another surface.
  * 
  * The XLATEOBJ structure is used to translate color indices that refer to the source palette to indices for the destination palette. The resulting index identifies a color that matches the source color as closely as possible.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-xlateobj
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class XLATEOBJ extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A cache identifier that enables the driver to recognize an XLATEOBJ structure that it has previously cached. If this member is zero, the driver should not cache the XLATEOBJ structure.
     * @type {Integer}
     */
    iUniq {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    flXlate {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Is obsolete. Use <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-xlateobj_cgetpalette">XLATEOBJ_cGetPalette</a> to query the source format.
     * @type {Integer}
     */
    iSrcType {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * Is obsolete. Use <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-xlateobj_cgetpalette">XLATEOBJ_cGetPalette</a> to query the destination format.
     * @type {Integer}
     */
    iDstType {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * Specifies the number of entries in the array pointed to by the <b>pulXlate</b> member. Indexing into <b>pulXlate</b> with a value greater than <b>cEntries</b> results in a memory access violation.
     * @type {Integer}
     */
    cEntries {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Pointer to an array of translation entries.
     * @type {Pointer<UInt32>}
     */
    pulXlate {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
