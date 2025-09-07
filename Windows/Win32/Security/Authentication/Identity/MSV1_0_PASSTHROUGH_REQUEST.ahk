#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include .\LSA_UNICODE_STRING.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class MSV1_0_PASSTHROUGH_REQUEST extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Integer}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    DomainName{
        get {
            if(!this.HasProp("__DomainName"))
                this.__DomainName := LSA_UNICODE_STRING(this.ptr + 8)
            return this.__DomainName
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    PackageName{
        get {
            if(!this.HasProp("__PackageName"))
                this.__PackageName := LSA_UNICODE_STRING(this.ptr + 24)
            return this.__PackageName
        }
    }

    /**
     * @type {Integer}
     */
    DataLength {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Pointer<Byte>}
     */
    LogonData {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    Pad {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }
}
