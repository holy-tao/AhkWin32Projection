#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDAComparable)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-ibdacomparable
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IBDAComparable extends IUnknown{
    /**
     * The interface identifier for IBDAComparable
     * @type {Guid}
     */
    static IID => Guid("{b34505e0-2f0e-497b-80bc-d43f3b24ed7f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IDispatch>} CompareTo 
     * @param {Pointer<Int32>} Result 
     * @returns {HRESULT} 
     */
    CompareExact(CompareTo, Result) {
        result := ComCall(3, this, "ptr", CompareTo, "int*", Result, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} CompareTo 
     * @param {Integer} dwFlags 
     * @param {Pointer<Int32>} Result 
     * @returns {HRESULT} 
     */
    CompareEquivalent(CompareTo, dwFlags, Result) {
        result := ComCall(4, this, "ptr", CompareTo, "uint", dwFlags, "int*", Result, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} Result 
     * @returns {HRESULT} 
     */
    HashExact(Result) {
        result := ComCall(5, this, "int64*", Result, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} PartialResult 
     * @param {Pointer<Int64>} Result 
     * @returns {HRESULT} 
     */
    HashExactIncremental(PartialResult, Result) {
        result := ComCall(6, this, "int64", PartialResult, "int64*", Result, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<Int64>} Result 
     * @returns {HRESULT} 
     */
    HashEquivalent(dwFlags, Result) {
        result := ComCall(7, this, "uint", dwFlags, "int64*", Result, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} PartialResult 
     * @param {Integer} dwFlags 
     * @param {Pointer<Int64>} Result 
     * @returns {HRESULT} 
     */
    HashEquivalentIncremental(PartialResult, dwFlags, Result) {
        result := ComCall(8, this, "int64", PartialResult, "uint", dwFlags, "int64*", Result, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
