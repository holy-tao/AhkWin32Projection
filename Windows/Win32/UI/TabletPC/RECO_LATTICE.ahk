#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RECO_LATTICE_COLUMN.ahk" { RECO_LATTICE_COLUMN }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Serves as the entry point into a lattice.
 * @remarks
 * The <i>ulBestResultColumnCount</i>, <i>pulBestResultColumns</i>, and <i>pulBestResultIndexes</i> members are used together to hold information about the top alternates among all columns. These values should be filled in by the recognizer, even in the simplest case where there is no segmentation and there is only one column. Using the "together" <a href="https://docs.microsoft.com/windows/desktop/tablet/recognizer-lattice-structure">example</a>, if the recognizer determines that the best result is "to gather", <i>ulBestResultColumnCount</i> would be 3, the <i>pulBestResultColumns</i> array would contain [0,1,2] and the <i>pulBestResultIndexes</i>  array would contain [1,0,2].
 * @see https://learn.microsoft.com/windows/win32/api/rectypes/ns-rectypes-reco_lattice
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct RECO_LATTICE {
    #StructPack 8

    /**
     * The number of columns in the lattice.
     */
    ulColumnCount : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/rectypes/ns-rectypes-reco_lattice_column">RECO_LATTICE_COLUMN</a> structures contained by the lattice.
     */
    pLatticeColumns : RECO_LATTICE_COLUMN.Ptr

    /**
     * The number of properties assigned to the lattice. For details about properties, see the <a href="https://docs.microsoft.com/windows/desktop/api/rectypes/ns-rectypes-reco_lattice_properties">RECO_LATTICE_PROPERTIES</a> structure.
     */
    ulPropertyCount : UInt32

    /**
     * An array of property GUIDs. The GUIDS for these properties can either be the properties defined in the Msinkaut.h header file (for example, line metrics) or custom properties defined by your recognizer.
     */
    pGuidProperties : Guid.Ptr

    /**
     * The number of columns that the best result consists of.
     */
    ulBestResultColumnCount : UInt32

    /**
     * An array containing the indexes of the columns in the <i>pLatticeColumns</i> array that makes up the best result.
     */
    pulBestResultColumns : IntPtr

    /**
     * An array of indexes of the elements in the <i>pLatticeElements</i> array of the corresponding column designated by <i>pulBestResultColumn</i>.
     */
    pulBestResultIndexes : IntPtr

}
