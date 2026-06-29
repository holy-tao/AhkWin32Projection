#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The WMP_WMDM_METADATA_ROUND_TRIP_DEVICE2PC structure is used by Windows Media Player to receive accelerated metadata synchronization information from portable devices that do not support MTP.
 * @remarks
 * The Windows Media Device Manager service provider should return as many object path names as will fit in the buffer size specified by the <i>pnOutBufferSize</i> parameter of the <b>DeviceIoControl</b> method. If the buffer is not large enough to contain the path name strings for all the changes, the device must set the <b>dwUnretrievedObjectCount</b> member to the appropriate (nonzero) value.
 * @see https://learn.microsoft.com/windows/win32/api/wmpdevices/ns-wmpdevices-wmp_wmdm_metadata_round_trip_device2pc
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct WMP_WMDM_METADATA_ROUND_TRIP_DEVICE2PC {
    #StructPack 4

    /**
     * The current transaction ID for the device. Windows Media Player stores this value and uses it for future requests.
     */
    dwCurrentTransactionID : UInt32

    /**
     * The number of object path names returned in the <b>wsObjectPathnameList</b> member.
     */
    dwReturnedObjectCount : UInt32

    /**
     * The number of objects that were changed or deleted, but that are not part of this response. A value greater than zero signals Windows Media Player to make a further request.
     */
    dwUnretrievedObjectCount : UInt32

    /**
     * The index of the first character of the first deleted object path name. If the path name list contains only deleted objects, specify zero. If the path name list contains no deleted objects, specify the index of the last null character in the path name list. Note that this value is the number of Unicode characters to skip in <b>wsObjectPathnameList</b>, not the number of bytes.
     */
    dwDeletedObjectStartingOffset : UInt32

    /**
     * The status information. Status is indicated in a bitwise fashion by using the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WMP_MDRT_FLAGS_UNREPORTED_DELETED_ITEMS"></a><a id="wmp_mdrt_flags_unreported_deleted_items"></a><dl>
     * <dt><b>WMP_MDRT_FLAGS_UNREPORTED_DELETED_ITEMS</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Items were deleted before the first object path name being reported. This often indicates that the device was reformatted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WMP_MDRT_FLAGS_UNREPORTED_ADDED_ITEMS"></a><a id="wmp_mdrt_flags_unreported_added_items"></a><dl>
     * <dt><b>WMP_MDRT_FLAGS_UNREPORTED_ADDED_ITEMS</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Some additional items were added that were not returned in the list of PUOIDs.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Bits 2 through 31 are reserved for future use. These bits should be set to zero.
     */
    dwFlags : UInt32

    /**
     * Contains a contiguous list of null terminated Unicode path name strings, terminated with an extra null character. The list must be created in the following manner:
     * 
     * First, path name strings for all objects that have been added to the device or have had a change for the PlayCount, UserRating, or BuyNow attributes.
     * 
     * Second, path name strings for all objects that have been deleted. The index of the first character of this part of the list is contained in the <b>dwDeletedObjectStartingOffset</b> member.
     */
    wsObjectPathnameList : WCHAR[1]

}
