#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The data format used for a Remote Desktop Protocol (RDP) app container client snapshot.
 * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/ne-rdpappcontainerclient-snapshotformattype
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class SnapshotFormatType extends Win32Enum{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SnapshotFormatPng => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SnapshotFormatJpeg => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SnapshotFormatBmp => 2
}
