#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains the response from a subauthentication package.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-msv1_0_subauth_response
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class MSV1_0_SUBAUTH_RESPONSE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-msv1_0_protocol_message_type">MSV1_0_PROTOCOL_MESSAGE_TYPE</a> value identifying the type of request being made. This member must be set to <b>MsV1_0SubAuth</b>.
     * @type {Integer}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Indicates the length, in bytes, of the buffer returned by <b>SubAuthReturnBuffer</b>.
     * @type {Integer}
     */
    SubAuthInfoLength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Contains the subauthentication package response. The format and content of this buffer is specific to the subauthentication package. For more information, see the documentation for specific subauthentication packages.
     * @type {Pointer<Integer>}
     */
    SubAuthReturnBuffer {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
