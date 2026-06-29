#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The PPP_EAP_INFO structure provides information to the Connection Manager about the authentication protocol, including pointers to functions located in the EAP DLL.
 * @remarks
 * A given EAP DLL may implement more than one authentication protocol. Use the <b>dwEapTypeId</b> member to specify for which protocol to retrieve information.
 * @see https://learn.microsoft.com/windows/win32/api/raseapif/ns-raseapif-ppp_eap_info
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct PPP_EAP_INFO {
    #StructPack 8

    /**
     * Specifies the size of the 
     * <b>PPP_EAP_INFO</b> structure. RAS passes in this value to the EAP DLL. The DLL uses this value to determine which version of the 
     * <b>PPP_EAP_INFO</b> structure RAS is using.
     */
    dwSizeInBytes : UInt32

    /**
     * Specifies a particular authentication protocol. This identifier must be unique throughout industry-wide implementation of EAP. The implementer of an authentication protocol must obtain this identifier from the Internet Assigned Numbers Authority (IANA).
     */
    dwEapTypeId : UInt32

    /**
     * Pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa363527(v=vs.85)">RasEapInitialize</a> function for the authentication protocol. The authentication protocol sets the value of this member. The authentication protocol may set this member to <b>NULL</b>, in which case the protocol does not require RAS to call this function.
     */
    RasEapInitialize : IntPtr

    /**
     * Pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa363520(v=vs.85)">RasEapBegin</a> function for the requested authentication protocol. The authentication protocol sets the value of this member. This member may be <b>NULL</b>, in which case, the authentication protocol does not require any initialization. If this member is <b>NULL</b>, RAS ignores the <b>RasEapEnd</b> member.
     */
    RasEapBegin : IntPtr

    /**
     * Pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa363521(v=vs.85)">RasEapEnd</a> function for the authentication protocol. The authentication protocol sets the value of this member.
     */
    RasEapEnd : IntPtr

    /**
     * Pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa363532(v=vs.85)">RasEapMakeMessage</a> function for the requested authentication protocol. The authentication protocol sets the value of this member.
     */
    RasEapMakeMessage : IntPtr

}
