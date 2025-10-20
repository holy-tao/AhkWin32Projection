#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/shell/dshellwindowsevents
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
