#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MSV1_0_PROTOCOL_MESSAGE_TYPE.ahk" { MSV1_0_PROTOCOL_MESSAGE_TYPE }

/**
 * Contains the response from a subauthentication package.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-msv1_0_subauth_response
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct MSV1_0_SUBAUTH_RESPONSE {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-msv1_0_protocol_message_type">MSV1_0_PROTOCOL_MESSAGE_TYPE</a> value identifying the type of request being made. This member must be set to <b>MsV1_0SubAuth</b>.
     */
    MessageType : MSV1_0_PROTOCOL_MESSAGE_TYPE

    /**
     * Indicates the length, in bytes, of the buffer returned by <b>SubAuthReturnBuffer</b>.
     */
    SubAuthInfoLength : UInt32

    /**
     * Contains the subauthentication package response. The format and content of this buffer is specific to the subauthentication package. For more information, see the documentation for specific subauthentication packages.
     */
    SubAuthReturnBuffer : IntPtr

}
