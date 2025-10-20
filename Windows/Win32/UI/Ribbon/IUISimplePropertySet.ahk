#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * IUISimplePropertySet is a read-only interface that defines a method for retrieving the value identified by a property key.
 * @see https://docs.microsoft.com/windows/win32/api//uiribbon/nn-uiribbon-iuisimplepropertyset
 * @namespace Windows.Win32.UI.Ribbon
 * @version v4.0.30319
 */
class IUISimplePropertySet extends IUnknown{
    /**
     * The interface identifier for IUISimplePropertySet
     * @type {Guid}
     */
    static IID => Guid("{c205bb48-5b1c-4219-a106-15bd0a5f24e2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<PROPVARIANT>} value 
     * @returns {HRESULT} 
     */
    GetValue(key, value) {
        result := ComCall(3, this, "ptr", key, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
