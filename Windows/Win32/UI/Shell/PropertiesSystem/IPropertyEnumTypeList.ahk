#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that enumerate the possible values for a property.
 * @see https://docs.microsoft.com/windows/win32/api//propsys/nn-propsys-ipropertyenumtypelist
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class IPropertyEnumTypeList extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertyEnumTypeList
     * @type {Guid}
     */
    static IID => Guid("{a99400f4-3d84-4557-94ba-1242fb2cc9a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "GetAt", "GetConditionAt", "FindMatchingIndex"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertyenumtypelist-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &pctypes := 0, "HRESULT")
        return pctypes
    }

    /**
     * 
     * @param {Integer} itype 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertyenumtypelist-getat
     */
    GetAt(itype, riid) {
        result := ComCall(4, this, "uint", itype, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertyenumtypelist-getconditionat
     */
    GetConditionAt(nIndex, riid) {
        result := ComCall(5, this, "uint", nIndex, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {Pointer<PROPVARIANT>} propvarCmp 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertyenumtypelist-findmatchingindex
     */
    FindMatchingIndex(propvarCmp) {
        result := ComCall(6, this, "ptr", propvarCmp, "uint*", &pnIndex := 0, "HRESULT")
        return pnIndex
    }
}
