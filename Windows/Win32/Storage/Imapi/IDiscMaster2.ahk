#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\System\Ole\IEnumVARIANT.ahk" { IEnumVARIANT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Use this interface to enumerate the CD and DVD devices installed on the computer.
 * @remarks
 * To create the <b>MsftDiscMaster2</b> object in a script, use IMAPI2.MsftDiscMaster2 as the program identifier when calling <b>CreateObject</b>.
 * 
 * To receive notification when a device is added or removed from the computer, implement the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-ddiscmaster2events">DDiscMaster2Events</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2/nn-imapi2-idiscmaster2
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct IDiscMaster2 extends IDispatch {
    /**
     * The interface identifier for IDiscMaster2
     * @type {Guid}
     */
    static IID := Guid("{27354130-7f64-5b0f-8f00-5d77afbe261e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDiscMaster2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get__NewEnum               : IntPtr
        get_Item                   : IntPtr
        get_Count                  : IntPtr
        get_IsSupportedEnvironment : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDiscMaster2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IEnumVARIANT} 
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
     * @type {VARIANT_BOOL} 
     */
    IsSupportedEnvironment {
        get => this.get_IsSupportedEnvironment()
    }

    /**
     * Retrieves a list of the CD and DVD devices installed on the computer.
     * @remarks
     * The enumeration is a snapshot of the devices on the computer at the time of the call and will not reflect devices that are added and removed. To receive notification when a device is added or removed from the computer, implement the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-ddiscmaster2events">DDiscMaster2Events</a> interface.
     * 
     * To retrieve a single identifier, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscmaster2-get_item">IDiscMaster2::get_Item</a> property.
     * 
     * The device identifier is guaranteed to be unique and static for a given device as recognized by Windows Plug and Play.  You can use the identifier as a key value for saving the user's default burner, and can also be used to cache other device-specific static information (for example, VendorID and ProductID) by an advanced application.
     * @returns {IEnumVARIANT} An <b>IEnumVariant</b> interface that you use to enumerate the CD and DVD devices installed on the computer. The items of the enumeration are variants whose type is <b>VT_BSTR</b>. Use the <b>bstrVal</b> member to retrieve the unique identifier of the device.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscmaster2-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &ppunk := 0, "HRESULT")
        return IEnumVARIANT(ppunk)
    }

    /**
     * Retrieves the unique identifier of the specified disc device.
     * @remarks
     * To enumerate all identifiers, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscmaster2-get__newenum">IDiscMaster2::get__NewEnum</a> method.
     * 
     * The following sample demonstrates how to re-enumerate optical drives in order to accurately account for drives added or removed  after the initial creation of the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscmaster2">IDiscMaster2</a> object. This is accomplished via the <b>IDiscMaster2::get_Item</b> and <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscmaster2-get_count">IDiscMaster2::get_Count</a> methods:
     * 
     * 
     * ```cpp
     * @param {Integer} index Zero-based index of the device whose unique identifier you want to retrieve.
     * 
     * The index value can change during PNP activity when devices are added or removed from the computer,  or across boot sessions.
     * @returns {BSTR} String that contains the unique identifier of the disc device associated with the specified index.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscmaster2-get_item
     */
    get_Item(index) {
        value := BSTR.Owned()
        result := ComCall(8, this, "int", index, BSTR.Ptr, value, "HRESULT")
        return value
    }

    /**
     * Retrieves the number of the CD and DVD disc devices installed on the computer.
     * @returns {Integer} Number of CD and DVD disc devices installed on the computer.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscmaster2-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves a value that determines if the environment contains one or more optical devices and the execution context has permission to access the devices.
     * @remarks
     * This method loops through all the strings in <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscmaster2-get_item">IDiscMaster2</a> and attempts to use each string to initialize a <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscrecorder2">DiscRecorder2</a> object.  If any of the recorders on the system succeed the initialization, this method returns <b>TRUE</b>.
     * 
     * The environment must contain at least one type-5 optical device.
     * @returns {VARIANT_BOOL} Is VARIANT_TRUE if the environment contains one or more optical devices and the execution context has permission to access the devices; otherwise, VARIANT_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscmaster2-get_issupportedenvironment
     */
    get_IsSupportedEnvironment() {
        result := ComCall(10, this, VARIANT_BOOL.Ptr, &value := 0, "HRESULT")
        return value
    }

    Query(iid) {
        if (IDiscMaster2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.get_Item := CallbackCreate(GetMethod(implObj, "get_Item"), flags, 3)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.get_IsSupportedEnvironment := CallbackCreate(GetMethod(implObj, "get_IsSupportedEnvironment"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.get_Item)
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.get_IsSupportedEnvironment)
    }
}
