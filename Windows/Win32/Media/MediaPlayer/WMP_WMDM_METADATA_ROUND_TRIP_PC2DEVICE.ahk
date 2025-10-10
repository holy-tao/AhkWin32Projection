#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WMP_WMDM_METADATA_ROUND_TRIP_PC2DEVICE structure is used by Windows Media Player to request accelerated metadata synchronization information from portable devices that do not support MTP.
 * @see https://docs.microsoft.com/windows/win32/api//wmpdevices/ns-wmpdevices-wmp_wmdm_metadata_round_trip_pc2device
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class WMP_WMDM_METADATA_ROUND_TRIP_PC2DEVICE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The transaction identifier supplied by the device during the previous session. This value is zero for the first session ever.
     * @type {Integer}
     */
    dwChangesSinceTransactionID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The index of the first value to retrieve. This value is always zero for the first call of a session.
     * @type {Integer}
     */
    dwResultSetStartingIndex {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
