#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IKE_AUTHENTICATION_PRESHARED_KEY.ahk

/**
 * IKE_AUTHENTICATION_INFORMATION structure contains Internet Key Exchange (IKE) authentication information used to establish a secure channel between two key management daemons.
 * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/ns-iscsidsc-ike_authentication_information
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 */
class IKE_AUTHENTICATION_INFORMATION extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ne-iscsidsc-ike_authentication_method">IKE_AUTHENTICATION_METHOD</a> structure that indicates the authentication method.
     * @type {Integer}
     */
    AuthMethod {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {IKE_AUTHENTICATION_PRESHARED_KEY}
     */
    PsKey{
        get {
            if(!this.HasProp("__PsKey"))
                this.__PsKey := IKE_AUTHENTICATION_PRESHARED_KEY(this.ptr + 8)
            return this.__PsKey
        }
    }
}
