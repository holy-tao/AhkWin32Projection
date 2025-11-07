#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\StructuredStorage\PROPVARIANT.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that get and set named properties.
 * @see https://docs.microsoft.com/windows/win32/api//propsys/nn-propsys-inamedpropertystore
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class INamedPropertyStore extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INamedPropertyStore
     * @type {Guid}
     */
    static IID => Guid("{71604b0f-97b0-4764-8577-2f13e98a1422}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNamedValue", "SetNamedValue", "GetNameCount", "GetNameAt"]

    /**
     * 
     * @param {PWSTR} pszName 
     * @returns {PROPVARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-inamedpropertystore-getnamedvalue
     */
    GetNamedValue(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        ppropvar := PROPVARIANT()
        result := ComCall(3, this, "ptr", pszName, "ptr", ppropvar, "HRESULT")
        return ppropvar
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Pointer<PROPVARIANT>} propvar 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-inamedpropertystore-setnamedvalue
     */
    SetNamedValue(pszName, propvar) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(4, this, "ptr", pszName, "ptr", propvar, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-inamedpropertystore-getnamecount
     */
    GetNameCount() {
        result := ComCall(5, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * 
     * @param {Integer} iProp 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-inamedpropertystore-getnameat
     */
    GetNameAt(iProp) {
        pbstrName := BSTR()
        result := ComCall(6, this, "uint", iProp, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }
}
