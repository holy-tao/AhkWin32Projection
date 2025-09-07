#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the source of a failure.
 * @see https://learn.microsoft.com/windows/win32/api/naptypes/ne-naptypes-failurecategory
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 * @version v4.0.30319
 */
class FailureCategory{

    /**
     * No failure.
     * @type {Integer (Int32)}
     */
    static failureCategoryNone => 0

    /**
     * A failure which is not due to client or server components or communications.
     * @type {Integer (Int32)}
     */
    static failureCategoryOther => 1

    /**
     * Failure due to client component.
     * @type {Integer (Int32)}
     */
    static failureCategoryClientComponent => 2

    /**
     * Failure due to client communication.
     * @type {Integer (Int32)}
     */
    static failureCategoryClientCommunication => 3

    /**
     * Failure due to server component.
     * @type {Integer (Int32)}
     */
    static failureCategoryServerComponent => 4

    /**
     * Failure due to server communication.
     * @type {Integer (Int32)}
     */
    static failureCategoryServerCommunication => 5
}
