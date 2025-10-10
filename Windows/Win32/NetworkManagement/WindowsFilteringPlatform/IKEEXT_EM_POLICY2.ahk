#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Is used to store AuthIP's extended mode negotiation policy.
 * @see https://docs.microsoft.com/windows/win32/api//iketypes/ns-iketypes-ikeext_em_policy2
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_EM_POLICY2 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b>UINT32</b>
     * 
     *  Number of authentication methods in the array.
     * @type {Integer}
     */
    numAuthenticationMethods {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: [IKEEXT_AUTHENTICATION_METHOD2](/windows/desktop/api/iketypes/ns-iketypes-ikeext_authentication_method2)*</b>
     * 
     * size_is(numAuthenticationMethods)
     * 
     * Array of acceptable authentication methods.
     * @type {Pointer<IKEEXT_AUTHENTICATION_METHOD2>}
     */
    authenticationMethods {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/iketypes/ne-iketypes-ikeext_authentication_impersonation_type">IKEEXT_AUTHENTICATION_IMPERSONATION_TYPE</a></b>
     * 
     * Type of impersonation.
     * @type {Integer}
     */
    initiatorImpersonationType {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
