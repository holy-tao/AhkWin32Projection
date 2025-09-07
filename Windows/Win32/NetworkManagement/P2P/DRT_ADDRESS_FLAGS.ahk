#Requires AutoHotkey v2.0.0 64-bit

/**
 * DRT_ADDRESS_FLAGS enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/drt/ne-drt-drt_address_flags
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class DRT_ADDRESS_FLAGS{

    /**
     * The response provided by this machine was successfully used to make progress towards the search target.
     * @type {Integer (Int32)}
     */
    static DRT_ADDRESS_FLAG_ACCEPTED => 1

    /**
     * The response provided by this machine was not used in the search.  This machine may have provided the address of a node publishing a key numerically farther from the target than other nodes already contacted.
     * @type {Integer (Int32)}
     */
    static DRT_ADDRESS_FLAG_REJECTED => 2

    /**
     * This machine did not respond.
     * @type {Integer (Int32)}
     */
    static DRT_ADDRESS_FLAG_UNREACHABLE => 4

    /**
     * The response provided by this machine was not used in the search.  This machine provided the address of a node that has already been contacted.
     * @type {Integer (Int32)}
     */
    static DRT_ADDRESS_FLAG_LOOP => 8

    /**
     * This machine indicated that it does not have sufficient resources to process the query.
     * @type {Integer (Int32)}
     */
    static DRT_ADDRESS_FLAG_TOO_BUSY => 16

    /**
     * This machine is not publishing the key expected by the local DRT instance.  As a result, it may not be able to provide useful information.
     * @type {Integer (Int32)}
     */
    static DRT_ADDRESS_FLAG_BAD_VALIDATE_ID => 32

    /**
     * This machine has reason to believe that the target key has been unregistered.
     * @type {Integer (Int32)}
     */
    static DRT_ADDRESS_FLAG_SUSPECT_UNREGISTERED_ID => 64

    /**
     * This machine was asked to provide proof of ownership of its key.
     * @type {Integer (Int32)}
     */
    static DRT_ADDRESS_FLAG_INQUIRE => 128
}
