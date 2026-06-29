#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RECO_LATTICE_PROPERTIES.ahk" { RECO_LATTICE_PROPERTIES }
#Import ".\RECO_LATTICE_PROPERTY.ahk" { RECO_LATTICE_PROPERTY }
#Import ".\RECO_LATTICE_ELEMENT.ahk" { RECO_LATTICE_ELEMENT }

/**
 * Represents a column in the lattice.
 * @remarks
 * There is one column per recognition segment. Each column contains one or more elements. An element is usually a word or character that is a recognition alternate. Elements start with the same stroke index, but do not necessarily contain the same number of strokes (for example, see column 0 in the "together" <a href="https://docs.microsoft.com/windows/desktop/tablet/recognizer-lattice-structure">example</a>). The structure also holds properties that are valid for the whole column.
 * @see https://learn.microsoft.com/windows/win32/api/rectypes/ns-rectypes-reco_lattice_column
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct RECO_LATTICE_COLUMN {
    #StructPack 8

    /**
     * Unused. Should be set to 0 (zero).
     */
    key : UInt32

    /**
     * Holds the properties for the column.
     */
    cpProp : RECO_LATTICE_PROPERTIES

    /**
     * Count of strokes in the <i>pStrokes</i> array for the longest element in the column.
     */
    cStrokes : UInt32

    /**
     * An array of stroke indices in the order in which they were fed to the recognizer. For example, imagine you have two strokes, stroke one containing the word "back" and stroke two containing the word "door". The column containing "back" will have a strokes array containing one ULONG {0}. The column for "door" will have a strokes array containing two ULONG items {1,2}.
     */
    pStrokes : IntPtr

    /**
     * Number of members in <i>pLatticeElements</i>.
     */
    cLatticeElements : UInt32

    /**
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/rectypes/ns-rectypes-reco_lattice_element">RECO_LATTICE_ELEMENT</a> structures.
     */
    pLatticeElements : RECO_LATTICE_ELEMENT.Ptr

}
