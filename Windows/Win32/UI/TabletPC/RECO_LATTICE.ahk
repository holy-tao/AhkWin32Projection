#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Serves as the entry point into a lattice.
 * @remarks
 * The <i>ulBestResultColumnCount</i>, <i>pulBestResultColumns</i>, and <i>pulBestResultIndexes</i> members are used together to hold information about the top alternates among all columns. These values should be filled in by the recognizer, even in the simplest case where there is no segmentation and there is only one column. Using the "together" <a href="https://docs.microsoft.com/windows/desktop/tablet/recognizer-lattice-structure">example</a>, if the recognizer determines that the best result is "to gather", <i>ulBestResultColumnCount</i> would be 3, the <i>pulBestResultColumns</i> array would contain [0,1,2] and the <i>pulBestResultIndexes</i>  array would contain [1,0,2].
 * @see https://learn.microsoft.com/windows/win32/api/rectypes/ns-rectypes-reco_lattice
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class RECO_LATTICE extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * The number of columns in the lattice.
     * @type {Integer}
     */
    ulColumnCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/rectypes/ns-rectypes-reco_lattice_column">RECO_LATTICE_COLUMN</a> structures contained by the lattice.
     * @type {Pointer<RECO_LATTICE_COLUMN>}
     */
    pLatticeColumns {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The number of properties assigned to the lattice. For details about properties, see the <a href="https://docs.microsoft.com/windows/desktop/api/rectypes/ns-rectypes-reco_lattice_properties">RECO_LATTICE_PROPERTIES</a> structure.
     * @type {Integer}
     */
    ulPropertyCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * An array of property GUIDs. The GUIDS for these properties can either be the properties defined in the Msinkaut.h header file (for example, line metrics) or custom properties defined by your recognizer.
     * @type {Pointer<Guid>}
     */
    pGuidProperties {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The number of columns that the best result consists of.
     * @type {Integer}
     */
    ulBestResultColumnCount {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * An array containing the indexes of the columns in the <i>pLatticeColumns</i> array that makes up the best result.
     * @type {Pointer<UInt32>}
     */
    pulBestResultColumns {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * An array of indexes of the elements in the <i>pLatticeElements</i> array of the corresponding column designated by <i>pulBestResultColumn</i>.
     * @type {Pointer<UInt32>}
     */
    pulBestResultIndexes {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
