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
     * Causes a property to be read from the named property bag.
     * @param {PWSTR} pszBagname Type: <b>PCWSTR</b>
     * 
     * A pointer to a string that contains the name of the property bag.
     * @param {PWSTR} pszPropName Type: <b>PCWSTR</b>
     * 
     * A pointer to a string that contains the name of the property to be read.
     * @param {Pointer<PROPVARIANT>} pVar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * The address of a <b>VARIANT</b> that, when this method returns successfully, receives the property value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-inamedpropertybag-readpropertynpb
     */
    ReadPropertyNPB(pszBagname, pszPropName, pVar) {
        pszBagname := pszBagname is String ? StrPtr(pszBagname) : pszBagname
        pszPropName := pszPropName is String ? StrPtr(pszPropName) : pszPropName

        result := ComCall(3, this, "ptr", pszBagname, "ptr", pszPropName, "ptr", pVar, "HRESULT")
        return result
    }

    /**
     * Saves a property to the named property bag.
     * @param {PWSTR} pszBagname Type: <b>PCWSTR</b>
     * 
     * A pointer to a string that contains the name of the property bag.
     * @param {PWSTR} pszPropName Type: <b>PCWSTR</b>
     * 
     * A pointer to a string that contains the name of the property to write.
     * @param {Pointer<PROPVARIANT>} pVar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * A pointer to a <b>VARIANT</b> that holds the new property value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-inamedpropertybag-writepropertynpb
     */
    WritePropertyNPB(pszBagname, pszPropName, pVar) {
        pszBagname := pszBagname is String ? StrPtr(pszBagname) : pszBagname
        pszPropName := pszPropName is String ? StrPtr(pszPropName) : pszPropName

        result := ComCall(4, this, "ptr", pszBagname, "ptr", pszPropName, "ptr", pVar, "HRESULT")
        return result
    }

    /**
     * Removes a property from a named property bag.
     * @param {PWSTR} pszBagname Type: <b>PCWSTR</b>
     * 
     * A pointer to a string that contains the name of the property bag from which a property is to be removed.
     * @param {PWSTR} pszPropName Type: <b>PCWSTR</b>
     * 
     * A pointer to a string that contains the name of the property to remove.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-inamedpropertybag-removepropertynpb
     */
    RemovePropertyNPB(pszBagname, pszPropName) {
        pszBagname := pszBagname is String ? StrPtr(pszBagname) : pszBagname
        pszPropName := pszPropName is String ? StrPtr(pszPropName) : pszPropName

        result := ComCall(5, this, "ptr", pszBagname, "ptr", pszPropName, "HRESULT")
        return result
    }
}
