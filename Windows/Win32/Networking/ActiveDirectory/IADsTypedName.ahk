#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IADsTypedName interface provides methods for an ADSI client to access the Typed Name attribute.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadstypedname
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsTypedName extends IDispatch {
    /**
     * The interface identifier for IADsTypedName
     * @type {Guid}
     */
    static IID := Guid("{b371a349-4080-11d1-a3ac-00c04fb950dc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsTypedName interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_ObjectName : IntPtr
        put_ObjectName : IntPtr
        get_Level      : IntPtr
        put_Level      : IntPtr
        get_Interval   : IntPtr
        put_Interval   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsTypedName.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    ObjectName {
        get => this.get_ObjectName()
        set => this.put_ObjectName(value)
    }

    /**
     * @type {Integer} 
     */
    Level {
        get => this.get_Level()
        set => this.put_Level(value)
    }

    /**
     * @type {Integer} 
     */
    Interval {
        get => this.get_Interval()
        set => this.put_Interval(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ObjectName() {
        retval := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrObjectName 
     * @returns {HRESULT} 
     */
    put_ObjectName(bstrObjectName) {
        bstrObjectName := bstrObjectName is String ? BSTR.Alloc(bstrObjectName).Value : bstrObjectName

        result := ComCall(8, this, BSTR, bstrObjectName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Level() {
        result := ComCall(9, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnLevel 
     * @returns {HRESULT} 
     */
    put_Level(lnLevel) {
        result := ComCall(10, this, "int", lnLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Interval() {
        result := ComCall(11, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnInterval 
     * @returns {HRESULT} 
     */
    put_Interval(lnInterval) {
        result := ComCall(12, this, "int", lnInterval, "HRESULT")
        return result
    }

    Query(iid) {
        if (IADsTypedName.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ObjectName := CallbackCreate(GetMethod(implObj, "get_ObjectName"), flags, 2)
        this.vtbl.put_ObjectName := CallbackCreate(GetMethod(implObj, "put_ObjectName"), flags, 2)
        this.vtbl.get_Level := CallbackCreate(GetMethod(implObj, "get_Level"), flags, 2)
        this.vtbl.put_Level := CallbackCreate(GetMethod(implObj, "put_Level"), flags, 2)
        this.vtbl.get_Interval := CallbackCreate(GetMethod(implObj, "get_Interval"), flags, 2)
        this.vtbl.put_Interval := CallbackCreate(GetMethod(implObj, "put_Interval"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ObjectName)
        CallbackFree(this.vtbl.put_ObjectName)
        CallbackFree(this.vtbl.get_Level)
        CallbackFree(this.vtbl.put_Level)
        CallbackFree(this.vtbl.get_Interval)
        CallbackFree(this.vtbl.put_Interval)
    }
}
