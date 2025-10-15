#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_QOS_CAPABILITIES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    bMSCSSupported{
        get {
            if(!this.HasProp("__bMSCSSupported"))
                this.__bMSCSSupported := BOOL(this.ptr + 0)
            return this.__bMSCSSupported
        }
    }

    /**
     * @type {BOOL}
     */
    bDSCPToUPMappingSupported{
        get {
            if(!this.HasProp("__bDSCPToUPMappingSupported"))
                this.__bDSCPToUPMappingSupported := BOOL(this.ptr + 4)
            return this.__bDSCPToUPMappingSupported
        }
    }

    /**
     * @type {BOOL}
     */
    bSCSSupported{
        get {
            if(!this.HasProp("__bSCSSupported"))
                this.__bSCSSupported := BOOL(this.ptr + 8)
            return this.__bSCSSupported
        }
    }

    /**
     * @type {BOOL}
     */
    bDSCPPolicySupported{
        get {
            if(!this.HasProp("__bDSCPPolicySupported"))
                this.__bDSCPPolicySupported := BOOL(this.ptr + 12)
            return this.__bDSCPPolicySupported
        }
    }
}
