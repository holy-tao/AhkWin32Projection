#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WLAN_QOS_CAPABILITIES.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_CONNECTION_QOS_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * @type {WLAN_QOS_CAPABILITIES}
     */
    peerCapabilities{
        get {
            if(!this.HasProp("__peerCapabilities"))
                this.__peerCapabilities := WLAN_QOS_CAPABILITIES(0, this)
            return this.__peerCapabilities
        }
    }

    /**
     * @type {BOOL}
     */
    bMSCSConfigured {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {BOOL}
     */
    bDSCPToUPMappingConfigured {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    ulNumConfiguredSCSStreams {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    ulNumConfiguredDSCPPolicies {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
