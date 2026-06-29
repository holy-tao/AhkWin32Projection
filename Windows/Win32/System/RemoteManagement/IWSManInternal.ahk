#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct IWSManInternal extends IDispatch {
    /**
     * The interface identifier for IWSManInternal
     * @type {Guid}
     */
    static IID := Guid("{04ae2b1d-9954-4d99-94a9-a961e72c3a13}")

    /**
     * The class identifier for WSManInternal
     * @type {Guid}
     */
    static CLSID := Guid("{7de087a5-5dcb-4df7-bb12-0924ad8fbd9a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWSManInternal interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        ConfigSDDL : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWSManInternal.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IDispatch} session 
     * @param {VARIANT} resourceUri 
     * @param {Integer} flags 
     * @returns {BSTR} 
     */
    ConfigSDDL(session, resourceUri, flags) {
        resource := BSTR.Owned()
        result := ComCall(7, this, "ptr", session, VARIANT, resourceUri, "int", flags, BSTR.Ptr, resource, "HRESULT")
        return resource
    }

    Query(iid) {
        if (IWSManInternal.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ConfigSDDL := CallbackCreate(GetMethod(implObj, "ConfigSDDL"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ConfigSDDL)
    }
}
