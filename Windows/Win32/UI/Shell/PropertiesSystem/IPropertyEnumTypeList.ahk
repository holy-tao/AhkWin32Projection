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
     * 
     * @param {Pointer<UInt32>} pctypes 
     * @returns {HRESULT} 
     */
    GetCount(pctypes) {
        result := ComCall(3, this, "uint*", pctypes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} itype 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    GetAt(itype, riid, ppv) {
        result := ComCall(4, this, "uint", itype, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    GetConditionAt(nIndex, riid, ppv) {
        result := ComCall(5, this, "uint", nIndex, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPVARIANT>} propvarCmp 
     * @param {Pointer<UInt32>} pnIndex 
     * @returns {HRESULT} 
     */
    FindMatchingIndex(propvarCmp, pnIndex) {
        result := ComCall(6, this, "ptr", propvarCmp, "uint*", pnIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
