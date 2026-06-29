#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IADs.ahk" { IADs }

/**
 * The IADsFileShare interface is a dual interface that inherits from IADs. It is designed for representing a published file share across the network. Call the methods on IADsFileShare to access or publish data about a file share point.
 * @remarks
 * <b>IADsFileShare</b> is supported by WinNT system provider only. Using the WinNT provider, you can also bind to a FPNW share by substituting "FPNW" for "LanmanServer" in the code examples below.
 * 
 * To bind to a file share, using the WinNT system provider, you can explicitly bind to the file service "LanmanServer" on the host machine, and then enumerate the container to reach the file share of interest, or bind directly to the file share.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadsfileshare
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsFileShare extends IADs {
    /**
     * The interface identifier for IADsFileShare
     * @type {Guid}
     */
    static IID := Guid("{eb6dcaf0-4b83-11cf-a995-00aa006bc149}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsFileShare interfaces
    */
    struct Vtbl extends IADs.Vtbl {
        get_CurrentUserCount : IntPtr
        get_Description      : IntPtr
        put_Description      : IntPtr
        get_HostComputer     : IntPtr
        put_HostComputer     : IntPtr
        get_Path             : IntPtr
        put_Path             : IntPtr
        get_MaxUserCount     : IntPtr
        put_MaxUserCount     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsFileShare.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    CurrentUserCount {
        get => this.get_CurrentUserCount()
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
    HostComputer {
        get => this.get_HostComputer()
        set => this.put_HostComputer(value)
    }

    /**
     * @type {BSTR} 
     */
    Path {
        get => this.get_Path()
        set => this.put_Path(value)
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
     * @returns {Integer} 
     */
    get_CurrentUserCount() {
        result := ComCall(20, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Description() {
        retval := BSTR.Owned()
        result := ComCall(21, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(22, this, BSTR, bstrDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_HostComputer() {
        retval := BSTR.Owned()
        result := ComCall(23, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrHostComputer 
     * @returns {HRESULT} 
     */
    put_HostComputer(bstrHostComputer) {
        bstrHostComputer := bstrHostComputer is String ? BSTR.Alloc(bstrHostComputer).Value : bstrHostComputer

        result := ComCall(24, this, BSTR, bstrHostComputer, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Path() {
        retval := BSTR.Owned()
        result := ComCall(25, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrPath 
     * @returns {HRESULT} 
     */
    put_Path(bstrPath) {
        bstrPath := bstrPath is String ? BSTR.Alloc(bstrPath).Value : bstrPath

        result := ComCall(26, this, BSTR, bstrPath, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxUserCount() {
        result := ComCall(27, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnMaxUserCount 
     * @returns {HRESULT} 
     */
    put_MaxUserCount(lnMaxUserCount) {
        result := ComCall(28, this, "int", lnMaxUserCount, "HRESULT")
        return result
    }

    Query(iid) {
        if (IADsFileShare.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_CurrentUserCount := CallbackCreate(GetMethod(implObj, "get_CurrentUserCount"), flags, 2)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.put_Description := CallbackCreate(GetMethod(implObj, "put_Description"), flags, 2)
        this.vtbl.get_HostComputer := CallbackCreate(GetMethod(implObj, "get_HostComputer"), flags, 2)
        this.vtbl.put_HostComputer := CallbackCreate(GetMethod(implObj, "put_HostComputer"), flags, 2)
        this.vtbl.get_Path := CallbackCreate(GetMethod(implObj, "get_Path"), flags, 2)
        this.vtbl.put_Path := CallbackCreate(GetMethod(implObj, "put_Path"), flags, 2)
        this.vtbl.get_MaxUserCount := CallbackCreate(GetMethod(implObj, "get_MaxUserCount"), flags, 2)
        this.vtbl.put_MaxUserCount := CallbackCreate(GetMethod(implObj, "put_MaxUserCount"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_CurrentUserCount)
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.put_Description)
        CallbackFree(this.vtbl.get_HostComputer)
        CallbackFree(this.vtbl.put_HostComputer)
        CallbackFree(this.vtbl.get_Path)
        CallbackFree(this.vtbl.put_Path)
        CallbackFree(this.vtbl.get_MaxUserCount)
        CallbackFree(this.vtbl.put_MaxUserCount)
    }
}
