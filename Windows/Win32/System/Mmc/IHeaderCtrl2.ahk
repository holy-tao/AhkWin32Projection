#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IHeaderCtrl.ahk

/**
 * The IHeaderCtrl2 interface is introduced in MMC 1.2.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-iheaderctrl2
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IHeaderCtrl2 extends IHeaderCtrl{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHeaderCtrl2
     * @type {Guid}
     */
    static IID => Guid("{9757abb8-1b32-11d1-a7ce-00c04fd8d565}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetChangeTimeOut", "SetColumnFilter", "GetColumnFilter"]

    /**
     * 
     * @param {Integer} uTimeout 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iheaderctrl2-setchangetimeout
     */
    SetChangeTimeOut(uTimeout) {
        result := ComCall(9, this, "uint", uTimeout, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nColumn 
     * @param {Integer} dwType 
     * @param {Pointer<MMC_FILTERDATA>} pFilterData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iheaderctrl2-setcolumnfilter
     */
    SetColumnFilter(nColumn, dwType, pFilterData) {
        result := ComCall(10, this, "uint", nColumn, "uint", dwType, "ptr", pFilterData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nColumn 
     * @param {Pointer<Integer>} pdwType 
     * @param {Pointer<MMC_FILTERDATA>} pFilterData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iheaderctrl2-getcolumnfilter
     */
    GetColumnFilter(nColumn, pdwType, pFilterData) {
        result := ComCall(11, this, "uint", nColumn, "uint*", pdwType, "ptr", pFilterData, "HRESULT")
        return result
    }
}
