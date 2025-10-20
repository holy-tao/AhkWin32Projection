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
     * 
     * @param {Pointer<Int32>} pRetVal 
     * @returns {HRESULT} 
     */
    get_Row(pRetVal) {
        result := ComCall(3, this, "int*", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pRetVal 
     * @returns {HRESULT} 
     */
    get_Column(pRetVal) {
        result := ComCall(4, this, "int*", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pRetVal 
     * @returns {HRESULT} 
     */
    get_RowSpan(pRetVal) {
        result := ComCall(5, this, "int*", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pRetVal 
     * @returns {HRESULT} 
     */
    get_ColumnSpan(pRetVal) {
        result := ComCall(6, this, "int*", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRawElementProviderSimple>} pRetVal 
     * @returns {HRESULT} 
     */
    get_ContainingGrid(pRetVal) {
        result := ComCall(7, this, "ptr", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
