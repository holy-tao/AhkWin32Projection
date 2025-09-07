#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RESOURCE_FAILURE_INFO.ahk

/**
 * The RESOURCE_FAILURE_INFO_BUFFER structure represents a buffer for a resource failure. (RESOURCE_FAILURE_INFO_BUFFER)
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ns-msclus-resource_failure_info_buffer
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class RESOURCE_FAILURE_INFO_BUFFER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The version of this structure. Set this parameter to <b>RESOURCE_FAILURE_INFO_VERSION_1</b> (0x1).
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-resource_failure_info">RESOURCE_FAILURE_INFO</a> structure that contains information about the failover attempts for the resource failure.
     * @type {RESOURCE_FAILURE_INFO}
     */
    Info{
        get {
            if(!this.HasProp("__Info"))
                this.__Info := RESOURCE_FAILURE_INFO(this.ptr + 8)
            return this.__Info
        }
    }
}
