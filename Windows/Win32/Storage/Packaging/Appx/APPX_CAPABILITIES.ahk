#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the capabilities or privileges requested by a package.
 * @remarks
 * 
 * The <b>APPX_CAPABILITIES</b> enumeration specifies privileges that a package declares in the package manifest. If a capability is not explicitly declared, then the default is no access to that capability. If a capability is declared then  a package may still not have the particular capability for reasons such as the capability does not exist on the system or there are other security policies in place that limit the capability.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/ne-appxpackaging-appx_capabilities
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class APPX_CAPABILITIES{

    /**
     * Your Internet connection for outgoing connections to the Internet.
     * @type {Integer (Int32)}
     */
    static APPX_CAPABILITY_INTERNET_CLIENT => 1

    /**
     * Your Internet connection, including incoming unsolicited connections from the Internet – the app can send information to or from your computer through a firewall. You do not need to declare <b>APPX_CAPABILITY_INTERNET_CLIENT</b> if this capability is declared.
     * @type {Integer (Int32)}
     */
    static APPX_CAPABILITY_INTERNET_CLIENT_SERVER => 2

    /**
     * A home or work network – the app can send information to or from your computer and other computers on the same network.
     * @type {Integer (Int32)}
     */
    static APPX_CAPABILITY_PRIVATE_NETWORK_CLIENT_SERVER => 4

    /**
     * Your documents library, including the capability to add, change, or delete files. The package can access only file types that it has declared in the manifest. The app cannot access document libraries on HomeGroup computers.
     * @type {Integer (Int32)}
     */
    static APPX_CAPABILITY_DOCUMENTS_LIBRARY => 8

    /**
     * Your pictures library, including the capability to add, change, or delete files. This capability also includes pictures libraries on HomeGroup computers, along with picture file types on locally connected media servers.
     * @type {Integer (Int32)}
     */
    static APPX_CAPABILITY_PICTURES_LIBRARY => 16

    /**
     * Your videos library, including the capability to add, change, or delete files. This capability also includes videos libraries on HomeGroup computers, along with video file types on locally connected media servers.
     * @type {Integer (Int32)}
     */
    static APPX_CAPABILITY_VIDEOS_LIBRARY => 32

    /**
     * Your music library and playlists, including the capability to add, change, or delete files. This capability also includes music libraries and playlists in the music library on HomeGroup computers, plus music file types on locally connected media servers.
     * @type {Integer (Int32)}
     */
    static APPX_CAPABILITY_MUSIC_LIBRARY => 64

    /**
     * Your Windows credentials, for access to a corporate intranet. This application can impersonate you on the network.
     * @type {Integer (Int32)}
     */
    static APPX_CAPABILITY_ENTERPRISE_AUTHENTICATION => 128

    /**
     * Software and hardware certificates or a smart card – used to identify you in the app. This capability may be used by your employer, bank, or government services to identify you.
     * @type {Integer (Int32)}
     */
    static APPX_CAPABILITY_SHARED_USER_CERTIFICATES => 256

    /**
     * Removable storage, such as an external hard drive or USB flash drive, or MTP portable device, including the capability to add, change, or delete specific files. This package can only access file types that it has declared in the manifest.
     * @type {Integer (Int32)}
     */
    static APPX_CAPABILITY_REMOVABLE_STORAGE => 512

    /**
     * 
     * @type {Integer (Int32)}
     */
    static APPX_CAPABILITY_APPOINTMENTS => 1024

    /**
     * 
     * @type {Integer (Int32)}
     */
    static APPX_CAPABILITY_CONTACTS => 2048
}
