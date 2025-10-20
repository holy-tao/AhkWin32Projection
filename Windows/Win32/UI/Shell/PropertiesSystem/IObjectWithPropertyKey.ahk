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
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {HRESULT} 
     */
    SetPropertyKey(key) {
        result := ComCall(3, this, "ptr", key, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} pkey 
     * @returns {HRESULT} 
     */
    GetPropertyKey(pkey) {
        result := ComCall(4, this, "ptr", pkey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
