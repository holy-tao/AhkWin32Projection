#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * Contains information about a resource that is being brought online or taken offline. This structure is used as a parameter to the callback function SetResourceStatusEx.
 * @see https://docs.microsoft.com/windows/win32/api//resapi/ns-resapi-resource_status_ex
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class RESOURCE_STATUS_EX extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_resource_state">CLUSTER_RESOURCE_STATE</a> enumeration value that describes the state of the resource.
     * @type {Integer}
     */
    ResourceState {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A value set by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-dlls">resource DLL</a> to flag a status 
     *       report as new.
     * @type {Integer}
     */
    CheckPoint {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A handle to an event that indicates when the resource has failed.
     * @type {HANDLE}
     */
    EventHandle{
        get {
            if(!this.HasProp("__EventHandle"))
                this.__EventHandle := HANDLE(8, this)
            return this.__EventHandle
        }
    }

    /**
     * TBD
     * @type {Integer}
     */
    ApplicationSpecificErrorCode {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * 
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * This member is not being used at this time.
     * 
     * <b>Windows Server 2012:  </b>This member was added in Windows Server 2012 R2.
     * @type {Integer}
     */
    WaitHint {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
