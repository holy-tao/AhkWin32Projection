#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMDMMetaData interface sets and retrieves metadata properties (such as artist, album, genre, and so on) of a storage.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdmmetadata
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMMetaData extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDMMetaData
     * @type {Guid}
     */
    static IID => Guid("{ec3b0663-0951-460a-9a80-0dceed3c043c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddItem", "QueryByName", "QueryByIndex", "GetItemCount"]

    /**
     * 
     * @param {Integer} Type 
     * @param {PWSTR} pwszTagName 
     * @param {Pointer<Integer>} pValue 
     * @param {Integer} iLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmmetadata-additem
     */
    AddItem(Type, pwszTagName, pValue, iLength) {
        pwszTagName := pwszTagName is String ? StrPtr(pwszTagName) : pwszTagName

        pValueMarshal := pValue is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "int", Type, "ptr", pwszTagName, pValueMarshal, pValue, "uint", iLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszTagName 
     * @param {Pointer<Integer>} pType 
     * @param {Pointer<Pointer<Integer>>} pValue 
     * @param {Pointer<Integer>} pcbLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmmetadata-querybyname
     */
    QueryByName(pwszTagName, pType, pValue, pcbLength) {
        pwszTagName := pwszTagName is String ? StrPtr(pwszTagName) : pwszTagName

        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        pValueMarshal := pValue is VarRef ? "ptr*" : "ptr"
        pcbLengthMarshal := pcbLength is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pwszTagName, pTypeMarshal, pType, pValueMarshal, pValue, pcbLengthMarshal, pcbLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iIndex 
     * @param {Pointer<Pointer<Integer>>} ppwszName 
     * @param {Pointer<Integer>} pType 
     * @param {Pointer<Pointer<Integer>>} ppValue 
     * @param {Pointer<Integer>} pcbLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmmetadata-querybyindex
     */
    QueryByIndex(iIndex, ppwszName, pType, ppValue, pcbLength) {
        ppwszNameMarshal := ppwszName is VarRef ? "ptr*" : "ptr"
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        ppValueMarshal := ppValue is VarRef ? "ptr*" : "ptr"
        pcbLengthMarshal := pcbLength is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", iIndex, ppwszNameMarshal, ppwszName, pTypeMarshal, pType, ppValueMarshal, ppValue, pcbLengthMarshal, pcbLength, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmmetadata-getitemcount
     */
    GetItemCount() {
        result := ComCall(6, this, "uint*", &iCount := 0, "HRESULT")
        return iCount
    }
}
