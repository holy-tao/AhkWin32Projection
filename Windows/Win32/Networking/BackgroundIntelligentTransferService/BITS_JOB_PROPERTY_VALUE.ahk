#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides the property value of the BITS job based on the value of the BITS_JOB_PROPERTY_ID enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/bits5_0/ns-bits5_0-bits_job_property_value
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class BITS_JOB_PROPERTY_VALUE extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * This value is returned when using the enum property ID 
     *       <b>BITS_JOB_PROPERTY_ID_COST_FLAGS</b> and is applied as the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/bits5_0/ne-bits5_0-bits_job_transfer_policy">transfer policy</a> on the BITS job.
     * 
     * This value is also used when using the <b>BITS_JOB_PROPERTY_MINIMUM_NOTIFICATION_INTERVAL_MS</b> to specify the minimum notification interval.
     * @type {Integer}
     */
    Dword {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * This value is returned when using the enum property ID 
     *      <b>BITS_JOB_PROPERTY_NOTIFICATION_CLSID</b> and represents the CLSID of the callback object 
     *      to register with the BITS job.
     * @type {Pointer<Guid>}
     */
    ClsID {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * This value is returned when using the enum property ID 
     *      <b>BITS_JOB_PROPERTY_DYNAMIC_CONTENT</b> to specify whether the BITS job has dynamic 
     *       content. This value is also returned when using the enum property ID 
     *       <b>BITS_JOB_PROPERTY_HIGH_PERFORMANCE</b>  to specify whether to mark the BITS job as an optimized download.
     * 
     * This value is also used when using the <b>BITS_JOB_PROPERTY_ON_DEMAND_MODE</b>  to specify whether the BITS job is in on demand or not.
     * @type {Integer}
     */
    Enable {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * This value is returned when using the enum property ID 
     *       <b>BITS_JOB_PROPERTY_MAX_DOWNLOAD_SIZE</b> to represent the maximum allowed download size 
     *       of an optimized download.
     * @type {Integer}
     */
    Uint64 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * This value is returned when using the enum property ID <b>BITS_JOB_PROPERTY_USE_STORED_CREDENTIALS</b> to represent the intranet authentication target which is permitted to use stored credentials.
     * @type {Integer}
     */
    Target {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
