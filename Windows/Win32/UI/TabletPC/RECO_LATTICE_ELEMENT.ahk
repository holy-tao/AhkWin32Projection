#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RECO_LATTICE_PROPERTIES.ahk

/**
 * Corresponds to one word or one East Asian character, typically; however, an element may also correspond to a gesture, a shape, or some other code.
 * @see https://learn.microsoft.com/windows/win32/api/rectypes/ns-rectypes-reco_lattice_element
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class RECO_LATTICE_ELEMENT extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Integer value that represents the shape probability assigned for this element.
     * @type {Integer}
     */
    score {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Describes whether the element contains wide string or wide character data.
     * 
     * <c>enum enumRECO_TYPE</code><code>{</code><code>RECO_TYPE_WSTRING = 0,</code><code>RECO_TYPE_WCHAR = 1</code><code>} RECO_TYPE;</c>
     * @type {Integer}
     */
    type {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Holds the recognition result. This can be a string or a character.
     * 
     * Note: For recognizers of Latin script, the <c>pData</code> member contains a pointer to a <b>NULL</b>–terminated string of wide characters. For recognizers of East Asian characters, the <code>pData</c> member contains the wide character (WCHAR) value itself.
     * @type {Pointer<Byte>}
     */
    pData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Contains the index for the next column.
     * @type {Integer}
     */
    ulNextColumn {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Count of strokes used by this alternate.
     * @type {Integer}
     */
    ulStrokeNumber {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Properties structure. These are properties that are applicable to this element only.
     * 
     * For details about properties, see the <a href="https://docs.microsoft.com/windows/desktop/api/rectypes/ns-rectypes-reco_lattice_properties">RECO_LATTICE_PROPERTIES</a> structure.
     * @type {RECO_LATTICE_PROPERTIES}
     */
    epProp{
        get {
            if(!this.HasProp("__epProp"))
                this.__epProp := RECO_LATTICE_PROPERTIES(this.ptr + 24)
            return this.__epProp
        }
    }
}
