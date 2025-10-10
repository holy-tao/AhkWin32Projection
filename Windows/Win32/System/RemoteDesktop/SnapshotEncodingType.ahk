#Requires AutoHotkey v2.0.0 64-bit

/**
 * The type of encoding used for a Remote Desktop Protocol (RDP) app container client snapshot.
 * @see https://docs.microsoft.com/windows/win32/api//rdpappcontainerclient/ne-rdpappcontainerclient-snapshotencodingtype
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class SnapshotEncodingType{

    /**
     * The snapshot will be taken and a data URI that contains the snapshot will be returned.
     * @type {Integer (Int32)}
     */
    static SnapshotEncodingDataUri => 0
}
