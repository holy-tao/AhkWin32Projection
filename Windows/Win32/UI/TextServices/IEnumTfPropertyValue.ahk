#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumTfPropertyValue.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumTfPropertyValue interface is implemented by the TSF manager to provide an enumeration of property values.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-ienumtfpropertyvalue
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class IEnumTfPropertyValue extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumTfPropertyValue
     * @type {Guid}
     */
    static IID => Guid("{8ed8981b-7c10-4d7d-9fb3-ab72e9c75f72}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Clone", "Next", "Reset", "Skip"]

    /**
     * 
     * @returns {IEnumTfPropertyValue} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-ienumtfpropertyvalue-clone
     */
    Clone() {
        result := ComCall(3, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfPropertyValue(ppEnum)
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @param {Pointer<TF_PROPERTYVAL>} rgValues 
     * @param {Pointer<Integer>} pcFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-ienumtfpropertyvalue-next
     */
    Next(ulCount, rgValues, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", ulCount, "ptr", rgValues, pcFetchedMarshal, pcFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-ienumtfpropertyvalue-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-ienumtfpropertyvalue-skip
     */
    Skip(ulCount) {
        result := ComCall(6, this, "uint", ulCount, "HRESULT")
        return result
    }
}
