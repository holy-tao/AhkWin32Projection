#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include .\WLAN_QOS_CAPABILITIES.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_CONNECTION_QOS_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {WLAN_QOS_CAPABILITIES}
     */
    peerCapabilities{
        get {
            if(!this.HasProp("__peerCapabilities"))
                this.__peerCapabilities := WLAN_QOS_CAPABILITIES(this.ptr + 0)
            return this.__peerCapabilities
        }
    }

    /**
     * @type {BOOL}
     */
    bMSCSConfigured{
        get {
            if(!this.HasProp("__bMSCSConfigured"))
                this.__bMSCSConfigured := BOOL(this.ptr + 16)
            return this.__bMSCSConfigured
        }
    }

    /**
     * @type {BOOL}
     */
    bDSCPToUPMappingConfigured{
        get {
            if(!this.HasProp("__bDSCPToUPMappingConfigured"))
                this.__bDSCPToUPMappingConfigured := BOOL(this.ptr + 20)
            return this.__bDSCPToUPMappingConfigured
        }
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
