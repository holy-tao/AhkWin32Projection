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
     * The IHeaderCtrl2::SetChangeTimeOut sets the time-out interval between the time a change takes place in the filter attributes and the posting of an MMCN_FILTER_CHANGE filter change notification, which is sent to the snap-in's IComponent::Notify method.
     * @param {Integer} uTimeout Filter change interval in milliseconds. The default is an implementation detail of the header control, and as a result MMC does not know about it.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iheaderctrl2-setchangetimeout
     */
    SetChangeTimeOut(uTimeout) {
        result := ComCall(9, this, "uint", uTimeout, "HRESULT")
        return result
    }

    /**
     * The IHeaderCtrl2::SetColumnFilter sets the filter value and its maximum character length for a specified column in a filtered list.
     * @param {Integer} nColumn A zero-based index that identifies the column for which the filter value and its maximum character length are to be set.
     * @param {Integer} dwType Filter type to apply to the specified column, taken from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ne-mmc-mmc_filter_type">MMC_FILTER_TYPE</a> enumeration.
     * @param {Pointer<MMC_FILTERDATA>} pFilterData A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_filterdata">MMC_FILTERDATA</a> structure that holds the actual filter data.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iheaderctrl2-setcolumnfilter
     */
    SetColumnFilter(nColumn, dwType, pFilterData) {
        result := ComCall(10, this, "uint", nColumn, "uint", dwType, "ptr", pFilterData, "HRESULT")
        return result
    }

    /**
     * The IHeaderCtrl2::GetColumnFilter method retrieves the filter value set on the specified column.
     * @param {Integer} nColumn A zero-based index that identifies the column for which the filter value and its maximum character length are to be retrieved.
     * @param {Pointer<Integer>} pdwType A pointer to a variable of type <b>DWORD</b> that can take one of the possible filter values specified in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ne-mmc-mmc_filter_type">MMC_FILTER_TYPE</a> enumeration. The filter type for the specified column is placed in the address pointed to by <i>pdwType</i>.
     * @param {Pointer<MMC_FILTERDATA>} pFilterData A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_filterdata">MMC_FILTERDATA</a> structure that holds the actual filter data.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iheaderctrl2-getcolumnfilter
     */
    GetColumnFilter(nColumn, pdwType, pFilterData) {
        pdwTypeMarshal := pdwType is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "uint", nColumn, pdwTypeMarshal, pdwType, "ptr", pFilterData, "HRESULT")
        return result
    }
}
