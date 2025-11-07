#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISharedProperty.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Used to create and access the shared properties in a shared property group.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-isharedpropertygroup
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ISharedPropertyGroup extends IDispatch{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreatePropertyByPosition", "get_PropertyByPosition", "CreateProperty", "get_Property"]

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<VARIANT_BOOL>} fExists 
     * @param {Pointer<ISharedProperty>} ppProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isharedpropertygroup-createpropertybyposition
     */
    CreatePropertyByPosition(Index, fExists, ppProp) {
        fExistsMarshal := fExists is VarRef ? "short*" : "ptr"

        result := ComCall(7, this, "int", Index, fExistsMarshal, fExists, "ptr*", ppProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {ISharedProperty} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isharedpropertygroup-get_propertybyposition
     */
    get_PropertyByPosition(Index) {
        result := ComCall(8, this, "int", Index, "ptr*", &ppProperty := 0, "HRESULT")
        return ISharedProperty(ppProperty)
    }

    /**
     * 
     * @param {BSTR} Name 
     * @param {Pointer<VARIANT_BOOL>} fExists 
     * @param {Pointer<ISharedProperty>} ppProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isharedpropertygroup-createproperty
     */
    CreateProperty(Name, fExists, ppProp) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        fExistsMarshal := fExists is VarRef ? "short*" : "ptr"

        result := ComCall(9, this, "ptr", Name, fExistsMarshal, fExists, "ptr*", ppProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Name 
     * @returns {ISharedProperty} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isharedpropertygroup-get_property
     */
    get_Property(Name) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(10, this, "ptr", Name, "ptr*", &ppProperty := 0, "HRESULT")
        return ISharedProperty(ppProperty)
    }
}
