#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
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
    pszAttributeName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    pszObjectDn {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    cbData {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<Integer>}
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
                this.__ftimeDeleted := FILETIME(32, this)
            return this.__ftimeDeleted
        }
    }

    /**
     * @type {FILETIME}
     */
    ftimeCreated{
        get {
            if(!this.HasProp("__ftimeCreated"))
                this.__ftimeCreated := FILETIME(40, this)
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
                this.__ftimeLastOriginatingChange := FILETIME(52, this)
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
    pszLastOriginatingDsaDN {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
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
