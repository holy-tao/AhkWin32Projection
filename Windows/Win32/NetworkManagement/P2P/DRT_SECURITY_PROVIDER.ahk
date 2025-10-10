#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * DRT_SECURITY_PROVIDER structure defines the DRT interface that must be implemented by a security provider.
 * @see https://docs.microsoft.com/windows/win32/api//drt/ns-drt-drt_security_provider
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class DRT_SECURITY_PROVIDER extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * This member is specified by the application when passing the <b>DRT_SECURITY_PROVIDER</b> structure to the <a href="https://docs.microsoft.com/windows/desktop/api/drt/nf-drt-drtopen">DrtOpen</a> function.
     * 
     * The DRT treats it as an opaque pointer, and passes it as the first parameter to the functions referenced by this structure. An application will use this as a pointer to the security provider state or to the object that implements the security provider functionality.
     * @type {Pointer<Void>}
     */
    pvContext {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Increments the count of references for the Security Provider with a set of DRTs.
     * @type {Pointer}
     */
    Attach {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Decrements the count of references for the Security Provider with a set of DRTs.
     * @type {Pointer}
     */
    Detach {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Called to register a key with the Security Provider.
     * @type {Pointer}
     */
    RegisterKey {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Called to deregister a key with the Security Provider.
     * @type {Pointer}
     */
    UnregisterKey {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Called when an Authority message is received on the wire. It is responsible for validating the data received, and for unpacking the service addresses, revoked flag, and nonce from the Secured Address Payload.
     * @type {Pointer}
     */
    ValidateAndUnpackPayload {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Called when an Authority message is about to be sent on the wire. It is responsible for securing the data before it is sent, and for packing the service addresses, revoked flag, nonce, and other application data into the Secured Address Payload.
     * @type {Pointer}
     */
    SecureAndPackPayload {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Called to release resources previously allocated for a security provider function.
     * @type {Pointer}
     */
    FreeData {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Called when the DRT sends a message containing data that must be encrypted. This function is only called when the DRT is operating in the <b>DRT_SECURE_CONFIDENTIALPAYLOAD</b> security mode defined by <a href="https://docs.microsoft.com/windows/desktop/api/drt/ne-drt-drt_security_mode">DRT_SECURITY_MODE</a>.
     * @type {Pointer}
     */
    EncryptData {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Called when the DRT receives a message containing encrypted data. This function is only called when the DRT is operating in the <b>DRT_SECURE_CONFIDENTIALPAYLOAD</b> security mode defined by <a href="https://docs.microsoft.com/windows/desktop/api/drt/ne-drt-drt_security_mode">DRT_SECURITY_MODE</a>.
     * @type {Pointer}
     */
    DecryptData {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Called when the DRT must provide a credential used to authorize the local node. This function is only called when the DRT is operating in the <b>DRT_SECURE_MEMBERSHIP</b> and <b>DRT_SECURE_CONFIDENTIALPAYLOAD</b> security modes defined by <a href="https://docs.microsoft.com/windows/desktop/api/drt/ne-drt-drt_security_mode">DRT_SECURITY_MODE</a>.
     * @type {Pointer}
     */
    GetSerializedCredential {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Called when the DRT must validate a credential provided by a peer node.
     * @type {Pointer}
     */
    ValidateRemoteCredential {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Called when the DRT must sign a data blob for inclusion in a DRT protocol message. This function is only called when the DRT is operating in the <b>DRT_SECURE_MEMBERSHIP</b> and <b>DRT_SECURE_CONFIDENTIALPAYLOAD</b> security modes defined by <a href="https://docs.microsoft.com/windows/desktop/api/drt/ne-drt-drt_security_mode">DRT_SECURITY_MODE</a>.
     * @type {Pointer}
     */
    SignData {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * Called when the DRT must verify a signature calculated over a block of data included in a DRT message. This function is only called when the DRT is operating in the <b>DRT_SECURE_MEMBERSHIP</b> and <b>DRT_SECURE_CONFIDENTIALPAYLOAD</b> security modes defined by <a href="https://docs.microsoft.com/windows/desktop/api/drt/ne-drt-drt_security_mode">DRT_SECURITY_MODE</a>.
     * @type {Pointer}
     */
    VerifyData {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }
}
