#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IADsService.ahk" { IADsService }

/**
 * The IADsFileService interface is a dual interface that inherits from IADsService.
 * @remarks
 * Under the WinNT provider, this interface is implemented on the <b>WinNTService</b> object.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadsfileservice
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsFileService extends IADsService {
    /**
     * The interface identifier for IADsFileService
     * @type {Guid}
     */
    static IID := Guid("{a89d1900-31ca-11cf-a98a-00aa006bc149}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsFileService interfaces
    */
    struct Vtbl extends IADsService.Vtbl {
        get_Description  : IntPtr
        put_Description  : IntPtr
        get_MaxUserCount : IntPtr
        put_MaxUserCount : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsFileService.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * @type {Integer} 
     */
    MaxUserCount {
        get => this.get_MaxUserCount()
        set => this.put_MaxUserCount(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Description() {
        retval := BSTR.Owned()
        result := ComCall(44, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(45, this, BSTR, bstrDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxUserCount() {
        result := ComCall(46, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnMaxUserCount 
     * @returns {HRESULT} 
     */
    put_MaxUserCount(lnMaxUserCount) {
        result := ComCall(47, this, "int", lnMaxUserCount, "HRESULT")
        return result
    }

    Query(iid) {
        if (IADsFileService.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.put_Description := CallbackCreate(GetMethod(implObj, "put_Description"), flags, 2)
        this.vtbl.get_MaxUserCount := CallbackCreate(GetMethod(implObj, "get_MaxUserCount"), flags, 2)
        this.vtbl.put_MaxUserCount := CallbackCreate(GetMethod(implObj, "put_MaxUserCount"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.put_Description)
        CallbackFree(this.vtbl.get_MaxUserCount)
        CallbackFree(this.vtbl.put_MaxUserCount)
    }
}
