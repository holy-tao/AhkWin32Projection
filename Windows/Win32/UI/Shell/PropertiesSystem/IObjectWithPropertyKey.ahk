#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\PROPERTYKEY.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods for getting and setting the property key.
 * @see https://docs.microsoft.com/windows/win32/api//propsys/nn-propsys-iobjectwithpropertykey
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class IObjectWithPropertyKey extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IObjectWithPropertyKey
     * @type {Guid}
     */
    static IID => Guid("{fc0ca0a7-c316-4fd2-9031-3e628e6d4f23}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPropertyKey", "GetPropertyKey"]

    /**
     * Sets the property key.
     * @param {Pointer<PROPERTYKEY>} key Type: <b>REFPROPERTYKEY</b>
     * 
     * The property key.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-iobjectwithpropertykey-setpropertykey
     */
    SetPropertyKey(key) {
        result := ComCall(3, this, "ptr", key, "HRESULT")
        return result
    }

    /**
     * Gets the property key.
     * @returns {PROPERTYKEY} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a>*</b>
     * 
     * When this returns, contains the property key.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-iobjectwithpropertykey-getpropertykey
     */
    GetPropertyKey() {
        pkey := PROPERTYKEY()
        result := ComCall(4, this, "ptr", pkey, "HRESULT")
        return pkey
    }
}
