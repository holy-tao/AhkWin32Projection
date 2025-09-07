#Requires AutoHotkey v2.0.0 64-bit

/**
 * The WMPFolderScanState enumeration type defines the possible operational states of Windows Media Player as it monitors file folders for digital media content.
 * @remarks
 * A scanning operation consists of two phases: scanning and updating. During the first phase, Windows Media Player determines which digital media files to add to the library. During the second phase, the Player adds the files. You can determine the current scan state by calling <b>IWMPFolderMonitorServices::get_scanState</b> or by handling the <b>FolderScanStateChange</b> event.
  * 
  * Windows Media Player 10 Mobile: This enumeration is not supported.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/ne-wmp-wmpfolderscanstate
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class WMPFolderScanState{

    /**
     * Not a valid state.
     * @type {Integer (Int32)}
     */
    static wmpfssUnknown => 0

    /**
     * Scanning folders.
     * @type {Integer (Int32)}
     */
    static wmpfssScanning => 1

    /**
     * Updating the library.
     * @type {Integer (Int32)}
     */
    static wmpfssUpdating => 2

    /**
     * Folder monitoring is stopped.
     * @type {Integer (Int32)}
     */
    static wmpfssStopped => 3
}
