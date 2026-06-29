#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Is used to store and retrieve opaque data blobs.
 * @remarks
 * The <b>PrivateData</b> structure is used to store state information for the NapAgent and enforcement clients. It is queried and set by the <a href="https://docs.microsoft.com/windows/desktop/NAP/inapsystemhealthvalidationrequest">INapSystemHealthValidationRequest</a> and <a href="https://docs.microsoft.com/windows/desktop/NAP/inapenforcementclientconnection">INapEnforcementClientConnection</a> interfaces.
 * @see https://learn.microsoft.com/windows/win32/api/naptypes/ns-naptypes-privatedata
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 */
export default struct PrivateData {
    #StructPack 8

    /**
     * The size, in bytes,  of  <b>data</b> in the range 0 to <a href="https://docs.microsoft.com/windows/desktop/NAP/nap-type-constants">maxPrivateDataSize</a>.
     */
    size : UInt16

    /**
     * A pointer to the opaque data blob.
     */
    data : IntPtr

}
