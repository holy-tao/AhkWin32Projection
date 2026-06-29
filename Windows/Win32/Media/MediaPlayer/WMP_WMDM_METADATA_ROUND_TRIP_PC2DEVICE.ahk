#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WMP_WMDM_METADATA_ROUND_TRIP_PC2DEVICE structure is used by Windows Media Player to request accelerated metadata synchronization information from portable devices that do not support MTP.
 * @see https://learn.microsoft.com/windows/win32/api/wmpdevices/ns-wmpdevices-wmp_wmdm_metadata_round_trip_pc2device
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct WMP_WMDM_METADATA_ROUND_TRIP_PC2DEVICE {
    #StructPack 4

    /**
     * The transaction identifier supplied by the device during the previous session. This value is zero for the first session ever.
     */
    dwChangesSinceTransactionID : UInt32

    /**
     * The index of the first value to retrieve. This value is always zero for the first call of a session.
     */
    dwResultSetStartingIndex : UInt32

}
