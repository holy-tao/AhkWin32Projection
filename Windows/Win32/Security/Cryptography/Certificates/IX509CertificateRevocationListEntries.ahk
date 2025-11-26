#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509CertificateRevocationListEntry.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509CertificateRevocationListEntries extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509CertificateRevocationListEntries
     * @type {Guid}
     */
    static IID => Guid("{728ab35f-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ItemByIndex", "get_Count", "get__NewEnum", "Add", "Remove", "Clear", "get_IndexBySerialNumber", "AddRange"]

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {IX509CertificateRevocationListEntry} 
     */
    get_ItemByIndex(Index) {
        result := ComCall(7, this, "int", Index, "ptr*", &pVal := 0, "HRESULT")
        return IX509CertificateRevocationListEntry(pVal)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(8, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &pVal := 0, "HRESULT")
        return IUnknown(pVal)
    }

    /**
     * 
     * @param {IX509CertificateRevocationListEntry} pVal 
     * @returns {HRESULT} 
     */
    Add(pVal) {
        result := ComCall(10, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {HRESULT} 
     */
    Remove(Index) {
        result := ComCall(11, this, "int", Index, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Clear() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} SerialNumber 
     * @returns {Integer} 
     */
    get_IndexBySerialNumber(Encoding, SerialNumber) {
        SerialNumber := SerialNumber is String ? BSTR.Alloc(SerialNumber).Value : SerialNumber

        result := ComCall(13, this, "int", Encoding, "ptr", SerialNumber, "int*", &pIndex := 0, "HRESULT")
        return pIndex
    }

    /**
     * 
     * @param {IX509CertificateRevocationListEntries} pValue 
     * @returns {HRESULT} 
     */
    AddRange(pValue) {
        result := ComCall(14, this, "ptr", pValue, "HRESULT")
        return result
    }
}
