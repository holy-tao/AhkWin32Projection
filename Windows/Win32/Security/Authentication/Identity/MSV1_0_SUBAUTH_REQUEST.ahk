#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information to pass to an subauthentication package.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/ns-ntsecapi-msv1_0_subauth_request
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class MSV1_0_SUBAUTH_REQUEST extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-msv1_0_protocol_message_type">MSV1_0_PROTOCOL_MESSAGE_TYPE</a> value identifying the type of request being made. This member should be set to <b>MsV1_0SubAuth</b> for local subauthentication and <b>MsV1_0GenericPassthrough</b> for subauthentication on the domain controller.
     * @type {Integer}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">subauthentication package</a> identifier. The value of subauthentication package identifiers is established by the creator of the subauthentication package.
     * @type {Integer}
     */
    SubAuthPackageId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Indicates the length, in bytes, of the buffer passed to the subauthentication package in <b>SubAuthSubmitBuffer</b>.
     * @type {Integer}
     */
    SubAuthInfoLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Containing the data to pass to the subauthentication package. The format and content of this data is specific to the subauthentication package. For more information, see the documentation for specific subauthentication packages.
     * @type {Pointer<Integer>}
     */
    SubAuthSubmitBuffer {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
