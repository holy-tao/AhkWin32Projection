#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Forwards the events fired by a specified ShellFolderView object to corresponding ShellFolderViewOC event handlers.
 * @remarks
 * The **ShellFolderViewOC** object has these types of members:
 * 
 * -   [Events](#events)
 * -   [Methods](#methods)
 * 
 * 
 * The [**ShellFolderView**](shellfolderview.md) object fires two events, [**EnumDone**](shellfolderviewoc-enumdone.md) and [**SelectionChanged**](shellfolderviewoc-selectionchanged.md), that are typically handled by applications. However, some applications must handle events from a series of **ShellFolderView** objects. For example, an application might host a WebBrowser control that allows users to navigate through a series of folders. Each folder has its own **ShellFolderView** object with its associated events. Handling these events can be difficult.
 * 
 * The **ShellFolderViewOC** object simplifies event handling for such scenarios. It allows applications to handle events for all [**ShellFolderView**](shellfolderview.md) objects with a single pair of **ShellFolderViewOC** event handlers. Each time the user navigates to a new folder, the application passes the associated **ShellFolderView** object to the **ShellFolderViewOC** object by calling [**SetFolderView**](shellfolderviewoc-setfolderview.md). Then, when an [**EnumDone**](shellfolderviewoc-enumdone.md) or [**SelectionChanged**](shellfolderviewoc-selectionchanged.md) event is fired, the **ShellFolderViewOC** object forwards the event to its own handler for processing.
 * @see https://learn.microsoft.com/windows/win32/shell/shellfolderviewoc-object
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ShellFolderViewOC extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
