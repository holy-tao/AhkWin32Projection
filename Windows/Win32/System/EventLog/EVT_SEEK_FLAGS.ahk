#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the relative position in the result set from which to seek.
 * @remarks
 * 
  * If the offset or bookmark seeks past the boundary of the result set (past the first or last record), and EvtSeekStrict is not set, seek will return the last record within the boundary.
  * 
  * If the bookmark is within the boundaries of the result set (based on event record ID) but is not included in the result set, the seek function will apply the offset relative to the bookmark's record ID. In the following table, the first column shows the record IDs of the events in the result set. If the bookmark's record ID is 3989, the second column shows the record that the seek function would seek to given the specified offset.
  * 
  * <table>
  * <tr>
  * <th>Record ID</th>
  * <th>Offset</th>
  * </tr>
  * <tr>
  * <td>3995</td>
  * <td>–2</td>
  * </tr>
  * <tr>
  * <td>3991</td>
  * <td>–1</td>
  * </tr>
  * <tr>
  * <td>3987</td>
  * <td>0, 1</td>
  * </tr>
  * <tr>
  * <td>3983</td>
  * <td>2</td>
  * </tr>
  * <tr>
  * <td>3979</td>
  * <td>3</td>
  * </tr>
  * <tr>
  * <td>3975</td>
  * <td>4</td>
  * </tr>
  * <tr>
  * <td>3971</td>
  * <td>5</td>
  * </tr>
  * <tr>
  * <td>3968</td>
  * <td>6</td>
  * </tr>
  * <tr>
  * <td>3959</td>
  * <td>7</td>
  * </tr>
  * <tr>
  * <td>3955</td>
  * <td>8</td>
  * </tr>
  * </table>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winevt/ne-winevt-evt_seek_flags
 * @namespace Windows.Win32.System.EventLog
 * @version v4.0.30319
 */
class EVT_SEEK_FLAGS{

    /**
     * Seek to the specified offset from the first entry in the result set. The offset must be a positive value.
     * @type {Integer (UInt32)}
     */
    static EvtSeekRelativeToFirst => 1

    /**
     * Seek to the specified offset from the last entry in the result set. The offset must be a negative value.
     * @type {Integer (UInt32)}
     */
    static EvtSeekRelativeToLast => 2

    /**
     * Seek to the specified offset from the current entry in the result set. The offset can be a positive or negative value.
     * @type {Integer (UInt32)}
     */
    static EvtSeekRelativeToCurrent => 3

    /**
     * Seek to the specified offset from the bookmarked entry in the result set. The offset can be a positive or negative value.
     * @type {Integer (UInt32)}
     */
    static EvtSeekRelativeToBookmark => 4

    /**
     * A bitmask that you can use to determine which of the following flags is set:
 * 
 * <ul>
 * <li>EvtSeekRelativeToFirst</li>
 * <li>EvtSeekRelativeToLast</li>
 * <li>EvtSeekRelativeToBookmark</li>
 * </ul>
     * @type {Integer (UInt32)}
     */
    static EvtSeekOriginMask => 7

    /**
     * Force the function to fail if the event does not exist.
     * @type {Integer (UInt32)}
     */
    static EvtSeekStrict => 65536
}
