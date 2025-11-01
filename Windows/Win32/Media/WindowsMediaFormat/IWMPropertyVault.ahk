#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPropertyVault interface provides methods to store and retrieve properties.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmpropertyvault
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMPropertyVault extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPropertyVault
     * @type {Guid}
     */
    static IID => Guid("{72995a79-5090-42a4-9c8c-d9d0b6d34be5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPropertyCount", "GetPropertyByName", "SetProperty", "GetPropertyByIndex", "CopyPropertiesFrom", "Clear"]

    /**
     * 
     * @param {Pointer<Integer>} pdwCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmpropertyvault-getpropertycount
     */
    GetPropertyCount(pdwCount) {
        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwCountMarshal, pdwCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Pointer<Integer>} pType 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pdwSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmpropertyvault-getpropertybyname
     */
    GetPropertyByName(pszName, pType, pValue, pdwSize) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        pValueMarshal := pValue is VarRef ? "char*" : "ptr"
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pszName, pTypeMarshal, pType, pValueMarshal, pValue, pdwSizeMarshal, pdwSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Integer} pType 
     * @param {Pointer<Integer>} pValue 
     * @param {Integer} dwSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmpropertyvault-setproperty
     */
    SetProperty(pszName, pType, pValue, dwSize) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pValueMarshal := pValue is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, "ptr", pszName, "int", pType, pValueMarshal, pValue, "uint", dwSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {PWSTR} pszName 
     * @param {Pointer<Integer>} pdwNameLen 
     * @param {Pointer<Integer>} pType 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pdwSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmpropertyvault-getpropertybyindex
     */
    GetPropertyByIndex(dwIndex, pszName, pdwNameLen, pType, pValue, pdwSize) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pdwNameLenMarshal := pdwNameLen is VarRef ? "uint*" : "ptr"
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        pValueMarshal := pValue is VarRef ? "char*" : "ptr"
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", dwIndex, "ptr", pszName, pdwNameLenMarshal, pdwNameLen, pTypeMarshal, pType, pValueMarshal, pValue, pdwSizeMarshal, pdwSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMPropertyVault} pIWMPropertyVault 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmpropertyvault-copypropertiesfrom
     */
    CopyPropertiesFrom(pIWMPropertyVault) {
        result := ComCall(7, this, "ptr", pIWMPropertyVault, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmpropertyvault-clear
     */
    Clear() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
