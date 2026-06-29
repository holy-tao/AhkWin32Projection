#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains a stream item used by the PFNDPASTREAM callback function.
 * @see https://learn.microsoft.com/windows/win32/api/dpa_dsa/ns-dpa_dsa-dpastreaminfo
 * @namespace Windows.Win32.UI.Controls
 */
export default struct DPASTREAMINFO {
    #StructPack 8

    /**
     * Type: <b>int</b>
     * 
     * An index of the item in the DPA.
     */
    iPos : Int32

    /**
     * Type: <b>void*</b>
     * 
     * A void pointer to the item data.
     */
    pvItem : IntPtr

}
