#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The data format used for a Remote Desktop Protocol (RDP) app container client snapshot.
 * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/ne-rdpappcontainerclient-snapshotformattype
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct SnapshotFormatType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static SnapshotFormatPng => 0

    /**
     * @type {Integer (Int32)}
     */
    static SnapshotFormatJpeg => 1

    /**
     * @type {Integer (Int32)}
     */
    static SnapshotFormatBmp => 2
}
