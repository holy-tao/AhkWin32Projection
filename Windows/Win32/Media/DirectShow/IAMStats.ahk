#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IAMStats interface retrieves performance data from the Filter Graph Manager.
 * @remarks
 * Each statistic is defined by a name and an index. Use the <b>GetIndex</b> method to find the index from the name. Values are always <b>double</b> types. The following statistics are predefined.
 * 
 * <table>
 * <tr>
 * <th>Name
 *             </th>
 * <th>Description
 *             </th>
 * </tr>
 * <tr>
 * <td>RenderFile</td>
 * <td>Measures the time taken by each call to <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-igraphbuilder-renderfile">IGraphBuilder::RenderFile</a>.</td>
 * </tr>
 * <tr>
 * <td>ConnectDirectInternal</td>
 * <td>Measures the time taken to connect two filters.</td>
 * </tr>
 * <tr>
 * <td>Build Mapper Cache</td>
 * <td>Measures the time taken to cache information about registered filters (used by the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/filter-mapper">Filter Mapper</a> object).</td>
 * </tr>
 * <tr>
 * <td>Process Category <i>CategoryName</i></td>
 * <td>Measures the time taken to cache information about filters in a particular category, where <i>CategoryName</i> is the friendly name of the filter category. (See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/filter-categories">Filter Categories</a>.)</td>
 * </tr>
 * </table>
 *  
 * 
 * For each of these statistics, the values represent time in milliseconds.
 * @see https://learn.microsoft.com/windows/win32/api/control/nn-control-iamstats
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMStats extends IDispatch {
    /**
     * The interface identifier for IAMStats
     * @type {Guid}
     */
    static IID := Guid("{bc9bcf80-dcd2-11d2-abf6-00a0c905f375}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMStats interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Reset           : IntPtr
        get_Count       : IntPtr
        GetValueByIndex : IntPtr
        GetValueByName  : IntPtr
        GetIndex        : IntPtr
        AddValue        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMStats.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * The Reset method resets all statistics to zero.
     * @returns {HRESULT} Returns S_OK if successful, or an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-iamstats-reset
     */
    Reset() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * The get_Count method retrieves the number of statistics.
     * @returns {Integer} Receives the number of statistics.
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-iamstats-get_count
     */
    get_Count() {
        result := ComCall(8, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * The GetValueByIndex method retrieves a statistic, by index.
     * @remarks
     * The caller must free the string returned in <i>szName</i>, by calling the <b>SysFreeString</b> function.
     * 
     * To get the number of statistics, call [IAMStats::GetIndex](/windows/desktop/api/control/nf-control-iamstats-getindex).
     * @param {Integer} lIndex Zero-based index of the statistic.
     * @param {Pointer<BSTR>} szName Pointer to a variable that receives the name of the statistic.
     * @param {Pointer<Integer>} lCount Pointer to a variable that receives the number of values that were recorded.
     * @param {Pointer<Float>} dLast Pointer to a variable that receives the most recent value that was recorded.
     * @param {Pointer<Float>} dAverage Pointer to a variable that receives the average value.
     * @param {Pointer<Float>} dStdDev Pointer to a variable that receives the standard deviation of the values. If the count is less than two, the standard deviation is zero.
     * @param {Pointer<Float>} dMin Pointer to a variable that receives the minimum value that was recorded.
     * @param {Pointer<Float>} dMax Pointer to a variable that receives the maximum value that was recorded.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Index out of range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-iamstats-getvaluebyindex
     */
    GetValueByIndex(lIndex, szName, lCount, dLast, dAverage, dStdDev, dMin, dMax) {
        lCountMarshal := lCount is VarRef ? "int*" : "ptr"
        dLastMarshal := dLast is VarRef ? "double*" : "ptr"
        dAverageMarshal := dAverage is VarRef ? "double*" : "ptr"
        dStdDevMarshal := dStdDev is VarRef ? "double*" : "ptr"
        dMinMarshal := dMin is VarRef ? "double*" : "ptr"
        dMaxMarshal := dMax is VarRef ? "double*" : "ptr"

        result := ComCall(9, this, "int", lIndex, BSTR.Ptr, szName, lCountMarshal, lCount, dLastMarshal, dLast, dAverageMarshal, dAverage, dStdDevMarshal, dStdDev, dMinMarshal, dMin, dMaxMarshal, dMax, "HRESULT")
        return result
    }

    /**
     * The GetValueByName method retrieves a statistic, by name.
     * @param {BSTR} szName Specifies the name of the statistic.
     * @param {Pointer<Integer>} lIndex Pointer to a variable that receives the index of this statistic.
     * @param {Pointer<Integer>} lCount Pointer to a variable that receives the number of values that were recorded.
     * @param {Pointer<Float>} dLast Pointer to a variable that receives the most recent value that was recorded.
     * @param {Pointer<Float>} dAverage Pointer to a variable that receives the average value.
     * @param {Pointer<Float>} dStdDev Pointer to a variable that receives the standard deviation of the values. If the count is less than two, the standard deviation is zero.
     * @param {Pointer<Float>} dMin Pointer to a variable that receives the minimum value that was recorded.
     * @param {Pointer<Float>} dMax Pointer to a variable that receives the maximum value that was recorded.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No match for this name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-iamstats-getvaluebyname
     */
    GetValueByName(szName, lIndex, lCount, dLast, dAverage, dStdDev, dMin, dMax) {
        szName := szName is String ? BSTR.Alloc(szName).Value : szName

        lIndexMarshal := lIndex is VarRef ? "int*" : "ptr"
        lCountMarshal := lCount is VarRef ? "int*" : "ptr"
        dLastMarshal := dLast is VarRef ? "double*" : "ptr"
        dAverageMarshal := dAverage is VarRef ? "double*" : "ptr"
        dStdDevMarshal := dStdDev is VarRef ? "double*" : "ptr"
        dMinMarshal := dMin is VarRef ? "double*" : "ptr"
        dMaxMarshal := dMax is VarRef ? "double*" : "ptr"

        result := ComCall(10, this, BSTR, szName, lIndexMarshal, lIndex, lCountMarshal, lCount, dLastMarshal, dLast, dAverageMarshal, dAverage, dStdDevMarshal, dStdDev, dMinMarshal, dMin, dMaxMarshal, dMax, "HRESULT")
        return result
    }

    /**
     * The GetIndex method retrieves the index for a named statistic, or creates a new statistic.
     * @param {BSTR} szName Specifies the name of the statistic.
     * @param {Integer} lCreate Specifies whether to create the statistic, if it is not defined already. If the value is <b>TRUE</b>, the method creates a new index for the statistic when it cannot find an existing entry with that name. If the value is <b>FALSE</b>, the method fails when the statistic does not already exist.
     * @returns {Integer} Receives the index.
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-iamstats-getindex
     */
    GetIndex(szName, lCreate) {
        szName := szName is String ? BSTR.Alloc(szName).Value : szName

        result := ComCall(11, this, BSTR, szName, "int", lCreate, "int*", &plIndex := 0, "HRESULT")
        return plIndex
    }

    /**
     * The AddValue method records a new value.
     * @param {Integer} lIndex Specifies the index of the statistic.
     * @param {Float} dValue Specifies the value to record.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Index out of range.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-iamstats-addvalue
     */
    AddValue(lIndex, dValue) {
        result := ComCall(12, this, "int", lIndex, "double", dValue, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAMStats.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.GetValueByIndex := CallbackCreate(GetMethod(implObj, "GetValueByIndex"), flags, 9)
        this.vtbl.GetValueByName := CallbackCreate(GetMethod(implObj, "GetValueByName"), flags, 9)
        this.vtbl.GetIndex := CallbackCreate(GetMethod(implObj, "GetIndex"), flags, 4)
        this.vtbl.AddValue := CallbackCreate(GetMethod(implObj, "AddValue"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.GetValueByIndex)
        CallbackFree(this.vtbl.GetValueByName)
        CallbackFree(this.vtbl.GetIndex)
        CallbackFree(this.vtbl.AddValue)
    }
}
