#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EAP_TYPE.ahk" { EAP_TYPE }

/**
 * Contains a set of function pointers to the EAPHost Peer Method APIs.
 * @remarks
 * Each EAP method DLL must implement the following APIs:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodpeerapis/nf-eapmethodpeerapis-eappeerinitialize">EapPeerInitialize</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodpeerapis/nf-eapmethodpeerapis-eappeerbeginsession">EapPeerBeginSession</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodpeerapis/nf-eapmethodpeerapis-eappeergetidentity">EapPeerGetIdentity</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodpeerapis/nf-eapmethodpeerapis-eappeersetcredentials">EapPeerSetCredentials</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodpeerapis/nf-eapmethodpeerapis-eappeerprocessrequestpacket">EapPeerProcessRequestPacket</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodpeerapis/nf-eapmethodpeerapis-eappeergetresponsepacket">EapPeerGetResponsePacket</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodpeerapis/nf-eapmethodpeerapis-eappeergetresult">EapPeerGetResult</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodpeerapis/nf-eapmethodpeerapis-eappeergetuicontext">EapPeerGetUIContext</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodpeerapis/nf-eapmethodpeerapis-eappeersetuicontext">EapPeerSetUIContext</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodpeerapis/nf-eapmethodpeerapis-eappeergetresponseattributes">EapPeerGetResponseAttributes</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodpeerapis/nf-eapmethodpeerapis-eappeersetresponseattributes">EapPeerSetResponseAttributes</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodpeerapis/nf-eapmethodpeerapis-eappeerendsession">EapPeerEndSession</a>
 * </li>
 * <li><b>EapPeerShutdown</b></li>
 * </ul>
 * These APIs correspond to calls made by a supplicant, and serve as a proxy between the supplicant's API calls and the public APIs exposed on the EAP method DLL. Therefore, when a supplicant makes a call to a peer-based EAPHost to establish an authentication session or to perform an operation during that session, EAPHost calls the corresponding implemented function on the EAP method DLL with the parameter data provided. The EAP method functions are managed by pointers to their respective entry points.
 * 
 * The other functions in the EAP Peer Method API set are called by a peer-based EAPHost without a corresponding supplicant call, and are used for connection validation or user interface raising operations.
 * @see https://learn.microsoft.com/windows/win32/api/eapmethodpeerapis/ns-eapmethodpeerapis-eap_peer_method_routines
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct EAP_PEER_METHOD_ROUTINES {
    #StructPack 8

    /**
     * The implementer-defined structure version.
     * 
     * <div class="alert"><b>Note</b>  Values for this field are not defined by Microsoft.</div>
     * <div> </div>
     */
    dwVersion : UInt32

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_type">EAP_TYPE</a> structure that contains the vendor information on the implementer of the APIs pointed to by the members of this structure.
     */
    pEapType : EAP_TYPE.Ptr

    /**
     * A function pointer for <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodpeerapis/nf-eapmethodpeerapis-eappeerinitialize">EapPeerInitialize</a>.
     */
    EapPeerInitialize : IntPtr

    /**
     * A function pointer for <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodpeerapis/nf-eapmethodpeerapis-eappeergetidentity">EapPeerGetIdentity</a>.
     */
    EapPeerGetIdentity : IntPtr

    /**
     * A function pointer for <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodpeerapis/nf-eapmethodpeerapis-eappeerbeginsession">EapPeerBeginSession</a>.
     */
    EapPeerBeginSession : IntPtr

    /**
     * A function pointer for <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodpeerapis/nf-eapmethodpeerapis-eappeersetcredentials">EapPeerSetCredentials</a>.
     */
    EapPeerSetCredentials : IntPtr

    /**
     * A function pointer for <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodpeerapis/nf-eapmethodpeerapis-eappeerprocessrequestpacket">EapPeerProcessRequestPacket</a>.
     */
    EapPeerProcessRequestPacket : IntPtr

    /**
     * A function pointer for <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodpeerapis/nf-eapmethodpeerapis-eappeergetresponsepacket">EapPeerGetResponsePacket</a>.
     */
    EapPeerGetResponsePacket : IntPtr

    /**
     * A function pointer for <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodpeerapis/nf-eapmethodpeerapis-eappeergetresult">EapPeerGetResult</a>.
     */
    EapPeerGetResult : IntPtr

    /**
     * A function pointer for <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodpeerapis/nf-eapmethodpeerapis-eappeergetuicontext">EapPeerGetUIContext</a>.
     */
    EapPeerGetUIContext : IntPtr

    /**
     * A function pointer for <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodpeerapis/nf-eapmethodpeerapis-eappeersetuicontext">EapPeerSetUIContext</a>.
     */
    EapPeerSetUIContext : IntPtr

    /**
     * A function pointer for <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodpeerapis/nf-eapmethodpeerapis-eappeergetresponseattributes">EapPeerGetResponseAttributes</a>.
     */
    EapPeerGetResponseAttributes : IntPtr

    /**
     * A function pointer for <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodpeerapis/nf-eapmethodpeerapis-eappeersetresponseattributes">EapPeerSetResponseAttributes</a>.
     */
    EapPeerSetResponseAttributes : IntPtr

    /**
     * A function pointer for <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodpeerapis/nf-eapmethodpeerapis-eappeerendsession">EapPeerEndSession</a>.
     */
    EapPeerEndSession : IntPtr

    /**
     * A function pointer for <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodpeerapis/nf-eapmethodpeerapis-eappeershutdown">EapPeerShutdown</a>.
     */
    EapPeerShutdown : IntPtr

}
