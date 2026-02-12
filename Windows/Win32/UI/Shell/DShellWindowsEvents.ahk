#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Receives IShellWindows window registration events.
 * @remarks
 * The **DShellWindowsEvents** object has these types of members:
 * 
 * -   [Methods](#methods)
 * 
 * 
 * Use **DShellWindowsEvents** to monitor when a Shell window is registered or revoked. For more information, see [**IShellWindows**](/windows/desktop/api/Exdisp/nn-exdisp-ishellwindows).
 * @see https://learn.microsoft.com/windows/win32/ktop-src/shell/dshellwindowsevents
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class DShellWindowsEvents extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for DShellWindowsEvents
     * @type {Guid}
     */
    static IID => Guid("{fe4106e0-399a-11d0-a48c-00a0c90a8f39}")

    /**
     * The class identifier for DShellWindowsEvents
     * @type {Guid}
     */
    static CLSID => Guid("{fe4106e0-399a-11d0-a48c-00a0c90a8f39}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
