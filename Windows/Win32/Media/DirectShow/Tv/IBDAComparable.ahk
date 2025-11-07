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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CompareExact", "CompareEquivalent", "HashExact", "HashExactIncremental", "HashEquivalent", "HashEquivalentIncremental"]

    /**
     * 
     * @param {IDispatch} CompareTo 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ibdacomparable-compareexact
     */
    CompareExact(CompareTo) {
        result := ComCall(3, this, "ptr", CompareTo, "int*", &Result := 0, "HRESULT")
        return Result
    }

    /**
     * 
     * @param {IDispatch} CompareTo 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ibdacomparable-compareequivalent
     */
    CompareEquivalent(CompareTo, dwFlags) {
        result := ComCall(4, this, "ptr", CompareTo, "uint", dwFlags, "int*", &Result := 0, "HRESULT")
        return Result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ibdacomparable-hashexact
     */
    HashExact() {
        result := ComCall(5, this, "int64*", &Result := 0, "HRESULT")
        return Result
    }

    /**
     * 
     * @param {Integer} PartialResult 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ibdacomparable-hashexactincremental
     */
    HashExactIncremental(PartialResult) {
        result := ComCall(6, this, "int64", PartialResult, "int64*", &Result := 0, "HRESULT")
        return Result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ibdacomparable-hashequivalent
     */
    HashEquivalent(dwFlags) {
        result := ComCall(7, this, "uint", dwFlags, "int64*", &Result := 0, "HRESULT")
        return Result
    }

    /**
     * 
     * @param {Integer} PartialResult 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ibdacomparable-hashequivalentincremental
     */
    HashEquivalentIncremental(PartialResult, dwFlags) {
        result := ComCall(8, this, "int64", PartialResult, "uint", dwFlags, "int64*", &Result := 0, "HRESULT")
        return Result
    }
}
