#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CLRES_V1_FUNCTIONS.ahk
#Include .\CLRES_V2_FUNCTIONS.ahk
#Include .\CLRES_V3_FUNCTIONS.ahk
#Include .\CLRES_V4_FUNCTIONS.ahk

/**
 * Describes a function table for any version of the Resource API.
 * @remarks
 * 
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
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//resapi/ns-resapi-clres_function_table
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLRES_FUNCTION_TABLE extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * Count of bytes in the structure.
     * 
     * 
     * This can contain one of these values:
     * @type {Integer}
     */
    TableSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The supported version of the Resource API.
     * 
     * 
     * This can contain one of these values:
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {CLRES_V1_FUNCTIONS}
     */
    V1Functions{
        get {
            if(!this.HasProp("__V1Functions"))
                this.__V1Functions := CLRES_V1_FUNCTIONS(8, this)
            return this.__V1Functions
        }
    }

    /**
     * @type {CLRES_V2_FUNCTIONS}
     */
    V2Functions{
        get {
            if(!this.HasProp("__V2Functions"))
                this.__V2Functions := CLRES_V2_FUNCTIONS(8, this)
            return this.__V2Functions
        }
    }

    /**
     * @type {CLRES_V3_FUNCTIONS}
     */
    V3Functions{
        get {
            if(!this.HasProp("__V3Functions"))
                this.__V3Functions := CLRES_V3_FUNCTIONS(8, this)
            return this.__V3Functions
        }
    }

    /**
     * @type {CLRES_V4_FUNCTIONS}
     */
    V4Functions{
        get {
            if(!this.HasProp("__V4Functions"))
                this.__V4Functions := CLRES_V4_FUNCTIONS(8, this)
            return this.__V4Functions
        }
    }
}
