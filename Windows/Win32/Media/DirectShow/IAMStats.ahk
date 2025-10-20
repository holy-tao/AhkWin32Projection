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
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plCount 
     * @returns {HRESULT} 
     */
    get_Count(plCount) {
        result := ComCall(8, this, "int*", plCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<BSTR>} szName 
     * @param {Pointer<Int32>} lCount 
     * @param {Pointer<Double>} dLast 
     * @param {Pointer<Double>} dAverage 
     * @param {Pointer<Double>} dStdDev 
     * @param {Pointer<Double>} dMin 
     * @param {Pointer<Double>} dMax 
     * @returns {HRESULT} 
     */
    GetValueByIndex(lIndex, szName, lCount, dLast, dAverage, dStdDev, dMin, dMax) {
        result := ComCall(9, this, "int", lIndex, "ptr", szName, "int*", lCount, "double*", dLast, "double*", dAverage, "double*", dStdDev, "double*", dMin, "double*", dMax, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} szName 
     * @param {Pointer<Int32>} lIndex 
     * @param {Pointer<Int32>} lCount 
     * @param {Pointer<Double>} dLast 
     * @param {Pointer<Double>} dAverage 
     * @param {Pointer<Double>} dStdDev 
     * @param {Pointer<Double>} dMin 
     * @param {Pointer<Double>} dMax 
     * @returns {HRESULT} 
     */
    GetValueByName(szName, lIndex, lCount, dLast, dAverage, dStdDev, dMin, dMax) {
        szName := szName is String ? BSTR.Alloc(szName).Value : szName

        result := ComCall(10, this, "ptr", szName, "int*", lIndex, "int*", lCount, "double*", dLast, "double*", dAverage, "double*", dStdDev, "double*", dMin, "double*", dMax, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} szName 
     * @param {Integer} lCreate 
     * @param {Pointer<Int32>} plIndex 
     * @returns {HRESULT} 
     */
    GetIndex(szName, lCreate, plIndex) {
        szName := szName is String ? BSTR.Alloc(szName).Value : szName

        result := ComCall(11, this, "ptr", szName, "int", lCreate, "int*", plIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Float} dValue 
     * @returns {HRESULT} 
     */
    AddValue(lIndex, dValue) {
        result := ComCall(12, this, "int", lIndex, "double", dValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
