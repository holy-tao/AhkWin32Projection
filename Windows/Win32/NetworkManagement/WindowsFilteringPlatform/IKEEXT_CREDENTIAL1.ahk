#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Is used to store credential information used for the authentication.
 * @see https://docs.microsoft.com/windows/win32/api//iketypes/ns-iketypes-ikeext_credential1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_CREDENTIAL1 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type of authentication method.
     * 
     * See <a href="https://docs.microsoft.com/windows/win32/api/iketypes/ne-iketypes-ikeext_authentication_method_type">IKEEXT_AUTHENTICATION_METHOD_TYPE</a> for more information.
     * @type {Integer}
     */
    authenticationMethodType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type of impersonation.
     * 
     * See <a href="https://docs.microsoft.com/windows/win32/api/iketypes/ne-iketypes-ikeext_authentication_impersonation_type">IKEEXT_AUTHENTICATION_IMPERSONATION_TYPE</a> for more information.
     * @type {Integer}
     */
    impersonationType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Pointer<IKEEXT_PRESHARED_KEY_AUTHENTICATION1>}
     */
    presharedKey {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<IKEEXT_CERTIFICATE_CREDENTIAL1>}
     */
    certificate {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<IKEEXT_NAME_CREDENTIAL0>}
     */
    name {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
