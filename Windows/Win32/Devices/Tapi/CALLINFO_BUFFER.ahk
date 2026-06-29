#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The CALLINFO_BUFFER enum indicates the type of buffer accessed by the ITCallInfo::GetCallInfoBuffer method or the ITCallInfo::SetCallInfoBuffer method.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/ne-tapi3if-callinfo_buffer
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct CALLINFO_BUFFER {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The user-user information buffer allows an application to send information to the remote party on a call or receive information from that party.
     * @type {Integer (Int32)}
     */
    static CIB_USERUSERINFO => 0

    /**
     * The device-specific buffer allows an application to communicate with a TSP concerning device-specific capabilities. The precise nature of these capabilities depends on the implementation of the service provider.
     * @type {Integer (Int32)}
     */
    static CIB_DEVSPECIFICBUFFER => 1

    /**
     * The call data buffer allows an application to communicate with a TSP concerning a specific call. The precise nature of this information depends on the implementation of the service provider.
     * @type {Integer (Int32)}
     */
    static CIB_CALLDATABUFFER => 2

    /**
     * The charging information buffer's format is specified by other standards (ISDN Q.931).
     * @type {Integer (Int32)}
     */
    static CIB_CHARGINGINFOBUFFER => 3

    /**
     * The high-level compatibility buffer's format is specified by other standards (ISDN Q.931).
     * @type {Integer (Int32)}
     */
    static CIB_HIGHLEVELCOMPATIBILITYBUFFER => 4

    /**
     * The low-level compatibility buffer's format is specified by other standards (ISDN Q.931).
     * @type {Integer (Int32)}
     */
    static CIB_LOWLEVELCOMPATIBILITYBUFFER => 5
}
