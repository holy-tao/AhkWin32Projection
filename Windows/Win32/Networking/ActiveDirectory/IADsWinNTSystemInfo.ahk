#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IADsWinNTSystemInfo interface retrieves the WinNT system information about a computer. Such system information includes user account name, user domain, host name, and the primary domain controller of the host computer.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadswinntsysteminfo
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsWinNTSystemInfo extends IDispatch {
    /**
     * The interface identifier for IADsWinNTSystemInfo
     * @type {Guid}
     */
    static IID := Guid("{6c6d65dc-afd1-11d2-9cb9-0000f87a369e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsWinNTSystemInfo interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_UserName     : IntPtr
        get_ComputerName : IntPtr
        get_DomainName   : IntPtr
        get_PDC          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsWinNTSystemInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    UserName {
        get => this.get_UserName()
    }

    /**
     * @type {BSTR} 
     */
    ComputerName {
        get => this.get_ComputerName()
    }

    /**
     * @type {BSTR} 
     */
    DomainName {
        get => this.get_DomainName()
    }

    /**
     * @type {BSTR} 
     */
    PDC {
        get => this.get_PDC()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_UserName() {
        retval := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ComputerName() {
        retval := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DomainName() {
        retval := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PDC() {
        retval := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    Query(iid) {
        if (IADsWinNTSystemInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_UserName := CallbackCreate(GetMethod(implObj, "get_UserName"), flags, 2)
        this.vtbl.get_ComputerName := CallbackCreate(GetMethod(implObj, "get_ComputerName"), flags, 2)
        this.vtbl.get_DomainName := CallbackCreate(GetMethod(implObj, "get_DomainName"), flags, 2)
        this.vtbl.get_PDC := CallbackCreate(GetMethod(implObj, "get_PDC"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_UserName)
        CallbackFree(this.vtbl.get_ComputerName)
        CallbackFree(this.vtbl.get_DomainName)
        CallbackFree(this.vtbl.get_PDC)
    }
}
