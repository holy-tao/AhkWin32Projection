#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MMC_FILTERDATA.ahk" { MMC_FILTERDATA }
#Import ".\IHeaderCtrl.ahk" { IHeaderCtrl }

/**
 * The IHeaderCtrl2 interface is introduced in MMC 1.2.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-iheaderctrl2
 * @namespace Windows.Win32.System.Mmc
 */
export default struct IHeaderCtrl2 extends IHeaderCtrl {
    /**
     * The interface identifier for IHeaderCtrl2
     * @type {Guid}
     */
    static IID := Guid("{9757abb8-1b32-11d1-a7ce-00c04fd8d565}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHeaderCtrl2 interfaces
    */
    struct Vtbl extends IHeaderCtrl.Vtbl {
        SetChangeTimeOut : IntPtr
        SetColumnFilter  : IntPtr
        GetColumnFilter  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHeaderCtrl2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IHeaderCtrl2::SetChangeTimeOut sets the time-out interval between the time a change takes place in the filter attributes and the posting of an MMCN_FILTER_CHANGE filter change notification, which is sent to the snap-in's IComponent::Notify method.
     * @param {Integer} uTimeout Filter change interval in milliseconds. The default is an implementation detail of the header control, and as a result MMC does not know about it.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iheaderctrl2-setchangetimeout
     */
    SetChangeTimeOut(uTimeout) {
        result := ComCall(9, this, "uint", uTimeout, "HRESULT")
        return result
    }

    /**
     * The IHeaderCtrl2::SetColumnFilter sets the filter value and its maximum character length for a specified column in a filtered list.
     * @remarks
     * For both setting and reading filter values, the snap-in owns the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_filterdata">MMC_FILTERDATA</a> structure and any text buffer.
     * 
     * If the snap-in does not explicitly set the filter data for a column in a filtered list by calling <b>IHeaderCtrl2::SetColumnFilter</b>, the filter type defaults to MMC_STRING_FILTER with no default value for the filter (MMC_FILTER_NOVALUE). The default length of the filter is not documented by the Win32 header control, but it is of sufficient length for most likely user inputs. If the snap-in requires a specific length, it should call <b>IHeaderCtrl2::SetColumnFilter</b>.
     * @param {Integer} nColumn A zero-based index that identifies the column for which the filter value and its maximum character length are to be set.
     * @param {Integer} dwType Filter type to apply to the specified column, taken from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ne-mmc-mmc_filter_type">MMC_FILTER_TYPE</a> enumeration.
     * @param {Pointer<MMC_FILTERDATA>} pFilterData A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_filterdata">MMC_FILTERDATA</a> structure that holds the actual filter data.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iheaderctrl2-setcolumnfilter
     */
    SetColumnFilter(nColumn, dwType, pFilterData) {
        result := ComCall(10, this, "uint", nColumn, "uint", dwType, MMC_FILTERDATA.Ptr, pFilterData, "HRESULT")
        return result
    }

    /**
     * The IHeaderCtrl2::GetColumnFilter method retrieves the filter value set on the specified column.
     * @remarks
     * For both setting and reading filter values, the snap-in owns the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_filterdata">MMC_FILTERDATA</a> structure and any text buffer.
     * 
     * When reading a filter value, if the filter type specified by the snap-in does not match the current type, the <b>IHeaderCtrl2::GetColumnFilter</b> method will return <b>E_FAIL</b>. On receiving an <b>E_FAIL</b>, the values returned by the method are undefined.
     * @param {Integer} nColumn A zero-based index that identifies the column for which the filter value and its maximum character length are to be retrieved.
     * @param {Pointer<Integer>} pdwType A pointer to a variable of type <b>DWORD</b> that can take one of the possible filter values specified in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ne-mmc-mmc_filter_type">MMC_FILTER_TYPE</a> enumeration. The filter type for the specified column is placed in the address pointed to by <i>pdwType</i>.
     * @param {Pointer<MMC_FILTERDATA>} pFilterData A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-mmc_filterdata">MMC_FILTERDATA</a> structure that holds the actual filter data.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iheaderctrl2-getcolumnfilter
     */
    GetColumnFilter(nColumn, pdwType, pFilterData) {
        pdwTypeMarshal := pdwType is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "uint", nColumn, pdwTypeMarshal, pdwType, MMC_FILTERDATA.Ptr, pFilterData, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHeaderCtrl2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetChangeTimeOut := CallbackCreate(GetMethod(implObj, "SetChangeTimeOut"), flags, 2)
        this.vtbl.SetColumnFilter := CallbackCreate(GetMethod(implObj, "SetColumnFilter"), flags, 4)
        this.vtbl.GetColumnFilter := CallbackCreate(GetMethod(implObj, "GetColumnFilter"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetChangeTimeOut)
        CallbackFree(this.vtbl.SetColumnFilter)
        CallbackFree(this.vtbl.GetColumnFilter)
    }
}
