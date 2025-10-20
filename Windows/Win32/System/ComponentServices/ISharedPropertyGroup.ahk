#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Used to create and access the shared properties in a shared property group.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-isharedpropertygroup
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ISharedPropertyGroup extends IDispatch{
    /**
     * The interface identifier for ISharedPropertyGroup
     * @type {Guid}
     */
    static IID => Guid("{2a005c07-a5de-11cf-9e66-00aa00a3f464}")

    /**
     * The class identifier for SharedPropertyGroup
     * @type {Guid}
     */
    static CLSID => Guid("{2a005c0b-a5de-11cf-9e66-00aa00a3f464}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<VARIANT_BOOL>} fExists 
     * @param {Pointer<ISharedProperty>} ppProp 
     * @returns {HRESULT} 
     */
    CreatePropertyByPosition(Index, fExists, ppProp) {
        result := ComCall(7, this, "int", Index, "ptr", fExists, "ptr", ppProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<ISharedProperty>} ppProperty 
     * @returns {HRESULT} 
     */
    get_PropertyByPosition(Index, ppProperty) {
        result := ComCall(8, this, "int", Index, "ptr", ppProperty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Name 
     * @param {Pointer<VARIANT_BOOL>} fExists 
     * @param {Pointer<ISharedProperty>} ppProp 
     * @returns {HRESULT} 
     */
    CreateProperty(Name, fExists, ppProp) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(9, this, "ptr", Name, "ptr", fExists, "ptr", ppProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Name 
     * @param {Pointer<ISharedProperty>} ppProperty 
     * @returns {HRESULT} 
     */
    get_Property(Name, ppProperty) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(10, this, "ptr", Name, "ptr", ppProperty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
