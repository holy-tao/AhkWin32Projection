#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Defines a low-level operation supported by an application.
 * @see https://learn.microsoft.com/windows/win32/api/azroles/nn-azroles-iazoperation
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct IAzOperation extends IDispatch {
    /**
     * The interface identifier for IAzOperation
     * @type {Guid}
     */
    static IID := Guid("{5e56b24f-ea01-4d61-be44-c49b5e4eaf74}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAzOperation interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Name            : IntPtr
        put_Name            : IntPtr
        get_Description     : IntPtr
        put_Description     : IntPtr
        get_ApplicationData : IntPtr
        put_ApplicationData : IntPtr
        get_OperationID     : IntPtr
        put_OperationID     : IntPtr
        get_Writable        : IntPtr
        GetProperty         : IntPtr
        SetProperty         : IntPtr
        Submit              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAzOperation.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * @type {BSTR} 
     */
    ApplicationData {
        get => this.get_ApplicationData()
        set => this.put_ApplicationData(value)
    }

    /**
     * @type {Integer} 
     */
    OperationID {
        get => this.get_OperationID()
        set => this.put_OperationID(value)
    }

    /**
     * @type {BOOL} 
     */
    Writable {
        get => this.get_Writable()
    }

    /**
     * Sets or retrieves the name of the operation. (Get)
     * @remarks
     * The maximum length of the <b>Name</b> property is 64 characters.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazoperation-get_name
     */
    get_Name() {
        pbstrName := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * Sets or retrieves the name of the operation. (Put)
     * @remarks
     * The maximum length of the <b>Name</b> property is 64 characters.
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazoperation-put_name
     */
    put_Name(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(8, this, BSTR, bstrName, "HRESULT")
        return result
    }

    /**
     * The Description property of IAzOperation sets or retrieves a comment that describes the operation. (Get)
     * @remarks
     * The maximum length of the <b>Description</b> property is 1,024 characters.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazoperation-get_description
     */
    get_Description() {
        pbstrDescription := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbstrDescription, "HRESULT")
        return pbstrDescription
    }

    /**
     * The Description property of IAzOperation sets or retrieves a comment that describes the operation. (Put)
     * @remarks
     * The maximum length of the <b>Description</b> property is 1,024 characters.
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazoperation-put_description
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(10, this, BSTR, bstrDescription, "HRESULT")
        return result
    }

    /**
     * The ApplicationData property of IAzOperation sets or retrieves an opaque field that can be used by the application to store information. (Get)
     * @remarks
     * <div class="alert"><b>Important</b>  Policy administrators can read from and write to this property. Applications should not store data in the <b>ApplicationData</b> property that should not be available to the policy administrator.</div>
     * <div> </div>
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazoperation-get_applicationdata
     */
    get_ApplicationData() {
        pbstrApplicationData := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, pbstrApplicationData, "HRESULT")
        return pbstrApplicationData
    }

    /**
     * The ApplicationData property of IAzOperation sets or retrieves an opaque field that can be used by the application to store information. (Put)
     * @remarks
     * <div class="alert"><b>Important</b>  Policy administrators can read from and write to this property. Applications should not store data in the <b>ApplicationData</b> property that should not be available to the policy administrator.</div>
     * <div> </div>
     * @param {BSTR} bstrApplicationData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazoperation-put_applicationdata
     */
    put_ApplicationData(bstrApplicationData) {
        bstrApplicationData := bstrApplicationData is String ? BSTR.Alloc(bstrApplicationData).Value : bstrApplicationData

        result := ComCall(12, this, BSTR, bstrApplicationData, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves an application-specific value that uniquely identifies the operation within the application. (Get)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazoperation-get_operationid
     */
    get_OperationID() {
        result := ComCall(13, this, "int*", &plProp := 0, "HRESULT")
        return plProp
    }

    /**
     * Sets or retrieves an application-specific value that uniquely identifies the operation within the application. (Put)
     * @param {Integer} lProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazoperation-put_operationid
     */
    put_OperationID(lProp) {
        result := ComCall(14, this, "int", lProp, "HRESULT")
        return result
    }

    /**
     * Retrieves a value that indicates whether the operation can be modified by the user context that initialized it.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazoperation-get_writable
     */
    get_Writable() {
        result := ComCall(15, this, BOOL.Ptr, &pfProp := 0, "HRESULT")
        return pfProp
    }

    /**
     * Returns the IAzOperation object property with the specified property ID.
     * @param {Integer} lPropId Property ID of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazoperation">IAzOperation</a> object property  to return. The following table shows the possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_APPLICATION_DATA"></a><a id="az_prop_application_data"></a><dl>
     * <dt><b>AZ_PROP_APPLICATION_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazoperation-get_applicationdata">ApplicationData</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_CHILD_CREATE"></a><a id="az_prop_child_create"></a><dl>
     * <dt><b>AZ_PROP_CHILD_CREATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Determines whether the current user has permission to create child objects. This value will always be <b>FALSE</b> because this object cannot have child objects.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_DESCRIPTION"></a><a id="az_prop_description"></a><dl>
     * <dt><b>AZ_PROP_DESCRIPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazoperation-get_description">Description</a>  property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_NAME"></a><a id="az_prop_name"></a><dl>
     * <dt><b>AZ_PROP_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the   <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazoperation-get_name">Name</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_OPERATION_ID"></a><a id="az_prop_operation_id"></a><dl>
     * <dt><b>AZ_PROP_OPERATION_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the  <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazoperation-get_operationid">OperationID</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_WRITABLE"></a><a id="az_prop_writable"></a><dl>
     * <dt><b>AZ_PROP_WRITABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the  <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazoperation-get_writable">Writable</a> property
     * 
     * </td>
     * </tr>
     * </table>
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {VARIANT} A pointer to the returned <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazoperation">IAzOperation</a> object property.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazoperation-getproperty
     */
    GetProperty(lPropId, varReserved) {
        pvarProp := VARIANT()
        result := ComCall(16, this, "int", lPropId, VARIANT, varReserved, VARIANT.Ptr, pvarProp, "HRESULT")
        return pvarProp
    }

    /**
     * Sets the specified value to the IAzOperation object property with the specified property ID.
     * @remarks
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazoperation-submit">Submit</a> method to persist any changes made by this method.
     * @param {Integer} lPropId Property ID of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazoperation">IAzOperation</a> object property  to set. The following table shows the possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_APPLICATION_DATA"></a><a id="az_prop_application_data"></a><dl>
     * <dt><b>AZ_PROP_APPLICATION_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazoperation-get_applicationdata">ApplicationData</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_DESCRIPTION"></a><a id="az_prop_description"></a><dl>
     * <dt><b>AZ_PROP_DESCRIPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazoperation-get_description">Description</a>  property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_NAME"></a><a id="az_prop_name"></a><dl>
     * <dt><b>AZ_PROP_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the   <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazoperation-get_name">Name</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_OPERATION_ID"></a><a id="az_prop_operation_id"></a><dl>
     * <dt><b>AZ_PROP_OPERATION_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the  <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazoperation-get_operationid">OperationID</a> property
     * 
     * </td>
     * </tr>
     * </table>
     * @param {VARIANT} varProp The value to set to the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazoperation">IAzOperation</a> object property  specified by the <i>lPropId</i> parameter. The following table shows the type of data that must be used depending on the value of the <i>lPropId</i> parameter.
     * 
     * <table>
     * <tr>
     * <th><i>lPropId</i> value</th>
     * <th>Data type (C++/Visual Basic)</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_APPLICATION_DATA"></a><a id="az_prop_application_data"></a><dl>
     * <dt><b>AZ_PROP_APPLICATION_DATA</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>BSTR</b>/<b>String</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_DESCRIPTION"></a><a id="az_prop_description"></a><dl>
     * <dt><b>AZ_PROP_DESCRIPTION</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>BSTR</b>/<b>String</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_OPERATION_ID"></a><a id="az_prop_operation_id"></a><dl>
     * <dt><b>AZ_PROP_OPERATION_ID</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>LONG</b>/<b>Long</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_NAME"></a><a id="az_prop_name"></a><dl>
     * <dt><b>AZ_PROP_NAME</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>BSTR</b>/<b>String</b>
     * 
     * </td>
     * </tr>
     * </table>
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success. Any other value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazoperation-setproperty
     */
    SetProperty(lPropId, varProp, varReserved) {
        result := ComCall(17, this, "int", lPropId, VARIANT, varProp, VARIANT, varReserved, "HRESULT")
        return result
    }

    /**
     * Persists changes made to the IAzOperation object.
     * @remarks
     * Any additions or modifications to an [IAzOperation](nn-azroles-iazoperation.md) object are not persisted until the **Submit** method is called.
     * @param {Integer} lFlags Flags that modify the behavior of the **Submit** method. The default value is zero. If the **AZ_SUBMIT_FLAG_ABORT** flag is specified, the changes to the object are discarded and the object is updated to match the underlying policy store.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, it will return `S_OK`. Any other **HRESULT** value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazoperation-submit
     */
    Submit(lFlags, varReserved) {
        result := ComCall(18, this, "int", lFlags, VARIANT, varReserved, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAzOperation.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.put_Name := CallbackCreate(GetMethod(implObj, "put_Name"), flags, 2)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.put_Description := CallbackCreate(GetMethod(implObj, "put_Description"), flags, 2)
        this.vtbl.get_ApplicationData := CallbackCreate(GetMethod(implObj, "get_ApplicationData"), flags, 2)
        this.vtbl.put_ApplicationData := CallbackCreate(GetMethod(implObj, "put_ApplicationData"), flags, 2)
        this.vtbl.get_OperationID := CallbackCreate(GetMethod(implObj, "get_OperationID"), flags, 2)
        this.vtbl.put_OperationID := CallbackCreate(GetMethod(implObj, "put_OperationID"), flags, 2)
        this.vtbl.get_Writable := CallbackCreate(GetMethod(implObj, "get_Writable"), flags, 2)
        this.vtbl.GetProperty := CallbackCreate(GetMethod(implObj, "GetProperty"), flags, 4)
        this.vtbl.SetProperty := CallbackCreate(GetMethod(implObj, "SetProperty"), flags, 4)
        this.vtbl.Submit := CallbackCreate(GetMethod(implObj, "Submit"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.put_Name)
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.put_Description)
        CallbackFree(this.vtbl.get_ApplicationData)
        CallbackFree(this.vtbl.put_ApplicationData)
        CallbackFree(this.vtbl.get_OperationID)
        CallbackFree(this.vtbl.put_OperationID)
        CallbackFree(this.vtbl.get_Writable)
        CallbackFree(this.vtbl.GetProperty)
        CallbackFree(this.vtbl.SetProperty)
        CallbackFree(this.vtbl.Submit)
    }
}
