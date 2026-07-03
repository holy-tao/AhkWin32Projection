#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PARBITRATE_ROUTINE.ahk" { PARBITRATE_ROUTINE }
#Import ".\PBEGIN_RESCALL_AS_USER_ROUTINE.ahk" { PBEGIN_RESCALL_AS_USER_ROUTINE }
#Import ".\PBEGIN_RESCALL_ROUTINE.ahk" { PBEGIN_RESCALL_ROUTINE }
#Import ".\PBEGIN_RESTYPECALL_AS_USER_ROUTINE.ahk" { PBEGIN_RESTYPECALL_AS_USER_ROUTINE }
#Import ".\PBEGIN_RESTYPECALL_ROUTINE.ahk" { PBEGIN_RESTYPECALL_ROUTINE }
#Import ".\PCANCEL_ROUTINE.ahk" { PCANCEL_ROUTINE }
#Import ".\PCLOSE_ROUTINE.ahk" { PCLOSE_ROUTINE }
#Import ".\PIS_ALIVE_ROUTINE.ahk" { PIS_ALIVE_ROUTINE }
#Import ".\PLOOKS_ALIVE_ROUTINE.ahk" { PLOOKS_ALIVE_ROUTINE }
#Import ".\POFFLINE_V2_ROUTINE.ahk" { POFFLINE_V2_ROUTINE }
#Import ".\PONLINE_V2_ROUTINE.ahk" { PONLINE_V2_ROUTINE }
#Import ".\POPEN_V2_ROUTINE.ahk" { POPEN_V2_ROUTINE }
#Import ".\PRELEASE_ROUTINE.ahk" { PRELEASE_ROUTINE }
#Import ".\PTERMINATE_ROUTINE.ahk" { PTERMINATE_ROUTINE }

/**
 * Contains pointers to all Resource API version 4.0 entry points, except StartupEx.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/ns-resapi-clres_v4_functions
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLRES_V4_FUNCTIONS {
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
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pbegin_rescall_routine">BeginResourceControl</a> entry 
     *       point.
     */
    BeginResourceControl : PBEGIN_RESCALL_ROUTINE

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pbegin_restypecall_routine">BeginResourceTypeControl</a> entry 
     *       point.
     */
    BeginResourceTypeControl : PBEGIN_RESTYPECALL_ROUTINE

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pcancel_routine">Cancel</a> entry point.
     */
    Cancel : PCANCEL_ROUTINE

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pbegin_rescall_as_user_routine">BeginResourceControlAsUser</a> entry point.
     */
    BeginResourceControlAsUser : PBEGIN_RESCALL_AS_USER_ROUTINE

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pbegin_restypecall_as_user_routine">BeginResourceTypeControlAsUser</a> entry point.
     */
    BeginResourceTypeControlAsUser : PBEGIN_RESTYPECALL_AS_USER_ROUTINE

}
