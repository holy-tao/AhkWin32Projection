#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains a list of transactions.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-txfs_list_transactions
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct TXFS_LIST_TRANSACTIONS {
    #StructPack 8

    /**
     * The number of transactions for this resource manager.
     */
    NumberOfTransactions : Int64

    /**
     * The length of the buffer required to hold the complete list of transactions at the time of this call. The number of transactions returned from one call to the next can change depending on the number of active transactions at any given point in time. If this call returns a request for a larger buffer, that size may or may not be adequate for the next call, based on the number of active transactions at the time of the next call.
     */
    BufferSizeRequired : Int64

}
