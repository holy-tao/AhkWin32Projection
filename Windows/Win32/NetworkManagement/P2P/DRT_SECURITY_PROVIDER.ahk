#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * DRT_SECURITY_PROVIDER structure defines the DRT interface that must be implemented by a security provider.
 * @see https://learn.microsoft.com/windows/win32/api/drt/ns-drt-drt_security_provider
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct DRT_SECURITY_PROVIDER {
    #StructPack 8

    /**
     * This member is specified by the application when passing the <b>DRT_SECURITY_PROVIDER</b> structure to the <a href="https://docs.microsoft.com/windows/desktop/api/drt/nf-drt-drtopen">DrtOpen</a> function.
     * 
     * The DRT treats it as an opaque pointer, and passes it as the first parameter to the functions referenced by this structure. An application will use this as a pointer to the security provider state or to the object that implements the security provider functionality.
     */
    pvContext : IntPtr

    /**
     * Increments the count of references for the Security Provider with a set of DRTs.
     */
    Attach : IntPtr

    /**
     * Decrements the count of references for the Security Provider with a set of DRTs.
     */
    Detach : IntPtr

    /**
     * Called to register a key with the Security Provider.
     */
    RegisterKey : IntPtr

    /**
     * Called to deregister a key with the Security Provider.
     */
    UnregisterKey : IntPtr

    /**
     * Called when an Authority message is received on the wire. It is responsible for validating the data received, and for unpacking the service addresses, revoked flag, and nonce from the Secured Address Payload.
     */
    ValidateAndUnpackPayload : IntPtr

    /**
     * Called when an Authority message is about to be sent on the wire. It is responsible for securing the data before it is sent, and for packing the service addresses, revoked flag, nonce, and other application data into the Secured Address Payload.
     */
    SecureAndPackPayload : IntPtr

    /**
     * Called to release resources previously allocated for a security provider function.
     */
    FreeData : IntPtr

    /**
     * Called when the DRT sends a message containing data that must be encrypted. This function is only called when the DRT is operating in the <b>DRT_SECURE_CONFIDENTIALPAYLOAD</b> security mode defined by <a href="https://docs.microsoft.com/windows/desktop/api/drt/ne-drt-drt_security_mode">DRT_SECURITY_MODE</a>.
     */
    EncryptData : IntPtr

    /**
     * Called when the DRT receives a message containing encrypted data. This function is only called when the DRT is operating in the <b>DRT_SECURE_CONFIDENTIALPAYLOAD</b> security mode defined by <a href="https://docs.microsoft.com/windows/desktop/api/drt/ne-drt-drt_security_mode">DRT_SECURITY_MODE</a>.
     */
    DecryptData : IntPtr

    /**
     * Called when the DRT must provide a credential used to authorize the local node. This function is only called when the DRT is operating in the <b>DRT_SECURE_MEMBERSHIP</b> and <b>DRT_SECURE_CONFIDENTIALPAYLOAD</b> security modes defined by <a href="https://docs.microsoft.com/windows/desktop/api/drt/ne-drt-drt_security_mode">DRT_SECURITY_MODE</a>.
     */
    GetSerializedCredential : IntPtr

    /**
     * Called when the DRT must validate a credential provided by a peer node.
     */
    ValidateRemoteCredential : IntPtr

    /**
     * Called when the DRT must sign a data blob for inclusion in a DRT protocol message. This function is only called when the DRT is operating in the <b>DRT_SECURE_MEMBERSHIP</b> and <b>DRT_SECURE_CONFIDENTIALPAYLOAD</b> security modes defined by <a href="https://docs.microsoft.com/windows/desktop/api/drt/ne-drt-drt_security_mode">DRT_SECURITY_MODE</a>.
     */
    SignData : IntPtr

    /**
     * Called when the DRT must verify a signature calculated over a block of data included in a DRT message. This function is only called when the DRT is operating in the <b>DRT_SECURE_MEMBERSHIP</b> and <b>DRT_SECURE_CONFIDENTIALPAYLOAD</b> security modes defined by <a href="https://docs.microsoft.com/windows/desktop/api/drt/ne-drt-drt_security_mode">DRT_SECURITY_MODE</a>.
     */
    VerifyData : IntPtr

}
