#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RECO_LATTICE_PROPERTIES.ahk" { RECO_LATTICE_PROPERTIES }
#Import ".\RECO_LATTICE_PROPERTY.ahk" { RECO_LATTICE_PROPERTY }

/**
 * Corresponds to one word or one East Asian character, typically; however, an element may also correspond to a gesture, a shape, or some other code.
 * @see https://learn.microsoft.com/windows/win32/api/rectypes/ns-rectypes-reco_lattice_element
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct RECO_LATTICE_ELEMENT {
    #StructPack 8

    /**
     * Integer value that represents the shape probability assigned for this element.
     */
    score : Int32

    /**
     * Describes whether the element contains wide string or wide character data.
     * 
     * <c>enum enumRECO_TYPE</code><code>{</code><code>RECO_TYPE_WSTRING = 0,</code><code>RECO_TYPE_WCHAR = 1</code><code>} RECO_TYPE;</c>
     */
    type : UInt16

    /**
     * Holds the recognition result. This can be a string or a character.
     * 
     * Note: For recognizers of Latin script, the <c>pData</code> member contains a pointer to a <b>NULL</b>–terminated string of wide characters. For recognizers of East Asian characters, the <code>pData</c> member contains the wide character (WCHAR) value itself.
     */
    pData : IntPtr

    /**
     * Contains the index for the next column.
     */
    ulNextColumn : UInt32

    /**
     * Count of strokes used by this alternate.
     */
    ulStrokeNumber : UInt32

    /**
     * Properties structure. These are properties that are applicable to this element only.
     * 
     * For details about properties, see the <a href="https://docs.microsoft.com/windows/desktop/api/rectypes/ns-rectypes-reco_lattice_properties">RECO_LATTICE_PROPERTIES</a> structure.
     */
    epProp : RECO_LATTICE_PROPERTIES

}
