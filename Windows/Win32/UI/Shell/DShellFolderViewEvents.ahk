#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class DShellFolderViewEvents extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for DShellFolderViewEvents
     * @type {Guid}
     */
    static IID => Guid("{62112aa2-ebe4-11cf-a5fb-0020afe7292d}")

    /**
     * The class identifier for DShellFolderViewEvents
     * @type {Guid}
     */
    static CLSID => Guid("{62112aa2-ebe4-11cf-a5fb-0020afe7292d}")

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
