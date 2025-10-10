#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines values that indicate how to interpret track addresses for the current disc profile of a randomly-writable, hardware-defect-managed media type.
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/ne-imapi2-imapi_read_track_address_type
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IMAPI_READ_TRACK_ADDRESS_TYPE{

    /**
     * Interpret the address field as an LBA (sector address).  The returned data should reflect the information for the track which contains the specified LBA.
     * @type {Integer (Int32)}
     */
    static IMAPI_READ_TRACK_ADDRESS_TYPE_LBA => 0

    /**
     * Interpret the address field as a track number.  The returned data should reflect the information for the specified track.  This version of the command has the greatest compatibility with legacy devices.
     * @type {Integer (Int32)}
     */
    static IMAPI_READ_TRACK_ADDRESS_TYPE_TRACK => 1

    /**
     * Interpret the address field as a session number.  The returned data should reflect the information for the first track which exists in the specified session.  Note that not all drives support this method.
     * @type {Integer (Int32)}
     */
    static IMAPI_READ_TRACK_ADDRESS_TYPE_SESSION => 2
}
