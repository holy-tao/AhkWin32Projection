#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NS_INFOA.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @charset ANSI
 */
class NETRESOURCE2A extends Win32Struct {
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwScope {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwUsage {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwDisplayType {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {PSTR}
     */
    lpLocalName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {PSTR}
     */
    lpRemoteName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {PSTR}
     */
    lpComment {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {NS_INFOA}
     */
    ns_info {
        get {
            if(!this.HasProp("__ns_info"))
                this.__ns_info := NS_INFOA(40, this)
            return this.__ns_info
        }
    }

    /**
     * @type {Guid}
     */
    ServiceType {
        get {
            if(!this.HasProp("__ServiceType"))
                this.__ServiceType := Guid(56, this)
            return this.__ServiceType
        }
    }

    /**
     * @type {Integer}
     */
    dwProtocols {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Pointer<Integer>}
     */
    lpiProtocols {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }
}
