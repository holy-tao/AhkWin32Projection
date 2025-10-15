#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include .\NS_INFOA.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 * @charset Unicode
 */
class NETRESOURCE2W extends Win32Struct
{
    static sizeof => 80

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
     * @type {PWSTR}
     */
    lpLocalName{
        get {
            if(!this.HasProp("__lpLocalName"))
                this.__lpLocalName := PWSTR(this.ptr + 16)
            return this.__lpLocalName
        }
    }

    /**
     * @type {PWSTR}
     */
    lpRemoteName{
        get {
            if(!this.HasProp("__lpRemoteName"))
                this.__lpRemoteName := PWSTR(this.ptr + 24)
            return this.__lpRemoteName
        }
    }

    /**
     * @type {PWSTR}
     */
    lpComment{
        get {
            if(!this.HasProp("__lpComment"))
                this.__lpComment := PWSTR(this.ptr + 32)
            return this.__lpComment
        }
    }

    /**
     * @type {NS_INFOA}
     */
    ns_info{
        get {
            if(!this.HasProp("__ns_info"))
                this.__ns_info := NS_INFOA(this.ptr + 40)
            return this.__ns_info
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    ServiceType {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    dwProtocols {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Pointer<Int32>}
     */
    lpiProtocols {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }
}
