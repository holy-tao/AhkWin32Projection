#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify what kind of change is being made to a ContentLink.
 * @remarks
 * > [!IMPORTANT]
 * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
 * 
 * This enumeration provides values for the [ContentLinkChangedEventArgs.ChangeKind](contentlinkchangedeventargs_changekind.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentlinkchangekind
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ContentLinkChangeKind extends Win32Enum{

    /**
     * The content link is being added.
     * @type {Integer (Int32)}
     */
    static Inserted => 0

    /**
     * The content link is being removed.
     * @type {Integer (Int32)}
     */
    static Removed => 1

    /**
     * The content link is being changed.
     * @type {Integer (Int32)}
     */
    static Edited => 2
}
