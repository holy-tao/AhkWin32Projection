#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains pointers to all Resource API version 4.0 entry points, except StartupEx.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/ns-resapi-clres_v4_functions
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLRES_V4_FUNCTIONS extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-popen_v2_routine">OpenV2</a> entry point.
     * @type {Pointer<Ptr>}
     */
    Open {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pclose_routine">Close</a> entry point.
     * @type {Pointer<Ptr>}
     */
    Close {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-ponline_v2_routine">OnlineV2</a> entry point.
     * @type {Pointer<Ptr>}
     */
    Online {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-poffline_v2_routine">OfflineV2</a> entry point.
     * @type {Pointer<Ptr>}
     */
    Offline {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pterminate_routine">Terminate</a> entry point.
     * @type {Pointer<Ptr>}
     */
    Terminate {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-plooks_alive_routine">LooksAlive</a> entry point.
     * @type {Pointer<Ptr>}
     */
    LooksAlive {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pis_alive_routine">IsAlive</a> entry point.
     * @type {Pointer<Ptr>}
     */
    IsAlive {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-parbitrate_routine">Arbitrate</a> entry point.
     * @type {Pointer<Ptr>}
     */
    Arbitrate {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-prelease_routine">Release</a> entry point.
     * @type {Pointer<Ptr>}
     */
    Release {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pbegin_rescall_routine">BeginResourceControl</a> entry 
     *       point.
     * @type {Pointer<Ptr>}
     */
    BeginResourceControl {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pbegin_restypecall_routine">BeginResourceTypeControl</a> entry 
     *       point.
     * @type {Pointer<Ptr>}
     */
    BeginResourceTypeControl {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pcancel_routine">Cancel</a> entry point.
     * @type {Pointer<Ptr>}
     */
    Cancel {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pbegin_rescall_as_user_routine">BeginResourceControlAsUser</a> entry point.
     * @type {Pointer<Ptr>}
     */
    BeginResourceControlAsUser {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pbegin_restypecall_as_user_routine">BeginResourceTypeControlAsUser</a> entry point.
     * @type {Pointer<Ptr>}
     */
    BeginResourceTypeControlAsUser {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }
}
