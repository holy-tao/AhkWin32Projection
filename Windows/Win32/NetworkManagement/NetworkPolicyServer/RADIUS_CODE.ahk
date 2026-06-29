#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The RADIUS_CODE enumeration type enumerates the possible RADIUS packet codes.
 * @see https://learn.microsoft.com/windows/win32/api/authif/ne-authif-radius_code
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 */
export default struct RADIUS_CODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The packet type is unrecognized. This is used to indicate that the disposition of a request is not being set by this extension DLL.
     * @type {Integer (Int32)}
     */
    static rcUnknown => 0

    /**
     * RADIUS Access-Request packet. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static rcAccessRequest => 1

    /**
     * RADIUS Access-Accept packet. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static rcAccessAccept => 2

    /**
     * RADIUS Access-Reject packet. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static rcAccessReject => 3

    /**
     * RADIUS Accounting-Request packet. See 
     * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a> for more information.
     * @type {Integer (Int32)}
     */
    static rcAccountingRequest => 4

    /**
     * RADIUS Accounting-Response packet. See 
     * <a href="https://www.ietf.org/rfc/rfc2866.txt">RFC 2866</a> for more information.
     * @type {Integer (Int32)}
     */
    static rcAccountingResponse => 5

    /**
     * RADIUS Access-Challenge packet. See 
     * <a href="https://www.ietf.org/rfc/rfc2865.txt">RFC 2865</a> for more information.
     * @type {Integer (Int32)}
     */
    static rcAccessChallenge => 11

    /**
     * The packet was discarded.
     * @type {Integer (Int32)}
     */
    static rcDiscard => 256
}
