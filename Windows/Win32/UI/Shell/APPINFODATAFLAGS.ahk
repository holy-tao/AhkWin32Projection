#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies application information to return from IShellApp::GetAppInfo. These flags are bitmasks used in the dwMask member of the APPINFODATA structure.
 * @remarks
 * 
  * Add/Remove Programs in Control Panel uses only <b>AIM_DISPLAYNAME</b> and <b>AIM_SUPPORTURL.</b>
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shappmgr/ne-shappmgr-appinfodataflags
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class APPINFODATAFLAGS{

    /**
     * Returns the display name.
     * @type {Integer (Int32)}
     */
    static AIM_DISPLAYNAME => 1

    /**
     * Returns the version.
     * @type {Integer (Int32)}
     */
    static AIM_VERSION => 2

    /**
     * Returns the application publisher.
     * @type {Integer (Int32)}
     */
    static AIM_PUBLISHER => 4

    /**
     * Returns the application's product ID.
     * @type {Integer (Int32)}
     */
    static AIM_PRODUCTID => 8

    /**
     * Returns the application's registered owner.
     * @type {Integer (Int32)}
     */
    static AIM_REGISTEREDOWNER => 16

    /**
     * Returns the application's registered company.
     * @type {Integer (Int32)}
     */
    static AIM_REGISTEREDCOMPANY => 32

    /**
     * Returns the language.
     * @type {Integer (Int32)}
     */
    static AIM_LANGUAGE => 64

    /**
     * Returns the support URL.
     * @type {Integer (Int32)}
     */
    static AIM_SUPPORTURL => 128

    /**
     * Returns the support telephone number.
     * @type {Integer (Int32)}
     */
    static AIM_SUPPORTTELEPHONE => 256

    /**
     * Returns the Help link.
     * @type {Integer (Int32)}
     */
    static AIM_HELPLINK => 512

    /**
     * Returns the application's install location.
     * @type {Integer (Int32)}
     */
    static AIM_INSTALLLOCATION => 1024

    /**
     * Returns the install source.
     * @type {Integer (Int32)}
     */
    static AIM_INSTALLSOURCE => 2048

    /**
     * Returns the application's install date.
     * @type {Integer (Int32)}
     */
    static AIM_INSTALLDATE => 4096

    /**
     * Returns the application's contact information.
     * @type {Integer (Int32)}
     */
    static AIM_CONTACT => 16384

    /**
     * Returns application comments.
     * @type {Integer (Int32)}
     */
    static AIM_COMMENTS => 32768

    /**
     * Returns the application image.
     * @type {Integer (Int32)}
     */
    static AIM_IMAGE => 131072

    /**
     * Returns the URL of the application's ReadMe file.
     * @type {Integer (Int32)}
     */
    static AIM_READMEURL => 262144

    /**
     * Returns the URL of the application's update information.
     * @type {Integer (Int32)}
     */
    static AIM_UPDATEINFOURL => 524288
}
