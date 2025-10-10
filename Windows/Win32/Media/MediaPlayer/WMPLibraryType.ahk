#Requires AutoHotkey v2.0.0 64-bit

/**
 * The WMPLibraryType enumeration type defines the possible library types to which Windows Media Player can connect.
 * @remarks
 * 
  * Windows Media Player 10 Mobile: This enumeration is not supported.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wmp/ne-wmp-wmplibrarytype
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class WMPLibraryType{

    /**
     * Not a valid library type.
     * @type {Integer (Int32)}
     */
    static wmpltUnknown => 0

    /**
     * All libraries.
     * @type {Integer (Int32)}
     */
    static wmpltAll => 1

    /**
     * The current user's library.
     * @type {Integer (Int32)}
     */
    static wmpltLocal => 2

    /**
     * A library that belongs to another user on the same computer, the home network, or the Internet. The Player control must be running in remote mode to access these libraries. For information about running the Player control in remote mode, see <a href="https://docs.microsoft.com/windows/desktop/WMP/remoting-the-windows-media-player-control">Remoting the Windows Media Player Control</a>.
     * @type {Integer (Int32)}
     */
    static wmpltRemote => 3

    /**
     * Libraries on a data CD or DVD.
     * @type {Integer (Int32)}
     */
    static wmpltDisc => 4

    /**
     * Libraries on portable devices.
     * @type {Integer (Int32)}
     */
    static wmpltPortableDevice => 5
}
