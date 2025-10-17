#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WLAN_QOS_CAPABILITIES.ahk
#Include .\WLAN_CONNECTION_QOS_INFO.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_QOS_INFO extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {WLAN_QOS_CAPABILITIES}
     */
    interfaceCapabilities{
        get {
            if(!this.HasProp("__interfaceCapabilities"))
                this.__interfaceCapabilities := WLAN_QOS_CAPABILITIES(0, this)
            return this.__interfaceCapabilities
        }
    }

    /**
     * @type {BOOL}
     */
    bConnected {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {WLAN_CONNECTION_QOS_INFO}
     */
    connectionQoSInfo{
        get {
            if(!this.HasProp("__connectionQoSInfo"))
                this.__connectionQoSInfo := WLAN_CONNECTION_QOS_INFO(24, this)
            return this.__connectionQoSInfo
        }
    }
}
