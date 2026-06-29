#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LINEFORWARD.ahk" { LINEFORWARD }

/**
 * The LINEFORWARDLIST structure describes a list of forwarding instructions. This structure can contain an array of LINEFORWARD structures. The lineForward and TSPI_lineForward functions use the LINEFORWARDLIST structure.
 * @remarks
 * This structure may not be extended.
 * 
 * The 
 * <b>LINEFORWARDLIST</b> structure defines the forwarding parameters requested for forwarding calls on an address or on all addresses on a line.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-lineforwardlist
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LINEFORWARDLIST {
    #StructPack 4

    /**
     * Total size of the data structure, in bytes.
     */
    dwTotalSize : UInt32

    /**
     * Number of entries in the array specified as <b>ForwardList[]</b>.
     */
    dwNumEntries : UInt32

    /**
     * Array of forwarding instruction. The array's entries are of type 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineforward">LINEFORWARD</a>.
     */
    ForwardList : LINEFORWARD[1]

}
