#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DS_REPL_VALUE_META_DATA_EXT extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pszAttributeName{
        get {
            if(!this.HasProp("__pszAttributeName"))
                this.__pszAttributeName := PWSTR(this.ptr + 0)
            return this.__pszAttributeName
        }
    }

    /**
     * @type {PWSTR}
     */
    pszObjectDn{
        get {
            if(!this.HasProp("__pszObjectDn"))
                this.__pszObjectDn := PWSTR(this.ptr + 8)
            return this.__pszObjectDn
        }
    }

    /**
     * @type {Integer}
     */
    cbData {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbData {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {FILETIME}
     */
    ftimeDeleted{
        get {
            if(!this.HasProp("__ftimeDeleted"))
                this.__ftimeDeleted := FILETIME(this.ptr + 32)
            return this.__ftimeDeleted
        }
    }

    /**
     * @type {FILETIME}
     */
    ftimeCreated{
        get {
            if(!this.HasProp("__ftimeCreated"))
                this.__ftimeCreated := FILETIME(this.ptr + 40)
            return this.__ftimeCreated
        }
    }

    /**
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {FILETIME}
     */
    ftimeLastOriginatingChange{
        get {
            if(!this.HasProp("__ftimeLastOriginatingChange"))
                this.__ftimeLastOriginatingChange := FILETIME(this.ptr + 56)
            return this.__ftimeLastOriginatingChange
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    uuidLastOriginatingDsaInvocationID {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    usnOriginatingChange {
        get => NumGet(this, 72, "int64")
        set => NumPut("int64", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    usnLocalChange {
        get => NumGet(this, 80, "int64")
        set => NumPut("int64", value, this, 80)
    }

    /**
     * @type {PWSTR}
     */
    pszLastOriginatingDsaDN{
        get {
            if(!this.HasProp("__pszLastOriginatingDsaDN"))
                this.__pszLastOriginatingDsaDN := PWSTR(this.ptr + 88)
            return this.__pszLastOriginatingDsaDN
        }
    }

    /**
     * @type {Integer}
     */
    dwUserIdentifier {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    dwPriorLinkState {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * @type {Integer}
     */
    dwCurrentLinkState {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }
}
