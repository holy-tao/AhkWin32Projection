#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
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
                this.__interfaceCapabilities := WLAN_QOS_CAPABILITIES(this.ptr + 0)
            return this.__interfaceCapabilities
        }
    }

    /**
     * @type {BOOL}
     */
    bConnected{
        get {
            if(!this.HasProp("__bConnected"))
                this.__bConnected := BOOL(this.ptr + 16)
            return this.__bConnected
        }
    }

    /**
     * @type {WLAN_CONNECTION_QOS_INFO}
     */
    connectionQoSInfo{
        get {
            if(!this.HasProp("__connectionQoSInfo"))
                this.__connectionQoSInfo := WLAN_CONNECTION_QOS_INFO(this.ptr + 24)
            return this.__connectionQoSInfo
        }
    }
}
