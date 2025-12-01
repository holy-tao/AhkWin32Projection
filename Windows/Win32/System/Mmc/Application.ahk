#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the top-level element in the Windows Ribbon framework markup specification.
 * @remarks
 * Required.
 * 
 * Must occur exactly once as the container for all of the Ribbon markup.
 * 
 * The child elements of the **Application** element must occur in the specified order:
 * 
 * 1.  [**Application.Commands**](windowsribbon-element-application-commands.md)
 * 2.  [**Application.Views**](windowsribbon-element-application-views.md)
 * @see https://learn.microsoft.com/windows/win32/windowsribbon/windowsribbon-element-application
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class Application extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
