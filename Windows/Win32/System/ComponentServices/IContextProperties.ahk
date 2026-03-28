#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IEnumNames.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides access to context object properties.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-icontextproperties
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IContextProperties extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContextProperties
     * @type {Guid}
     */
    static IID => Guid("{d396da85-bf8f-11d1-bbae-00c04fc2fa5f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Count", "GetProperty", "EnumNames", "SetProperty", "RemoveProperty"]

    /**
     * Retrieves the number of context object properties.
     * @param {Pointer<Integer>} plCount The number of context object properties.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icontextproperties-count
     */
    Count(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * Retrieves a context object property.
     * @remarks
     * To retrieve an IIS object, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> using the VT_DISPATCH member of the returned <b>VARIANT</b> for the interface to the IIS object (for example, IResponse for the Response object).
     * @param {BSTR} name The name of the context object property to be retrieved.
     * 
     * The following are IIS intrinsic properties.
     * 
     * <ul>
     * <li>Application</li>
     * <li>Request</li>
     * <li>Response</li>
     * <li>Server</li>
     * <li>Session</li>
     * </ul>
     * The following is the COMTI intrinsic property:
     * 
     * <ul>
     * <li>host-security-callback.cedar.microsoft.com</li>
     * </ul>
     * @param {Pointer<VARIANT>} pProperty A pointer to the property.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icontextproperties-getproperty
     */
    GetProperty(name, pProperty) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(4, this, "ptr", name, "ptr", pProperty, "HRESULT")
        return result
    }

    /**
     * Retrieves a reference to an enumerator for the context object properties.
     * @remarks
     * Use the <b>EnumNames</b> method to obtain a reference to an enumerator object. The returned <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-ienumnames">IEnumNames</a> interface exposes several methods you can use to iterate through a list of <b>BSTR</b> values representing context object properties. When you have a name, you can use the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-icontextproperties-getproperty">GetProperty</a> method to obtain a reference to the context object property it represents. As with any COM object, you must release an enumerator object when you are finished using it.
     * @returns {IEnumNames} A reference to the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-ienumnames">IEnumNames</a> interface on a new enumerator object that you can use to iterate through all the context object properties.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icontextproperties-enumnames
     */
    EnumNames() {
        result := ComCall(5, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumNames(ppenum)
    }

    /**
     * Sets a context object property.
     * @param {BSTR} name The name of the context object property to be set. See <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-icontextproperties-getproperty">GetProperty</a> for a list of valid property names.
     * @param {VARIANT} _property 
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icontextproperties-setproperty
     */
    SetProperty(name, _property) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(6, this, "ptr", name, "ptr", _property, "HRESULT")
        return result
    }

    /**
     * Removes a context object property.
     * @param {BSTR} name The name of the context object property to be removed. See <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-icontextproperties-getproperty">GetProperty</a> for a list of valid property names.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icontextproperties-removeproperty
     */
    RemoveProperty(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(7, this, "ptr", name, "HRESULT")
        return result
    }
}
