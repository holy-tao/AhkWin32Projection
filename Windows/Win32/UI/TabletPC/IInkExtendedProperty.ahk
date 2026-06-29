#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Represents the ability to add your own data to a variety of objects within the Tablet PC object model.
 * @remarks
 * Extended properties are application-defined data that can be of whatever form the application requires. The name of the extended property is expressed as a globally unique identifier (GUID).
 * 
 * If you define a class that implements this interface, the new class will not interact correctly with the Tablet PC application programming interfaces (APIs).
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nn-msinkaut-iinkextendedproperty
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct IInkExtendedProperty extends IDispatch {
    /**
     * The interface identifier for IInkExtendedProperty
     * @type {Guid}
     */
    static IID := Guid("{db489209-b7c3-411d-90f6-1548cfff271e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInkExtendedProperty interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Guid : IntPtr
        get_Data : IntPtr
        put_Data : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInkExtendedProperty.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Guid {
        get => this.get_Guid()
    }

    /**
     * @type {VARIANT} 
     */
    Data {
        get => this.get_Data()
        set => this.put_Data(value)
    }

    /**
     * Gets the globally unique identifier (GUID) of the IInkExtendedProperty object.
     * @remarks
     * <div class="alert"><b>Note</b>  When using managed code, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevice-id-vb">Id</a> property; when using Automation, use the <b>Guid</b> property.</div>
     * <div> </div>
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkextendedproperty-get_guid
     */
    get_Guid() {
        Guid := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, Guid, "HRESULT")
        return Guid
    }

    /**
     * Gets or sets the data of the extended property. (Get)
     * @remarks
     * The data consists of information that cannot otherwise be set on the object, such as the time or date that a stroke was made.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkextendedproperty-get_data
     */
    get_Data() {
        Data := VARIANT()
        result := ComCall(8, this, VARIANT.Ptr, Data, "HRESULT")
        return Data
    }

    /**
     * Gets or sets the data of the extended property. (Put)
     * @remarks
     * The data consists of information that cannot otherwise be set on the object, such as the time or date that a stroke was made.
     * @param {VARIANT} Data 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkextendedproperty-put_data
     */
    put_Data(Data) {
        result := ComCall(9, this, VARIANT, Data, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInkExtendedProperty.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Guid := CallbackCreate(GetMethod(implObj, "get_Guid"), flags, 2)
        this.vtbl.get_Data := CallbackCreate(GetMethod(implObj, "get_Data"), flags, 2)
        this.vtbl.put_Data := CallbackCreate(GetMethod(implObj, "put_Data"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Guid)
        CallbackFree(this.vtbl.get_Data)
        CallbackFree(this.vtbl.put_Data)
    }
}
