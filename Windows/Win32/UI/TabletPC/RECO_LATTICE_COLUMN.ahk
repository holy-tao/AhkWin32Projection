#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RECO_LATTICE_PROPERTIES.ahk

/**
 * Represents a column in the lattice.
 * @remarks
 * 
  * There is one column per recognition segment. Each column contains one or more elements. An element is usually a word or character that is a recognition alternate. Elements start with the same stroke index, but do not necessarily contain the same number of strokes (for example, see column 0 in the "together" <a href="https://docs.microsoft.com/windows/desktop/tablet/recognizer-lattice-structure">example</a>). The structure also holds properties that are valid for the whole column.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//rectypes/ns-rectypes-reco_lattice_column
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class RECO_LATTICE_COLUMN extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Unused. Should be set to 0 (zero).
     * @type {Integer}
     */
    key {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Holds the properties for the column.
     * @type {RECO_LATTICE_PROPERTIES}
     */
    cpProp{
        get {
            if(!this.HasProp("__cpProp"))
                this.__cpProp := RECO_LATTICE_PROPERTIES(this.ptr + 8)
            return this.__cpProp
        }
    }

    /**
     * Count of strokes in the <i>pStrokes</i> array for the longest element in the column.
     * @type {Integer}
     */
    cStrokes {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * An array of stroke indices in the order in which they were fed to the recognizer. For example, imagine you have two strokes, stroke one containing the word "back" and stroke two containing the word "door". The column containing "back" will have a strokes array containing one ULONG {0}. The column for "door" will have a strokes array containing two ULONG items {1,2}.
     * @type {Pointer<UInt32>}
     */
    pStrokes {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Number of members in <i>pLatticeElements</i>.
     * @type {Integer}
     */
    cLatticeElements {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/rectypes/ns-rectypes-reco_lattice_element">RECO_LATTICE_ELEMENT</a> structures.
     * @type {Pointer<RECO_LATTICE_ELEMENT>}
     */
    pLatticeElements {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
