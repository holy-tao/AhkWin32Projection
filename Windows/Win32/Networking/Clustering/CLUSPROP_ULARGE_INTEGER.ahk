#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSPROP_VALUE.ahk" { CLUSPROP_VALUE }
#Import ".\CLUSPROP_SYNTAX.ahk" { CLUSPROP_SYNTAX }

/**
 * Describes an unsigned large integer.
 * @remarks
 * Use caution when referencing large integer values in <b>DWORD</b>-aligned structures such 
 *      as value lists, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/property-lists">property lists</a>, and 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/parameter-blocks">parameter blocks</a>. For Windows Server for Itanium-based 
 *      systems, a naturally-aligned large integer value always begins on an address ending in 0h or 8h. 
 *      <b>DWORD</b> alignment can cause large values to begin on unaligned boundaries (addresses 
 *      ending in 4h or Ch), which will cause an alignment fault when the data is read or written. You can avoid 
 *      alignment faults by separately copying the high and low <b>DWORD</b> parts of large values 
 *      into local variables, which are guaranteed to be naturally aligned.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clusprop_ularge_integer
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSPROP_ULARGE_INTEGER {
    #StructPack 8

    Base : CLUSPROP_VALUE

    /**
     * Unsigned large integer value.
     */
    li : Int64

}
