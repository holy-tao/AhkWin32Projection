#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the source of a failure.
 * @see https://learn.microsoft.com/windows/win32/api/naptypes/ne-naptypes-failurecategory
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 */
class FailureCategory extends Win32Enum {

    /**
     * No failure.
     * Native name: failureCategoryNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * A failure which is not due to client or server components or communications.
     * Native name: failureCategoryOther
     * @type {Integer (Int32)}
     */
    static Other => 1

    /**
     * Failure due to client component.
     * Native name: failureCategoryClientComponent
     * @type {Integer (Int32)}
     */
    static ClientComponent => 2

    /**
     * Failure due to client communication.
     * Native name: failureCategoryClientCommunication
     * @type {Integer (Int32)}
     */
    static ClientCommunication => 3

    /**
     * Failure due to server component.
     * Native name: failureCategoryServerComponent
     * @type {Integer (Int32)}
     */
    static ServerComponent => 4

    /**
     * Failure due to server communication.
     * Native name: failureCategoryServerCommunication
     * @type {Integer (Int32)}
     */
    static ServerCommunication => 5
}
