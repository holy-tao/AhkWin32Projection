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
     * Creates a new shared property with the specified index.
     * @param {Integer} Index The numeric index within the <a href="https://docs.microsoft.com/windows/desktop/cossdk/sharedpropertygroup">SharedPropertyGroup</a> object by which the new property is referenced. You can use this index later to retrieve the shared property with the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-isharedpropertygroup-get_propertybyposition">get_PropertyByPosition</a> method.
     * @param {Pointer<VARIANT_BOOL>} fExists A reference to a Boolean value. If <i>fExists</i> is set to VARIANT_TRUE on return from this method, the shared property specified by <i>Index</i> existed prior to this call. If it is set to VARIANT_FALSE, the property was created by this call.
     * @param {Pointer<ISharedProperty>} ppProp A reference to a shared property object identified by the numeric index passed in the <i>Index</i> parameter, or <b>NULL</b> if an error is encountered.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-isharedpropertygroup-createpropertybyposition
     */
    CreatePropertyByPosition(Index, fExists, ppProp) {
        fExistsMarshal := fExists is VarRef ? "short*" : "ptr"

        result := ComCall(7, this, "int", Index, fExistsMarshal, fExists, "ptr*", ppProp, "HRESULT")
        return result
    }

    /**
     * Retrieves a reference to an existing shared property with the specified index.
     * @param {Integer} Index The numeric index that was used to create the shared property that is retrieved.
     * @returns {ISharedProperty} A reference to the shared property specified in the <i>Index</i> parameter, or <b>NULL</b> if the property does not exist.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-isharedpropertygroup-get_propertybyposition
     */
    get_PropertyByPosition(Index) {
        result := ComCall(8, this, "int", Index, "ptr*", &ppProperty := 0, "HRESULT")
        return ISharedProperty(ppProperty)
    }

    /**
     * Creates a new shared property with the specified name.
     * @param {BSTR} Name The name of the property to create. You can use this name later to obtain a reference to this property by using the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-isharedpropertygroup-get_property">get_Property</a> method.
     * @param {Pointer<VARIANT_BOOL>} fExists A reference to a Boolean value that is set to VARIANT_TRUE on return from this method if the shared property specified in the <i>Name</i> parameter existed prior to this call, and VARIANT_FALSE if the property was created by this call.
     * @param {Pointer<ISharedProperty>} ppProp A reference to a <a href="https://docs.microsoft.com/windows/desktop/cossdk/sharedproperty">SharedProperty</a> object with the name specified in the <i>Name</i> parameter, or <b>NULL</b> if an error is encountered.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-isharedpropertygroup-createproperty
     */
    CreateProperty(Name, fExists, ppProp) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        fExistsMarshal := fExists is VarRef ? "short*" : "ptr"

        result := ComCall(9, this, "ptr", Name, fExistsMarshal, fExists, "ptr*", ppProp, "HRESULT")
        return result
    }

    /**
     * Retrieves a reference to an existing shared property with the specified name.
     * @param {BSTR} Name The name that was used to create the shared property that is retrieved.
     * @returns {ISharedProperty} A reference to the shared property specified in the <i>Name</i> parameter, or <b>NULL</b> if the property does not exist.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-isharedpropertygroup-get_property
     */
    get_Property(Name) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(10, this, "ptr", Name, "ptr*", &ppProperty := 0, "HRESULT")
        return ISharedProperty(ppProperty)
    }
}
