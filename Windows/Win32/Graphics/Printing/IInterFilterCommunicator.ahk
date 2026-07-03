#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IInterFilterCommunicator extends IUnknown {
    /**
     * The interface identifier for IInterFilterCommunicator
     * @type {Guid}
     */
    static IID := Guid("{4daf1e69-81fd-462d-940f-8cd3ddf56fca}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInterFilterCommunicator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RequestReader : IntPtr
        RequestWriter : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInterFilterCommunicator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Pointer<Void>} 
     */
    RequestReader() {
        result := ComCall(3, this, "ptr*", &ppIReader := 0, "HRESULT")
        return ppIReader
    }

    /**
     * 
     * @returns {Pointer<Void>} 
     */
    RequestWriter() {
        result := ComCall(4, this, "ptr*", &ppIWriter := 0, "HRESULT")
        return ppIWriter
    }

    Query(iid) {
        if (IInterFilterCommunicator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RequestReader := CallbackCreate(GetMethod(implObj, "RequestReader"), flags, 2)
        this.vtbl.RequestWriter := CallbackCreate(GetMethod(implObj, "RequestWriter"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RequestReader)
        CallbackFree(this.vtbl.RequestWriter)
    }
}
