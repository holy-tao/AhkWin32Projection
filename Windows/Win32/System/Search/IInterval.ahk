#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides a method to get the limits of an interval.
 * @see https://learn.microsoft.com/windows/win32/api//content/structuredquery/nn-structuredquery-iinterval
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IInterval extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInterval
     * @type {Guid}
     */
    static IID => Guid("{6bf0a714-3c18-430b-8b5d-83b1c234d3db}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLimits"]

    /**
     * Specifies the lower and upper limits of an interval, each of which may be infinite or a specific value.
     * @remarks
     * This method retrieves interval limits in two <a href="https://docs.microsoft.com/windows/win32/api/structuredquery/ne-structuredquery-interval_limit_kind">INTERVAL_LIMIT_KIND</a>—<a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> pairs. The first pair specifies the lower limit of the interval, and the second pari specifies the upper limit of the interval. 
     * 
     * The lower limit must be less than the upper limit or the interval will be empty. The only exception is when the lower and upper limits are equal and both are set to <i>ILK_EXPLICIT_INCLUDED</i>. In this case the range is the single value to which both limits are set. The following table illustrates how the pairs work to define intervals.
     * 
     * 
     * 
     * <table class="clsStd">
     * <tr>
     * <th>pilkLower</th>
     * <th>ppropvarLower</th>
     * <th>pilkLower</th>
     * <th>ppropvarLower</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>ILK_EXPLICIT_INCLUDED</td>
     * <td>3</td>
     * <td>ILK_EXPLICIT_INCLUDED</td>
     * <td>3</td>
     * <td>
     * The lowest value in the range is 3 because the 3 is explicitly included in the range.
     * 
     * The highest value in the range is also 3 (explicitly included), and the interval consists of only the number 3.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>ILK_EXPLICIT_INCLUDED</td>
     * <td>3</td>
     * <td>ILK_EXPLICIT_EXCLUDED</td>
     * <td>3</td>
     * <td>The lowest value in the range is 3 (explicitly included), but the upper limit is also 3 and is explicitly excluded. Therefore, the interval being described is an empty interval.</td>
     * </tr>
     * <tr>
     * <td>ILK_EXPLICIT_INCLUDED</td>
     * <td>3</td>
     * <td>ILK_EXPLICIT_EXCLUDED</td>
     * <td>6</td>
     * <td>The integer interval begins at and includes 3, and ends at but does not include 6.</td>
     * </tr>
     * <tr>
     * <td>ILK_NEGATIVE_INFINITY</td>
     * <td>VT_EMPTY</td>
     * <td>ILK_POSITIVE_INFINITY</td>
     * <td>VT_EMPTY</td>
     * <td>All integers are included in the interval.</td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pilkLower Type: <b><a href="https://docs.microsoft.com/windows/win32/api/structuredquery/ne-structuredquery-interval_limit_kind">INTERVAL_LIMIT_KIND</a>*</b>
     * 
     * Receives a pointer to a value from the <a href="https://docs.microsoft.com/windows/win32/api/structuredquery/ne-structuredquery-interval_limit_kind">INTERVAL_LIMIT_KIND</a> enumeration that indicates whether the lower bound of the interval is inclusive, exclusive, or infinite.
     * @param {Pointer<PROPVARIANT>} ppropvarLower Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * Receives a pointer to the value for the lower limit of the interval. If the <i>pilkLower</i> parameter is set to <i>ILK_NEGATIVE_INFINITY</i> or <i>ILK_POSITIVE_INFINITY</i>, this value is set to <b>VT_EMPTY</b>.
     * @param {Pointer<Integer>} pilkUpper Type: <b><a href="https://docs.microsoft.com/windows/win32/api/structuredquery/ne-structuredquery-interval_limit_kind">INTERVAL_LIMIT_KIND</a>*</b>
     * 
     * Receives a pointer to a value from the <a href="https://docs.microsoft.com/windows/win32/api/structuredquery/ne-structuredquery-interval_limit_kind">INTERVAL_LIMIT_KIND</a> enumeration that indicates whether the upper bound of the interval is inclusive, exclusive, or infinite.
     * @param {Pointer<PROPVARIANT>} ppropvarUpper Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * Receives a pointer to the value for the upper limit of the interval. If the <i>pilkUpper</i> parameter is set to <i>ILK_NEGATIVE_INFINITY</i> or <i>ILK_POSITIVE_INFINITY</i>, this value will be set to <b>VT_EMPTY</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/structuredquery/nf-structuredquery-iinterval-getlimits
     */
    GetLimits(pilkLower, ppropvarLower, pilkUpper, ppropvarUpper) {
        pilkLowerMarshal := pilkLower is VarRef ? "int*" : "ptr"
        pilkUpperMarshal := pilkUpper is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pilkLowerMarshal, pilkLower, "ptr", ppropvarLower, pilkUpperMarshal, pilkUpper, "ptr", ppropvarUpper, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
