#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The ITPluggableTerminalSuperclassInfo interface exposes methods that get the name and CLSID of a pluggable terminal class.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itpluggableterminalsuperclassinfo
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITPluggableTerminalSuperclassInfo extends IDispatch {
    /**
     * The interface identifier for ITPluggableTerminalSuperclassInfo
     * @type {Guid}
     */
    static IID := Guid("{6d54e42c-4625-4359-a6f7-631999107e05}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITPluggableTerminalSuperclassInfo interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Name  : IntPtr
        get_CLSID : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITPluggableTerminalSuperclassInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {BSTR} 
     */
    CLSID {
        get => this.get_CLSID()
    }

    /**
     * The get_Name method gets the terminal's friendly name. (ITPluggableTerminalSuperclassInfo.get_Name)
     * @returns {BSTR} The <b>BSTR</b> representation of the friendly name. The <b>BSTR</b> is allocated using 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a>. The <b>BSTR</b> argument should be deallocated by the client.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itpluggableterminalsuperclassinfo-get_name
     */
    get_Name() {
        pName := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pName, "HRESULT")
        return pName
    }

    /**
     * The get_CLSID method gets the CLSID used to CoCreateInstance the terminal. (ITPluggableTerminalSuperclassInfo.get_CLSID)
     * @returns {BSTR} The <b>BSTR</b> representation of the CLSID. The <b>BSTR</b> is allocated using 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a>. The <b>BSTR</b> argument should be deallocated by the client.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itpluggableterminalsuperclassinfo-get_clsid
     */
    get_CLSID() {
        pCLSID := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pCLSID, "HRESULT")
        return pCLSID
    }

    Query(iid) {
        if (ITPluggableTerminalSuperclassInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_CLSID := CallbackCreate(GetMethod(implObj, "get_CLSID"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_CLSID)
    }
}
