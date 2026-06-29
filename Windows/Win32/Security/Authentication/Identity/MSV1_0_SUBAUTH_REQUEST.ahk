#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MSV1_0_PROTOCOL_MESSAGE_TYPE.ahk" { MSV1_0_PROTOCOL_MESSAGE_TYPE }

/**
 * Contains information to pass to a subauthentication package.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-msv1_0_subauth_request
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct MSV1_0_SUBAUTH_REQUEST {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-msv1_0_protocol_message_type">MSV1_0_PROTOCOL_MESSAGE_TYPE</a> value identifying the type of request being made. This member should be set to <b>MsV1_0SubAuth</b> for local subauthentication and <b>MsV1_0GenericPassthrough</b> for subauthentication on the domain controller.
     */
    MessageType : MSV1_0_PROTOCOL_MESSAGE_TYPE

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">subauthentication package</a> identifier. The value of subauthentication package identifiers is established by the creator of the subauthentication package.
     */
    SubAuthPackageId : UInt32

    /**
     * Indicates the length, in bytes, of the buffer passed to the subauthentication package in <b>SubAuthSubmitBuffer</b>.
     */
    SubAuthInfoLength : UInt32

    /**
     * Containing the data to pass to the subauthentication package. The format and content of this data is specific to the subauthentication package. For more information, see the documentation for specific subauthentication packages.
     */
    SubAuthSubmitBuffer : IntPtr

}
