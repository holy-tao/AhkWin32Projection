#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used by methods of the IFolderViewOptions interface to activate Windows Vista options not supported by default in Windows 7 and later systems as well as deactivating new Windows 7 options.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/ne-shobjidl-folderviewoptions
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class FOLDERVIEWOPTIONS extends Win32BitflagEnum{

    /**
     * 0x00000000. Do not use any special options.
     * @type {Integer (Int32)}
     */
    static FVO_DEFAULT => 0

    /**
     * 0x00000001. Use the Windows Vista list view. This can be used to maintain continuity between systems so that users are presented with an expected view. At this time, setting this flag has the effective, though not literal, result of the application of the FVO_CUSTOMPOSITION and FVO_CUSTOMORDERING flags. However, this could change. Applications should be specific about the behaviors that they require. For instance, if an application requires custom positioning of its items, it should not rely on FVO_VISTALAYOUT to provide it, but instead explicitly apply the FVO_CUSTOMPOSITION flag.
     * @type {Integer (Int32)}
     */
    static FVO_VISTALAYOUT => 1

    /**
     * 0x00000002. Items require custom positioning within the space of the view. Those items are positioned to specific coordinates. This option is not active by default in the Windows 7 view.
     * @type {Integer (Int32)}
     */
    static FVO_CUSTOMPOSITION => 2

    /**
     * 0x00000004. Items require custom ordering within the view. This option is not active by default in the Windows 7 view. When it is active, the user can reorder the view by dragging items to their desired locations.
     * @type {Integer (Int32)}
     */
    static FVO_CUSTOMORDERING => 4

    /**
     * 0x00000008. Tiles and Details displays can contain hyperlinks. This option is not active by default in the Windows 7 view. When hyperlinks are displayed, they are updated to the Windows 7 view.
     * @type {Integer (Int32)}
     */
    static FVO_SUPPORTHYPERLINKS => 8

    /**
     * 0x00000010. Do not display animations in the view. This option was introduced in Windows 7 and is active by default in the Windows 7 view.
     * @type {Integer (Int32)}
     */
    static FVO_NOANIMATIONS => 16

    /**
     * 0x00000010. Do not show scroll tips. This option was introduced in Windows 7 and is active by default in the Windows 7 view.
     * 
     * 
     * 
     * A scroll tip displays the names of files as they are scrolled past, as a visual clue to your location in the list. An example is shown here.
     * 
     * <img alt="Screen shot of a Scroll tip displaying the name of the Shell32.dll file in the System32 folder." src="./images/scrolltip.jpg"/>
     * @type {Integer (Int32)}
     */
    static FVO_NOSCROLLTIPS => 32
}
