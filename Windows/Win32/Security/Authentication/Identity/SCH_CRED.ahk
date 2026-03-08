#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Client only.
  * 
  * This flag is the opposite of SCH_CRED_MANUAL_CRED_VALIDATION and is part of the default behavior of Schannel.
 * @see https://learn.microsoft.com/windows/win32/api/schannel/ns-schannel-sch_credentials
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SCH_CRED extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    cCreds {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<Pointer<Void>>}
     */
    paSecret {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Pointer<Void>>}
     */
    paPublic {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    cMappers {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Pointer<Pointer<_HMAPPER>>}
     */
    aphMappers {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
