#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PCANCEL_ROUTINE.ahk" { PCANCEL_ROUTINE }
#Import ".\PIS_ALIVE_ROUTINE.ahk" { PIS_ALIVE_ROUTINE }
#Import ".\PONLINE_V2_ROUTINE.ahk" { PONLINE_V2_ROUTINE }
#Import ".\POPEN_V2_ROUTINE.ahk" { POPEN_V2_ROUTINE }
#Import ".\PTERMINATE_ROUTINE.ahk" { PTERMINATE_ROUTINE }
#Import ".\PRESOURCE_TYPE_CONTROL_ROUTINE.ahk" { PRESOURCE_TYPE_CONTROL_ROUTINE }
#Import ".\PRESOURCE_CONTROL_ROUTINE.ahk" { PRESOURCE_CONTROL_ROUTINE }
#Import ".\PCLOSE_ROUTINE.ahk" { PCLOSE_ROUTINE }
#Import ".\PARBITRATE_ROUTINE.ahk" { PARBITRATE_ROUTINE }
#Import ".\PRELEASE_ROUTINE.ahk" { PRELEASE_ROUTINE }
#Import ".\POFFLINE_V2_ROUTINE.ahk" { POFFLINE_V2_ROUTINE }
#Import ".\PLOOKS_ALIVE_ROUTINE.ahk" { PLOOKS_ALIVE_ROUTINE }

/**
 * Contains pointers to all Resource API version 2.0 entry points except StartupEx.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/ns-resapi-clres_v2_functions
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLRES_V2_FUNCTIONS {
    #StructPack 8

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-popen_v2_routine">OpenV2</a> entry point.
     */
    Open : POPEN_V2_ROUTINE

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pclose_routine">Close</a> entry point.
     */
    Close : PCLOSE_ROUTINE

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-ponline_v2_routine">OnlineV2</a> entry point.
     */
    Online : PONLINE_V2_ROUTINE

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-poffline_v2_routine">OfflineV2</a> entry point.
     */
    Offline : POFFLINE_V2_ROUTINE

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

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pcancel_routine">Cancel</a> entry point.
     */
    Cancel : PCANCEL_ROUTINE

}
