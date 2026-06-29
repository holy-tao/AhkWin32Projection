#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PNRP_CLOUD_STATE.ahk
#Include .\PNRP_CLOUD_ID.ahk
#Include .\PNRP_SCOPE.ahk
#Include .\PNRP_CLOUD_FLAGS.ahk

/**
 * The PNRPCLOUDINFO structure is pointed to by the lpBlob member of the WSAQUERYSET structure.
 * @see https://learn.microsoft.com/windows/win32/api/pnrpns/ns-pnrpns-pnrpcloudinfo
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
class PNRPCLOUDINFO extends Win32Struct {
    static sizeof => 24

    static packingSize => 4

    /**
     * Specifies the size of this structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the network cloud information stored in a <a href="https://docs.microsoft.com/windows/desktop/api/pnrpdef/ns-pnrpdef-pnrp_cloud_id">PNRP_CLOUD_ID</a> structure.
     * @type {PNRP_CLOUD_ID}
     */
    Cloud {
        get {
            if(!this.HasProp("__Cloud"))
                this.__Cloud := PNRP_CLOUD_ID(4, this)
            return this.__Cloud
        }
    }

    /**
     * Specifies the state of the network cloud. Valid values are specified by <a href="https://docs.microsoft.com/windows/desktop/api/pnrpdef/ne-pnrpdef-pnrp_cloud_state">PNRP_CLOUD_STATE</a>.
     * @type {PNRP_CLOUD_STATE}
     */
    enCloudState {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Indicates if the cloud name is valid on the network or only valid on the current computer. Valid values are specified by <a href="https://docs.microsoft.com/windows/desktop/api/pnrpdef/ne-pnrpdef-pnrp_cloud_flags">PNRP_CLOUD_FLAGS</a>.
     * @type {PNRP_CLOUD_FLAGS}
     */
    enCloudFlags {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
