#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LPM_INIT_INFO structure contains local policy module initialization information.
 * @see https://learn.microsoft.com/windows/win32/api/lpmapi/ns-lpmapi-lpm_init_info
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class LPM_INIT_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Version of the policy control module
     * @type {Integer}
     */
    PcmVersionNumber {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Time limit, in seconds, that the policy control module waits to receive results before timing out.
     * @type {Integer}
     */
    ResultTimeLimit {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Number of configured local policy modules.
     * @type {Integer}
     */
    ConfiguredLpmCount {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Memory allocation function used to initialize memory for local policy modules, in the form of a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/nc-lpmapi-pallocmem">PALLOCMEM</a> function.
     * @type {Pointer<Ptr>}
     */
    AllocMemory {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Memory freeing function used to free memory allocated for the local policy module.  See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/nc-lpmapi-pfreemem">PFREEMEM</a> for more information.
     * @type {Pointer<Ptr>}
     */
    FreeMemory {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Callback function used to admit results. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/nc-lpmapi-cbadmitresult">cbAdmitResult</a> for more information.
     * @type {Pointer<Ptr>}
     */
    PcmAdmitResultCallback {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Callback function used to obtain RSVP objects. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lpmapi/nc-lpmapi-cbgetrsvpobjects">cbGetRsvpObjects</a> for more information.
     * @type {Pointer<Ptr>}
     */
    GetRsvpObjectsCallback {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
