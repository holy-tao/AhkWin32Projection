#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include ..\..\..\Foundation\FILETIME.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_NTLM_TARGETINFO extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    MsvAvNbComputerName{
        get {
            if(!this.HasProp("__MsvAvNbComputerName"))
                this.__MsvAvNbComputerName := PWSTR(this.ptr + 8)
            return this.__MsvAvNbComputerName
        }
    }

    /**
     * @type {PWSTR}
     */
    MsvAvNbDomainName{
        get {
            if(!this.HasProp("__MsvAvNbDomainName"))
                this.__MsvAvNbDomainName := PWSTR(this.ptr + 16)
            return this.__MsvAvNbDomainName
        }
    }

    /**
     * @type {PWSTR}
     */
    MsvAvDnsComputerName{
        get {
            if(!this.HasProp("__MsvAvDnsComputerName"))
                this.__MsvAvDnsComputerName := PWSTR(this.ptr + 24)
            return this.__MsvAvDnsComputerName
        }
    }

    /**
     * @type {PWSTR}
     */
    MsvAvDnsDomainName{
        get {
            if(!this.HasProp("__MsvAvDnsDomainName"))
                this.__MsvAvDnsDomainName := PWSTR(this.ptr + 32)
            return this.__MsvAvDnsDomainName
        }
    }

    /**
     * @type {PWSTR}
     */
    MsvAvDnsTreeName{
        get {
            if(!this.HasProp("__MsvAvDnsTreeName"))
                this.__MsvAvDnsTreeName := PWSTR(this.ptr + 40)
            return this.__MsvAvDnsTreeName
        }
    }

    /**
     * @type {Integer}
     */
    MsvAvFlags {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {FILETIME}
     */
    MsvAvTimestamp{
        get {
            if(!this.HasProp("__MsvAvTimestamp"))
                this.__MsvAvTimestamp := FILETIME(this.ptr + 56)
            return this.__MsvAvTimestamp
        }
    }

    /**
     * @type {PWSTR}
     */
    MsvAvTargetName{
        get {
            if(!this.HasProp("__MsvAvTargetName"))
                this.__MsvAvTargetName := PWSTR(this.ptr + 64)
            return this.__MsvAvTargetName
        }
    }
}
