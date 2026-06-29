#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct IMSMQApplication extends IDispatch {
    /**
     * The interface identifier for IMSMQApplication
     * @type {Guid}
     */
    static IID := Guid("{d7d6e085-dccd-11d0-aa4b-0060970debae}")

    /**
     * The class identifier for MSMQApplication
     * @type {Guid}
     */
    static CLSID := Guid("{d7d6e086-dccd-11d0-aa4b-0060970debae}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSMQApplication interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        MachineIdOfMachineName : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSMQApplication.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} MachineName 
     * @returns {BSTR} 
     */
    MachineIdOfMachineName(MachineName) {
        MachineName := MachineName is String ? BSTR.Alloc(MachineName).Value : MachineName

        pbstrGuid := BSTR.Owned()
        result := ComCall(7, this, BSTR, MachineName, BSTR.Ptr, pbstrGuid, "HRESULT")
        return pbstrGuid
    }

    Query(iid) {
        if (IMSMQApplication.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.MachineIdOfMachineName := CallbackCreate(GetMethod(implObj, "MachineIdOfMachineName"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.MachineIdOfMachineName)
    }
}
