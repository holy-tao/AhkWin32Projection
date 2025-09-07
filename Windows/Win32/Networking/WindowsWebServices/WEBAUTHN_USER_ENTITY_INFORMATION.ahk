#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Information about a user entity.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_user_entity_information
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WEBAUTHN_USER_ENTITY_INFORMATION extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Version of this structure, to allow for modifications in the future. This field is required and should be set to **CURRENT_VERSION**.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of **pbId**.
     * @type {Integer}
     */
    cbId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Identifier for the user. This field is required.
     * @type {Pointer<Byte>}
     */
    pbId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Contains a detailed name for this account, such as "john.p.smith@example.com".
     * @type {PWSTR}
     */
    pwszName{
        get {
            if(!this.HasProp("__pwszName"))
                this.__pwszName := PWSTR(this.ptr + 16)
            return this.__pwszName
        }
    }

    /**
     * Optional URL that can be used to retrieve an image containing the user's current avatar or a data URI that contains the image data.
     * @type {PWSTR}
     */
    pwszIcon{
        get {
            if(!this.HasProp("__pwszIcon"))
                this.__pwszIcon := PWSTR(this.ptr + 24)
            return this.__pwszIcon
        }
    }

    /**
     * Contains the friendly name associated with the user account by the Relying Party, such as "John P. Smith".
     * @type {PWSTR}
     */
    pwszDisplayName{
        get {
            if(!this.HasProp("__pwszDisplayName"))
                this.__pwszDisplayName := PWSTR(this.ptr + 32)
            return this.__pwszDisplayName
        }
    }
}
