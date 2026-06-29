#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLRES_V2_FUNCTIONS.ahk" { CLRES_V2_FUNCTIONS }
#Import ".\CLRES_V3_FUNCTIONS.ahk" { CLRES_V3_FUNCTIONS }
#Import ".\CLRES_V1_FUNCTIONS.ahk" { CLRES_V1_FUNCTIONS }
#Import ".\CLRES_V4_FUNCTIONS.ahk" { CLRES_V4_FUNCTIONS }

/**
 * Describes a function table for any version of the Resource API.
 * @remarks
 * Only the first two members are guaranteed to be at the same offset within the 
 *      <b>CLRES_FUNCTION_TABLE</b> structure. All other entries 
 *      within this structure are dependent on the 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-api">Resource API</a> version supported.
 * 
 * The <b>V1Functions</b> member is a 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/ns-resapi-clres_v1_functions">CLRES_V1_FUNCTIONS</a> structure containing pointers to 
 *      all Resource API entry points except <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pstartup_routine">Startup</a>. All pointers 
 *      must be non-<b>NULL</b> except for pointers to the following entry point functions:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-parbitrate_routine">Arbitrate</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-prelease_routine">Release</a>
 * </li>
 * </ul>
 * For more information, see 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/implementing-resource-dlls">Implementing Resource DLLs</a>.
 * 
 * To create a function table for version 1.0 of the Resource API, use the 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nf-resapi-clres_v1_function_table">CLRES_V1_FUNCTION_TABLE</a> macro.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/ns-resapi-clres_function_table
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLRES_FUNCTION_TABLE {
    #StructPack 8

    /**
     * Count of bytes in the structure.
     * 
     * 
     * This can contain one of these values:
     */
    TableSize : UInt32

    /**
     * The supported version of the Resource API.
     * 
     * 
     * This can contain one of these values:
     */
    Version : UInt32

    V1Functions : CLRES_V1_FUNCTIONS

    static __New() {
        DefineProp(this.Prototype, 'V2Functions', { type: CLRES_V2_FUNCTIONS, offset: 8 })
        DefineProp(this.Prototype, 'V3Functions', { type: CLRES_V3_FUNCTIONS, offset: 8 })
        DefineProp(this.Prototype, 'V4Functions', { type: CLRES_V4_FUNCTIONS, offset: 8 })
        this.DeleteProp("__New")
    }
}
