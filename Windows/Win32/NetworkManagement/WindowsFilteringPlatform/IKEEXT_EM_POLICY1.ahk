#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Is used to store AuthIP's extended mode negotiation policy.
 * @remarks
 * 
 * Applies only to AuthIP.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//iketypes/ns-iketypes-ikeext_em_policy1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_EM_POLICY1 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Number of authentication methods in the array.
     * @type {Integer}
     */
    numAuthenticationMethods {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * size_is(numAuthenticationMethods)
     * 
     * Array of acceptable authentication methods as specified by [IKEEXT_AUTHENTICATION_METHOD1](/windows/desktop/api/iketypes/ns-iketypes-ikeext_authentication_method1).
     * @type {Pointer<IKEEXT_AUTHENTICATION_METHOD1>}
     */
    authenticationMethods {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type of impersonation.
     * 
     * See <a href="https://docs.microsoft.com/windows/win32/api/iketypes/ne-iketypes-ikeext_authentication_impersonation_type">IKEEXT_AUTHENTICATION_IMPERSONATION_TYPE</a> for more information.
     * @type {Integer}
     */
    initiatorImpersonationType {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
