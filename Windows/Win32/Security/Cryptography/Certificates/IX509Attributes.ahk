#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IX509Attributes interface defines the following methods and properties that enable you to manage a collection of IX509Attribute objects.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509attributes
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509Attributes extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509Attributes
     * @type {Guid}
     */
    static IID => Guid("{728ab323-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ItemByIndex", "get_Count", "get__NewEnum", "Add", "Remove", "Clear"]

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<IX509Attribute>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributes-get_itembyindex
     */
    get_ItemByIndex(Index, pVal) {
        result := ComCall(7, this, "int", Index, "ptr*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributes-get_count
     */
    get_Count(pVal) {
        result := ComCall(8, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributes-get__newenum
     */
    get__NewEnum(pVal) {
        result := ComCall(9, this, "ptr*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IX509Attribute} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributes-add
     */
    Add(pVal) {
        result := ComCall(10, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributes-remove
     */
    Remove(Index) {
        result := ComCall(11, this, "int", Index, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributes-clear
     */
    Clear() {
        result := ComCall(12, this, "HRESULT")
        return result
    }
}
