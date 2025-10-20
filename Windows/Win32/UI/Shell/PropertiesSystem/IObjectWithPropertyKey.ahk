#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-iobjectwithpropertykey-setpropertykey
     */
    SetPropertyKey(key) {
        result := ComCall(3, this, "ptr", key, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} pkey 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-iobjectwithpropertykey-getpropertykey
     */
    GetPropertyKey(pkey) {
        result := ComCall(4, this, "ptr", pkey, "HRESULT")
        return result
    }
}
