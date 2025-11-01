#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to individual child controls of containers that implement IGridProvider.
 * @remarks
 * 
  * Implemented on a UI Automation provider that must support the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementinggriditem">GridItem</a> <i>control pattern</i>.
  *    			
  * 
  * Controls that implement <b>IGridItemProvider</b> can typically be traversed 
  *             (that is, a UI Automation client can move to adjacent controls) by using the keyboard.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-igriditemprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IGridItemProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGridItemProvider
     * @type {Guid}
     */
    static IID => Guid("{d02541f1-fb81-4d64-ae32-f520f8a6dbd1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Row", "get_Column", "get_RowSpan", "get_ColumnSpan", "get_ContainingGrid"]

    /**
     * 
     * @param {Pointer<Integer>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-igriditemprovider-get_row
     */
    get_Row(pRetVal) {
        result := ComCall(3, this, "int*", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-igriditemprovider-get_column
     */
    get_Column(pRetVal) {
        result := ComCall(4, this, "int*", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-igriditemprovider-get_rowspan
     */
    get_RowSpan(pRetVal) {
        result := ComCall(5, this, "int*", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-igriditemprovider-get_columnspan
     */
    get_ColumnSpan(pRetVal) {
        result := ComCall(6, this, "int*", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IRawElementProviderSimple>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-igriditemprovider-get_containinggrid
     */
    get_ContainingGrid(pRetVal) {
        result := ComCall(7, this, "ptr*", pRetVal, "HRESULT")
        return result
    }
}
