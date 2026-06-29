#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IOCSPProperty.ahk" { IOCSPProperty }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Represents a set of configurable attribute properties (name-value pairs) for an Online Certificate Status Protocol (OCSP) service.
 * @remarks
 * The <b>IOCSPPropertyCollection</b> contains attributes for the following:
 * 
 * <ul>
 * <li>Web proxy settings that include the  number of threads and number of cache entries</li>
 * <li>Audit settings that include start/stop, configuration change, security change, and request events</li>
 * <li>Security settings that include ACEs for <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nn-certadm-iocspadmin">IOCSPAdmin</a> interfaces</li>
 * </ul>
 * All OCSP attribute information is stored in the following registry key:
 * 
 * 
 * <b>HKEY_LOCAL_MACHINE</b>&#92;<b>SYSTEM</b>&#92;<b>CurrentControlSet</b>&#92;<b>Services</b>&#92;<b>OCSPSvc</b>&#92;<b>Responder</b>
 * 
 * 
 * 
 * OCSP attributes govern OCSP responder service behavior for all CA configurations. For more information on CA configurations, see the <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nn-certadm-iocspcaconfiguration">IOCSPCAConfiguration</a> interface topic.
 * @see https://learn.microsoft.com/windows/win32/api/certadm/nn-certadm-iocsppropertycollection
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct IOCSPPropertyCollection extends IDispatch {
    /**
     * The interface identifier for IOCSPPropertyCollection
     * @type {Guid}
     */
    static IID := Guid("{2597c18d-54e6-4b74-9fa9-a6bfda99cbbe}")

    /**
     * The class identifier for OCSPPropertyCollection
     * @type {Guid}
     */
    static CLSID := Guid("{f935a528-ba8a-4dd9-ba79-f283275cb2de}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOCSPPropertyCollection interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get__NewEnum             : IntPtr
        get_Item                 : IntPtr
        get_Count                : IntPtr
        get_ItemByName           : IntPtr
        CreateProperty           : IntPtr
        DeleteProperty           : IntPtr
        InitializeFromProperties : IntPtr
        GetAllProperties         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOCSPPropertyCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * Gets an enumerator for a property set.
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocsppropertycollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &ppVal := 0, "HRESULT")
        return IUnknown(ppVal)
    }

    /**
     * Gets the property identified by index in a property set.
     * @param {Integer} Index 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocsppropertycollection-get_item
     */
    get_Item(Index) {
        pVal := VARIANT()
        result := ComCall(8, this, "int", Index, VARIANT.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Gets the number of properties in a property set.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocsppropertycollection-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Gets the property identified by name in a property set.
     * @param {BSTR} bstrPropName 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocsppropertycollection-get_itembyname
     */
    get_ItemByName(bstrPropName) {
        bstrPropName := bstrPropName is String ? BSTR.Alloc(bstrPropName).Value : bstrPropName

        pVal := VARIANT()
        result := ComCall(10, this, BSTR, bstrPropName, VARIANT.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Creates a new property and adds it to a property set.
     * @param {BSTR} bstrPropName A string that contains the name of the new property object.
     * @param {Pointer<VARIANT>} pVarPropValue <table>
     * <tr>
     * <td><strong>C++</strong></td>
     * <td>A pointer to the new property object.</td>
     * </tr>
     * <tr>
     * <td><strong>VB</strong></td>
     * <td>The new property object.</td>
     * </tr>
     * </table>
     * @returns {IOCSPProperty} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nn-certadm-iocspproperty">IOCSPProperty</a> interface for the newly created object.
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocsppropertycollection-createproperty
     */
    CreateProperty(bstrPropName, pVarPropValue) {
        bstrPropName := bstrPropName is String ? BSTR.Alloc(bstrPropName).Value : bstrPropName

        result := ComCall(11, this, BSTR, bstrPropName, VARIANT.Ptr, pVarPropValue, "ptr*", &ppVal := 0, "HRESULT")
        return IOCSPProperty(ppVal)
    }

    /**
     * Removes a named property from a property set.
     * @param {BSTR} bstrPropName A string that contains the name of the property to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocsppropertycollection-deleteproperty
     */
    DeleteProperty(bstrPropName) {
        bstrPropName := bstrPropName is String ? BSTR.Alloc(bstrPropName).Value : bstrPropName

        result := ComCall(12, this, BSTR, bstrPropName, "HRESULT")
        return result
    }

    /**
     * Creates a property set from the properties contained in an existing server configuration.
     * @param {Pointer<VARIANT>} pVarProperties <table>
     * <tr>
     * <td><strong>C++</strong></td>
     * <td>
     * A pointer to an array that contains the property values. Each array element is a <b>VARIANT</b> array that contains the property name <b>BSTR</b> and a value <b>VARIANT</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><strong>VB</strong></td>
     * <td>
     * An array that contains the property values. Each array element is a <b>Variant</b> array that contains the property name <b>String</b> and a value <b>Variant</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} <h3>VB</h3>
     * If the method succeeds, it returns <b>S_OK</b>.
     * 
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * If the method returns <b>E_UNEXPECTED</b>, the array pointed to by the <i>pVarProperties</i> parameter contained duplicate properties.
     * 
     * If the method returns <b>DISP_E_ARRAYISLOCKED</b>, the array pointed to by the <i>pVarProperties</i> parameter is locked.
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocsppropertycollection-initializefromproperties
     */
    InitializeFromProperties(pVarProperties) {
        result := ComCall(13, this, VARIANT.Ptr, pVarProperties, "HRESULT")
        return result
    }

    /**
     * Gets all properties in a property set.
     * @returns {VARIANT} A pointer to a safe array that contains the properties as name-value pairs.
     * 
     * This array is a two-dimensional array of elements, each of type <b>VARIANT</b>. The array contains one row for each named property in the collection. Each row contains two columns: the property name and the property value.
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocsppropertycollection-getallproperties
     */
    GetAllProperties() {
        pVarProperties := VARIANT()
        result := ComCall(14, this, VARIANT.Ptr, pVarProperties, "HRESULT")
        return pVarProperties
    }

    Query(iid) {
        if (IOCSPPropertyCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.get_Item := CallbackCreate(GetMethod(implObj, "get_Item"), flags, 3)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.get_ItemByName := CallbackCreate(GetMethod(implObj, "get_ItemByName"), flags, 3)
        this.vtbl.CreateProperty := CallbackCreate(GetMethod(implObj, "CreateProperty"), flags, 4)
        this.vtbl.DeleteProperty := CallbackCreate(GetMethod(implObj, "DeleteProperty"), flags, 2)
        this.vtbl.InitializeFromProperties := CallbackCreate(GetMethod(implObj, "InitializeFromProperties"), flags, 2)
        this.vtbl.GetAllProperties := CallbackCreate(GetMethod(implObj, "GetAllProperties"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.get_Item)
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.get_ItemByName)
        CallbackFree(this.vtbl.CreateProperty)
        CallbackFree(this.vtbl.DeleteProperty)
        CallbackFree(this.vtbl.InitializeFromProperties)
        CallbackFree(this.vtbl.GetAllProperties)
    }
}
