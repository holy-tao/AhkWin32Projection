#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that provide an object with a specified property bag in which the object can save its properties.
 * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nn-shlobj_core-inamedpropertybag
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class INamedPropertyBag extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INamedPropertyBag
     * @type {Guid}
     */
    static IID => Guid("{fb700430-952c-11d1-946f-000000000000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReadPropertyNPB", "WritePropertyNPB", "RemovePropertyNPB"]

    /**
     * 
     * @param {PWSTR} pszBagname 
     * @param {PWSTR} pszPropName 
     * @param {Pointer<PROPVARIANT>} pVar 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-inamedpropertybag-readpropertynpb
     */
    ReadPropertyNPB(pszBagname, pszPropName, pVar) {
        pszBagname := pszBagname is String ? StrPtr(pszBagname) : pszBagname
        pszPropName := pszPropName is String ? StrPtr(pszPropName) : pszPropName

        result := ComCall(3, this, "ptr", pszBagname, "ptr", pszPropName, "ptr", pVar, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszBagname 
     * @param {PWSTR} pszPropName 
     * @param {Pointer<PROPVARIANT>} pVar 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-inamedpropertybag-writepropertynpb
     */
    WritePropertyNPB(pszBagname, pszPropName, pVar) {
        pszBagname := pszBagname is String ? StrPtr(pszBagname) : pszBagname
        pszPropName := pszPropName is String ? StrPtr(pszPropName) : pszPropName

        result := ComCall(4, this, "ptr", pszBagname, "ptr", pszPropName, "ptr", pVar, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszBagname 
     * @param {PWSTR} pszPropName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-inamedpropertybag-removepropertynpb
     */
    RemovePropertyNPB(pszBagname, pszPropName) {
        pszBagname := pszBagname is String ? StrPtr(pszBagname) : pszBagname
        pszPropName := pszPropName is String ? StrPtr(pszPropName) : pszPropName

        result := ComCall(5, this, "ptr", pszBagname, "ptr", pszPropName, "HRESULT")
        return result
    }
}
