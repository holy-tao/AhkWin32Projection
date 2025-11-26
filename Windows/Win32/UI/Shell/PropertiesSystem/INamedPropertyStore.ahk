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
     * Gets the value of a named property from the named property store.
     * @param {PWSTR} pszName Type: <b>LPCWSTR</b>
     * 
     * A pointer to the property name, as a Unicode string, of the property in the named property store.
     * @returns {PROPVARIANT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * When this method returns, contains a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure that holds the property's value.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-inamedpropertystore-getnamedvalue
     */
    GetNamedValue(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        ppropvar := PROPVARIANT()
        result := ComCall(3, this, "ptr", pszName, "ptr", ppropvar, "HRESULT")
        return ppropvar
    }

    /**
     * Sets the value of a named property.
     * @param {PWSTR} pszName Type: <b>LPCWSTR</b>
     * 
     * A pointer to the property name, as a Unicode string, in the named property store.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure that contains the value to set for the property named in <i>pszName</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-inamedpropertystore-setnamedvalue
     */
    SetNamedValue(pszName, propvar) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(4, this, "ptr", pszName, "ptr", propvar, "HRESULT")
        return result
    }

    /**
     * Gets the number of property names in the property store.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * When this method returns, contains a pointer to the count of names.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-inamedpropertystore-getnamecount
     */
    GetNameCount() {
        result := ComCall(5, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * Gets the name of a property at a specified index in the property store.
     * @param {Integer} iProp Type: <b>DWORD</b>
     * 
     * The index of the property in the store.
     * @returns {BSTR} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a>*</b>
     * 
     * When this method returns, contains a pointer to the property's name. It is the calling application's responsibility to free this resource when it is no longer needed.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-inamedpropertystore-getnameat
     */
    GetNameAt(iProp) {
        pbstrName := BSTR()
        result := ComCall(6, this, "uint", iProp, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }
}
