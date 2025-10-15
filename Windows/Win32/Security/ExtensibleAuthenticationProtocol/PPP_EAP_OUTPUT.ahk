#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * The authentication protocol uses the PPP_EAP_OUTPUT structure to communicate requests and status information to the Connection Manager on return from calls to RasEapMakeMessage.
 * @remarks
 * 
  * Use the 
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa363532(v=vs.85)">RasEapMakeMessage</a> function to pass the 
  * <b>PPP_EAP_OUTPUT</b> structure between the authentication protocol and the Connection Manager.
  * 
  * The authentication protocol can use the 
  * <b>PPP_EAP_OUTPUT</b> structure to return the Microsoft Point-to-Point Encryption (MPPE) session keys. The authentication protocol  must place the session keys in the value field of a sub-attribute contained within the value field of an attribute of type <b>raatVendorSpecific</b> (see 
  * <a href="https://docs.microsoft.com/windows/win32/api/raseapif/ne-raseapif-ras_auth_attribute_type">RAS_AUTH_ATTRIBUTE_TYPE</a>). The sub-attribute should have a Vendor-ID of 311 (Microsoft) and Vendor-Type of MS-MPPE-Recv-Keys (17) and MS-MPPE-Send-Keys (16). The authentication protocol must set the <b>pUserAttributes</b> member to point to the <b>raatVendorSpecific</b> attribute, and set the <b>Action</b> member to <b>EAPACTION_Done</b> or <b>EAPACTION_SendAndDone</b>. For more information about the format of the MPPE sub-attribute see 
  * <a href="https://www.ietf.org/rfc/rfc2548.txt">Microsoft Vendor-specific RADIUS Attributes</a>. For more information about attribute formats see 
  * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a>, 
  * <a href="https://docs.microsoft.com/windows/win32/api/raseapif/ne-raseapif-ras_auth_attribute_type">RAS_AUTH_ATTRIBUTE_TYPE</a>, and 
  * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a>.
  * 
  * <div class="alert"><b>Note</b>  When formatting attributes for encryption keys, it is strongly recommended that you  use MSCHAPv2 and its MS-MPPE-Recv-Keys and MS-MPPE-Send-Keys,  which create <i>strong encryption</i> rather than  MSCHAPv1 and its MS-CHAP-MPPE-Keys.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//raseapif/ns-raseapif-ppp_eap_output
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class PPP_EAP_OUTPUT extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * Specifies the size of this structure.
     * @type {Integer}
     */
    dwSizeInBytes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ne-raseapif-ppp_eap_action">PPP_EAP_ACTION</a> value. The Connection Manager carries out this action on behalf of the authentication protocol.
     * @type {Integer}
     */
    Action {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Specifies whether authentication was successful. Any nonzero value for <b>dwAuthResultCode</b> indicates failure. The failure code must come from Winerror.h, Raserror.h or Mprerror.h. This member is valid only if the <b>Action</b> member has a value of <b>EAPACTION_Done</b> or <b>EAPACTION_SendAndDone</b>.
     * @type {Integer}
     */
    dwAuthResultCode {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Pointer to an optional array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/raseapif/ns-raseapif-ras_auth_attribute">RAS_AUTH_ATTRIBUTE</a> structures. The array is terminated by a structure with an <b>raaType</b> member that has a value of <b>raatMinimum</b> (see 
     * <a href="https://docs.microsoft.com/windows/win32/api/raseapif/ne-raseapif-ras_auth_attribute_type">RAS_AUTH_ATTRIBUTE_TYPE</a>). 
     * 
     * 
     * 
     * 
     * This member should be set on the authenticator side when <b>Action</b> is <b>EAPACTION_Authenticate</b>, or when <b>Action</b> is <b>EAPACTION_Done</b> or <b>EAPACTION_SendAndDone</b> and <b>dwAuthResultCode</b> is zero.
     * 
     * When <b>Action</b> is <b>EAPACTION_Authenticate</b>, the array may contain additional attributes necessary to authenticate the user, e.g. the user-password. If the authentication protocol passes in only the user name, RAS does not invoke the authentication provider to authenticate the user, Instead, RAS just passes back the current attributes for the user.
     * 
     * When <b>Action</b> is <b>EAPACTION_Done</b> or <b>EAPACTION_SendAndDone</b>, and <b>dwAuthResultCode</b> is zero, the array may contain additional attributes to assign to the user. These attributes overwrite any attributes of the same type returned by the authentication provider.
     * 
     * The authentication protocol frees this memory in its 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa363521(v=vs.85)">RasEapEnd</a> function.
     * @type {Pointer<RAS_AUTH_ATTRIBUTE>}
     */
    pUserAttributes {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Specifies whether RAS should invoke the authentication protocol's interactive UI. If the authentication protocol sets this member to <b>TRUE</b>, RAS invokes the interactive UI, by calling the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/raseapif/nf-raseapif-raseapinvokeinteractiveui">RasEapInvokeInteractiveUI</a> function provided by the authentication protocol.
     * @type {BOOL}
     */
    fInvokeInteractiveUI{
        get {
            if(!this.HasProp("__fInvokeInteractiveUI"))
                this.__fInvokeInteractiveUI := BOOL(this.ptr + 24)
            return this.__fInvokeInteractiveUI
        }
    }

    /**
     * Pointer to context data that RAS should pass in the call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/raseapif/nf-raseapif-raseapinvokeinteractiveui">RasEapInvokeInteractiveUI</a>. The authentication protocol should free this memory in its implementation of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa363521(v=vs.85)">RasEapEnd</a>.
     * @type {Pointer<Byte>}
     */
    pUIContextData {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Specifies the size of the context data that RAS should pass in the call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/raseapif/nf-raseapif-raseapinvokeinteractiveui">RasEapInvokeInteractiveUI</a>.
     * @type {Integer}
     */
    dwSizeOfUIContextData {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Specifies whether RAS should save the information pointed to by the <b>pConnectionData</b> member. If <b>fSaveConnectionData</b> is <b>TRUE</b>, RAS will save the data in the phone book. Only valid for the process that is being authenticated.
     * @type {BOOL}
     */
    fSaveConnectionData{
        get {
            if(!this.HasProp("__fSaveConnectionData"))
                this.__fSaveConnectionData := BOOL(this.ptr + 44)
            return this.__fSaveConnectionData
        }
    }

    /**
     * Identifies data specific to the connection, that is, data not specific to any particular user. If the <b>fSaveConnectionData</b> member is <b>TRUE</b>, RAS saves the connection data in the phone book. The authentication protocol should free the memory occupied by this data during the call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa363521(v=vs.85)">RasEapEnd</a>.
     * @type {Pointer<Byte>}
     */
    pConnectionData {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Specifies the size, in bytes, of the data pointed to by the <b>pConnectionData</b> member.
     * @type {Integer}
     */
    dwSizeOfConnectionData {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Specifies whether RAS should save the user data pointed to by the <b>pUserData</b> member. If this parameter is <b>TRUE</b>, RAS saves the user-specific data in the registry under <b>HKEY_CURRENT_USER</b>.
     * @type {BOOL}
     */
    fSaveUserData{
        get {
            if(!this.HasProp("__fSaveUserData"))
                this.__fSaveUserData := BOOL(this.ptr + 60)
            return this.__fSaveUserData
        }
    }

    /**
     * Pointer to user data that RAS should save in the registry. RAS saves this data in the registry under <b>HKEY_CURRENT_USER</b>. The authentication protocol should free this memory during the call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa363521(v=vs.85)">RasEapEnd</a>.
     * @type {Pointer<Byte>}
     */
    pUserData {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Specifies the size in bytes of the data pointed to by <b>pUserData</b>.
     * @type {Integer}
     */
    dwSizeOfUserData {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * 
     * @type {Pointer<NgcTicketContext>}
     */
    pNgcKerbTicket {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * 
     * @type {BOOL}
     */
    fSaveToCredMan{
        get {
            if(!this.HasProp("__fSaveToCredMan"))
                this.__fSaveToCredMan := BOOL(this.ptr + 88)
            return this.__fSaveToCredMan
        }
    }
}
