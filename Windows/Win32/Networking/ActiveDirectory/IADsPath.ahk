#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IADsPath interface provides methods for an ADSI client to access the Path attribute.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadspath
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsPath extends IDispatch {
    /**
     * The interface identifier for IADsPath
     * @type {Guid}
     */
    static IID := Guid("{b287fcd5-4080-11d1-a3ac-00c04fb950dc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsPath interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Type       : IntPtr
        put_Type       : IntPtr
        get_VolumeName : IntPtr
        put_VolumeName : IntPtr
        get_Path       : IntPtr
        put_Path       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsPath.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
        set => this.put_Type(value)
    }

    /**
     * @type {BSTR} 
     */
    VolumeName {
        get => this.get_VolumeName()
        set => this.put_VolumeName(value)
    }

    /**
     * @type {BSTR} 
     */
    Path {
        get => this.get_Path()
        set => this.put_Path(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        result := ComCall(7, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnType 
     * @returns {HRESULT} 
     */
    put_Type(lnType) {
        result := ComCall(8, this, "int", lnType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_VolumeName() {
        retval := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrVolumeName 
     * @returns {HRESULT} 
     */
    put_VolumeName(bstrVolumeName) {
        bstrVolumeName := bstrVolumeName is String ? BSTR.Alloc(bstrVolumeName).Value : bstrVolumeName

        result := ComCall(10, this, BSTR, bstrVolumeName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Path() {
        retval := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrPath 
     * @returns {HRESULT} 
     */
    put_Path(bstrPath) {
        bstrPath := bstrPath is String ? BSTR.Alloc(bstrPath).Value : bstrPath

        result := ComCall(12, this, BSTR, bstrPath, "HRESULT")
        return result
    }

    Query(iid) {
        if (IADsPath.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Type := CallbackCreate(GetMethod(implObj, "get_Type"), flags, 2)
        this.vtbl.put_Type := CallbackCreate(GetMethod(implObj, "put_Type"), flags, 2)
        this.vtbl.get_VolumeName := CallbackCreate(GetMethod(implObj, "get_VolumeName"), flags, 2)
        this.vtbl.put_VolumeName := CallbackCreate(GetMethod(implObj, "put_VolumeName"), flags, 2)
        this.vtbl.get_Path := CallbackCreate(GetMethod(implObj, "get_Path"), flags, 2)
        this.vtbl.put_Path := CallbackCreate(GetMethod(implObj, "put_Path"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Type)
        CallbackFree(this.vtbl.put_Type)
        CallbackFree(this.vtbl.get_VolumeName)
        CallbackFree(this.vtbl.put_VolumeName)
        CallbackFree(this.vtbl.get_Path)
        CallbackFree(this.vtbl.put_Path)
    }
}
