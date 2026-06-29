#Requires AutoHotkey v2.1-alpha.26+ 64-bit

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
 */
export default struct Application {
    #StructPack 1

}
