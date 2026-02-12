#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies caching characteristics for a page involved in a navigation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.navigation.navigationcachemode
 * @namespace Windows.UI.Xaml.Navigation
 * @version WindowsRuntime 1.4
 */
class NavigationCacheMode extends Win32Enum{

    /**
     * The page is never cached and a new instance of the page is created on each visit.
     * @type {Integer (Int32)}
     */
    static Disabled => 0

    /**
     * The page is cached and the cached instance is reused for every visit regardless of the cache size for the frame.
     * @type {Integer (Int32)}
     */
    static Required => 1

    /**
     * The page is cached, but the cached instance is discarded when the size of the cache for the frame is exceeded.
     * @type {Integer (Int32)}
     */
    static Enabled => 2
}
