#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IAMStats interface retrieves performance data from the Filter Graph Manager.
 * @remarks
 * 
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//control/nn-control-iamstats
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMStats extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMStats
     * @type {Guid}
     */
    static IID => Guid("{bc9bcf80-dcd2-11d2-abf6-00a0c905f375}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Reset", "get_Count", "GetValueByIndex", "GetValueByName", "GetIndex", "AddValue"]

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-iamstats-reset
     */
    Reset() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-iamstats-get_count
     */
    get_Count() {
        result := ComCall(8, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<BSTR>} szName 
     * @param {Pointer<Integer>} lCount 
     * @param {Pointer<Float>} dLast 
     * @param {Pointer<Float>} dAverage 
     * @param {Pointer<Float>} dStdDev 
     * @param {Pointer<Float>} dMin 
     * @param {Pointer<Float>} dMax 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-iamstats-getvaluebyindex
     */
    GetValueByIndex(lIndex, szName, lCount, dLast, dAverage, dStdDev, dMin, dMax) {
        lCountMarshal := lCount is VarRef ? "int*" : "ptr"
        dLastMarshal := dLast is VarRef ? "double*" : "ptr"
        dAverageMarshal := dAverage is VarRef ? "double*" : "ptr"
        dStdDevMarshal := dStdDev is VarRef ? "double*" : "ptr"
        dMinMarshal := dMin is VarRef ? "double*" : "ptr"
        dMaxMarshal := dMax is VarRef ? "double*" : "ptr"

        result := ComCall(9, this, "int", lIndex, "ptr", szName, lCountMarshal, lCount, dLastMarshal, dLast, dAverageMarshal, dAverage, dStdDevMarshal, dStdDev, dMinMarshal, dMin, dMaxMarshal, dMax, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} szName 
     * @param {Pointer<Integer>} lIndex 
     * @param {Pointer<Integer>} lCount 
     * @param {Pointer<Float>} dLast 
     * @param {Pointer<Float>} dAverage 
     * @param {Pointer<Float>} dStdDev 
     * @param {Pointer<Float>} dMin 
     * @param {Pointer<Float>} dMax 
     * @returns {HRESULT} 
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

        result := ComCall(10, this, "ptr", szName, lIndexMarshal, lIndex, lCountMarshal, lCount, dLastMarshal, dLast, dAverageMarshal, dAverage, dStdDevMarshal, dStdDev, dMinMarshal, dMin, dMaxMarshal, dMax, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} szName 
     * @param {Integer} lCreate 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-iamstats-getindex
     */
    GetIndex(szName, lCreate) {
        szName := szName is String ? BSTR.Alloc(szName).Value : szName

        result := ComCall(11, this, "ptr", szName, "int", lCreate, "int*", &plIndex := 0, "HRESULT")
        return plIndex
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Float} dValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-iamstats-addvalue
     */
    AddValue(lIndex, dValue) {
        result := ComCall(12, this, "int", lIndex, "double", dValue, "HRESULT")
        return result
    }
}
