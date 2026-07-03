#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PARBITRATE_ROUTINE.ahk" { PARBITRATE_ROUTINE }
#Import ".\PCLOSE_ROUTINE.ahk" { PCLOSE_ROUTINE }
#Import ".\PIS_ALIVE_ROUTINE.ahk" { PIS_ALIVE_ROUTINE }
#Import ".\PLOOKS_ALIVE_ROUTINE.ahk" { PLOOKS_ALIVE_ROUTINE }
#Import ".\POFFLINE_ROUTINE.ahk" { POFFLINE_ROUTINE }
#Import ".\PONLINE_ROUTINE.ahk" { PONLINE_ROUTINE }
#Import ".\POPEN_ROUTINE.ahk" { POPEN_ROUTINE }
#Import ".\PRELEASE_ROUTINE.ahk" { PRELEASE_ROUTINE }
#Import ".\PRESOURCE_CONTROL_ROUTINE.ahk" { PRESOURCE_CONTROL_ROUTINE }
#Import ".\PRESOURCE_TYPE_CONTROL_ROUTINE.ahk" { PRESOURCE_TYPE_CONTROL_ROUTINE }
#Import ".\PTERMINATE_ROUTINE.ahk" { PTERMINATE_ROUTINE }

/**
 * Contains pointers to all Resource API version 1.0 entry points except Startup.
 * @remarks
 * The <b>CLRES_V1_FUNCTIONS</b> structure is the function 
 *     table that is returned by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pstartup_routine">Startup</a> function in 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-api">Resource API</a> 1.0. 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-dlls">Resource DLLs</a> that support multiple 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-types">resource types</a> must provide one function table for each 
 *     resource type. All function pointers must be non-NULL except for the following entry points:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-parbitrate_routine">Arbitrate</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-prelease_routine">Release</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-presource_control_routine">ResourceControl</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-presource_type_control_routine">ResourceTypeControl</a>
 * </li>
 * </ul>
 * For more information, see 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/implementing-resource-dlls">Implementing Resource DLLs</a>.
 * 
 * To create a function table for version 1.0 of the Resource API, use the 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nf-resapi-clres_v1_function_table">CLRES_V1_FUNCTION_TABLE</a> macro.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/ns-resapi-clres_v1_functions
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLRES_V1_FUNCTIONS {
    #StructPack 8

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-popen_routine">Open</a> entry point.
     */
    Open : POPEN_ROUTINE

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pclose_routine">Close</a> entry point.
     */
    Close : PCLOSE_ROUTINE

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-ponline_routine">Online</a> entry point.
     */
    Online : PONLINE_ROUTINE

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-poffline_routine">Offline</a> entry point.
     */
    Offline : POFFLINE_ROUTINE

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pterminate_routine">Terminate</a> entry point.
     */
    Terminate : PTERMINATE_ROUTINE

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-plooks_alive_routine">LooksAlive</a> entry point.
     */
    LooksAlive : PLOOKS_ALIVE_ROUTINE

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pis_alive_routine">IsAlive</a> entry point.
     */
    IsAlive : PIS_ALIVE_ROUTINE

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-parbitrate_routine">Arbitrate</a> entry point.
     */
    Arbitrate : PARBITRATE_ROUTINE

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-prelease_routine">Release</a> entry point.
     */
    Release : PRELEASE_ROUTINE

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-presource_control_routine">ResourceControl</a> entry 
     *       point.
     */
    ResourceControl : PRESOURCE_CONTROL_ROUTINE

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-presource_type_control_routine">ResourceTypeControl</a> entry 
     *       point.
     */
    ResourceTypeControl : PRESOURCE_TYPE_CONTROL_ROUTINE

}
