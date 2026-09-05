#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class BrowserNavConstants extends Win32Enum {

    /**
     * Native name: navOpenInNewWindow
     * @type {Integer (Int32)}
     */
    static OpenInNewWindow => 1

    /**
     * Native name: navNoHistory
     * @type {Integer (Int32)}
     */
    static NoHistory => 2

    /**
     * Native name: navNoReadFromCache
     * @type {Integer (Int32)}
     */
    static NoReadFromCache => 4

    /**
     * Native name: navNoWriteToCache
     * @type {Integer (Int32)}
     */
    static NoWriteToCache => 8

    /**
     * Native name: navAllowAutosearch
     * @type {Integer (Int32)}
     */
    static AllowAutosearch => 16

    /**
     * Native name: navBrowserBar
     * @type {Integer (Int32)}
     */
    static BrowserBar => 32

    /**
     * Native name: navHyperlink
     * @type {Integer (Int32)}
     */
    static Hyperlink => 64

    /**
     * Native name: navEnforceRestricted
     * @type {Integer (Int32)}
     */
    static EnforceRestricted => 128

    /**
     * Native name: navNewWindowsManaged
     * @type {Integer (Int32)}
     */
    static NewWindowsManaged => 256

    /**
     * Native name: navUntrustedForDownload
     * @type {Integer (Int32)}
     */
    static UntrustedForDownload => 512

    /**
     * Native name: navTrustedForActiveX
     * @type {Integer (Int32)}
     */
    static TrustedForActiveX => 1024

    /**
     * Native name: navOpenInNewTab
     * @type {Integer (Int32)}
     */
    static OpenInNewTab => 2048

    /**
     * Native name: navOpenInBackgroundTab
     * @type {Integer (Int32)}
     */
    static OpenInBackgroundTab => 4096

    /**
     * Native name: navKeepWordWheelText
     * @type {Integer (Int32)}
     */
    static KeepWordWheelText => 8192

    /**
     * Native name: navVirtualTab
     * @type {Integer (Int32)}
     */
    static VirtualTab => 16384

    /**
     * Native name: navBlockRedirectsXDomain
     * @type {Integer (Int32)}
     */
    static BlockRedirectsXDomain => 32768

    /**
     * Native name: navOpenNewForegroundTab
     * @type {Integer (Int32)}
     */
    static OpenNewForegroundTab => 65536

    /**
     * Native name: navTravelLogScreenshot
     * @type {Integer (Int32)}
     */
    static TravelLogScreenshot => 131072

    /**
     * Native name: navDeferUnload
     * @type {Integer (Int32)}
     */
    static DeferUnload => 262144

    /**
     * Native name: navSpeculative
     * @type {Integer (Int32)}
     */
    static Speculative => 524288

    /**
     * Native name: navSuggestNewWindow
     * @type {Integer (Int32)}
     */
    static SuggestNewWindow => 1048576

    /**
     * Native name: navSuggestNewTab
     * @type {Integer (Int32)}
     */
    static SuggestNewTab => 2097152

    /**
     * Native name: navReserved1
     * @type {Integer (Int32)}
     */
    static Reserved1 => 4194304

    /**
     * Native name: navHomepageNavigate
     * @type {Integer (Int32)}
     */
    static HomepageNavigate => 8388608

    /**
     * Native name: navRefresh
     * @type {Integer (Int32)}
     */
    static Refresh => 16777216

    /**
     * Native name: navHostNavigation
     * @type {Integer (Int32)}
     */
    static HostNavigation => 33554432

    /**
     * Native name: navReserved2
     * @type {Integer (Int32)}
     */
    static Reserved2 => 67108864

    /**
     * Native name: navReserved3
     * @type {Integer (Int32)}
     */
    static Reserved3 => 134217728

    /**
     * Native name: navReserved4
     * @type {Integer (Int32)}
     */
    static Reserved4 => 268435456

    /**
     * Native name: navReserved5
     * @type {Integer (Int32)}
     */
    static Reserved5 => 536870912

    /**
     * Native name: navReserved6
     * @type {Integer (Int32)}
     */
    static Reserved6 => 1073741824

    /**
     * Native name: navReserved7
     * @type {Integer (Int32)}
     */
    static Reserved7 => -2147483648
}
