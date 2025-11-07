#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains pointers to all Resource API version 1.0 entry points except Startup.
 * @remarks
 * 
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//resapi/ns-resapi-clres_v1_functions
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLRES_V1_FUNCTIONS extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-popen_routine">Open</a> entry point.
     * @type {Pointer<POPEN_ROUTINE>}
     */
    Open {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pclose_routine">Close</a> entry point.
     * @type {Pointer<PCLOSE_ROUTINE>}
     */
    Close {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-ponline_routine">Online</a> entry point.
     * @type {Pointer<PONLINE_ROUTINE>}
     */
    Online {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-poffline_routine">Offline</a> entry point.
     * @type {Pointer<POFFLINE_ROUTINE>}
     */
    Offline {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pterminate_routine">Terminate</a> entry point.
     * @type {Pointer<PTERMINATE_ROUTINE>}
     */
    Terminate {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-plooks_alive_routine">LooksAlive</a> entry point.
     * @type {Pointer<PLOOKS_ALIVE_ROUTINE>}
     */
    LooksAlive {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pis_alive_routine">IsAlive</a> entry point.
     * @type {Pointer<PIS_ALIVE_ROUTINE>}
     */
    IsAlive {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-parbitrate_routine">Arbitrate</a> entry point.
     * @type {Pointer<PARBITRATE_ROUTINE>}
     */
    Arbitrate {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-prelease_routine">Release</a> entry point.
     * @type {Pointer<PRELEASE_ROUTINE>}
     */
    Release {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-presource_control_routine">ResourceControl</a> entry 
     *       point.
     * @type {Pointer<PRESOURCE_CONTROL_ROUTINE>}
     */
    ResourceControl {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-presource_type_control_routine">ResourceTypeControl</a> entry 
     *       point.
     * @type {Pointer<PRESOURCE_TYPE_CONTROL_ROUTINE>}
     */
    ResourceTypeControl {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }
}
