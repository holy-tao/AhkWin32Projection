#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The type of encoding used for a Remote Desktop Protocol (RDP) app container client snapshot.
 * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/ne-rdpappcontainerclient-snapshotencodingtype
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct SnapshotEncodingType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The snapshot will be taken and a data URI that contains the snapshot will be returned.
     * @type {Integer (Int32)}
     */
    static SnapshotEncodingDataUri => 0
}
