#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IConsole2.ahk

/**
 * The IConsole3 interface supersedes the IConsole2 interface. The IConsole3 interface contains the IConsole3::RenameScopeItem method, which allows a scope node to programmatically be placed in rename mode.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-iconsole3
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IConsole3 extends IConsole2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConsole3
     * @type {Guid}
     */
    static IID => Guid("{4f85efdb-d0e1-498c-8d4a-d010dfdd404f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RenameScopeItem"]

    /**
     * 
     * @param {Pointer} hScopeItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsole3-renamescopeitem
     */
    RenameScopeItem(hScopeItem) {
        result := ComCall(17, this, "ptr", hScopeItem, "HRESULT")
        return result
    }
}
