#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IDataSourceLocator extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataSourceLocator
     * @type {Guid}
     */
    static IID => Guid("{2206ccb2-19c1-11d1-89e0-00c04fd7a829}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_hWnd", "put_hWnd", "PromptNew", "PromptEdit"]

    /**
     * 
     * @param {Pointer<HWND>} phwndParent 
     * @returns {HRESULT} 
     */
    get_hWnd(phwndParent) {
        result := ComCall(7, this, "ptr", phwndParent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @returns {HRESULT} 
     */
    put_hWnd(hwndParent) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(8, this, "ptr", hwndParent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppADOConnection 
     * @returns {HRESULT} 
     */
    PromptNew(ppADOConnection) {
        result := ComCall(9, this, "ptr*", ppADOConnection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppADOConnection 
     * @param {Pointer<VARIANT_BOOL>} pbSuccess 
     * @returns {HRESULT} 
     */
    PromptEdit(ppADOConnection, pbSuccess) {
        result := ComCall(10, this, "ptr*", ppADOConnection, "ptr", pbSuccess, "HRESULT")
        return result
    }
}
