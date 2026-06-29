#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct ITmNodeName extends IUnknown {
    /**
     * The interface identifier for ITmNodeName
     * @type {Guid}
     */
    static IID := Guid("{30274f88-6ee4-474e-9b95-7807bc9ef8cf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITmNodeName interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetNodeNameSize : IntPtr
        GetNodeName     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITmNodeName.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNodeNameSize() {
        result := ComCall(3, this, "uint*", &pcbNodeNameSize := 0, "HRESULT")
        return pcbNodeNameSize
    }

    /**
     * 
     * @param {Integer} cbNodeNameBufferSize 
     * @param {PWSTR} pNodeNameBuffer 
     * @returns {HRESULT} 
     */
    GetNodeName(cbNodeNameBufferSize, pNodeNameBuffer) {
        pNodeNameBuffer := pNodeNameBuffer is String ? StrPtr(pNodeNameBuffer) : pNodeNameBuffer

        result := ComCall(4, this, "uint", cbNodeNameBufferSize, "ptr", pNodeNameBuffer, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITmNodeName.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetNodeNameSize := CallbackCreate(GetMethod(implObj, "GetNodeNameSize"), flags, 2)
        this.vtbl.GetNodeName := CallbackCreate(GetMethod(implObj, "GetNodeName"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetNodeNameSize)
        CallbackFree(this.vtbl.GetNodeName)
    }
}
