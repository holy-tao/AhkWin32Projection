#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the next action that the WebDAV client should take after a successful call to the DavAuthCallback callback function.
 * @remarks
 * This enumeration provides the values for the <i>NextStep</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/nc-davclnt-pfndavauthcallback">DavAuthCallback</a> callback function.
 * @see https://learn.microsoft.com/windows/win32/api/davclnt/ne-davclnt-authnextstep
 * @namespace Windows.Win32.NetworkManagement.WebDav
 * @version v4.0.30319
 */
class AUTHNEXTSTEP{

    /**
     * Retry the connection request without using the <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/nc-davclnt-pfndavauthcallback">DavAuthCallback</a> callback function. This is the same as the default behavior if no callback function is registered.
     * @type {Integer (Int32)}
     */
    static DefaultBehavior => 0

    /**
     * Retry the connection request using the credentials that were retrieved by the <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/nc-davclnt-pfndavauthcallback">DavAuthCallback</a> function.
     * @type {Integer (Int32)}
     */
    static RetryRequest => 1

    /**
     * Cancel the connection request.
     * @type {Integer (Int32)}
     */
    static CancelRequest => 2
}
