#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct IGCThreadControl extends IUnknown {
    /**
     * The interface identifier for IGCThreadControl
     * @type {Guid}
     */
    static IID := Guid("{f31d1788-c397-4725-87a5-6af3472c2791}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGCThreadControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ThreadIsBlockingForSuspension : IntPtr
        SuspensionStarting            : IntPtr
        SuspensionEnding              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGCThreadControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ThreadIsBlockingForSuspension() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SuspensionStarting() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Generation 
     * @returns {HRESULT} 
     */
    SuspensionEnding(Generation) {
        result := ComCall(5, this, "uint", Generation, "HRESULT")
        return result
    }

    Query(iid) {
        if (IGCThreadControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ThreadIsBlockingForSuspension := CallbackCreate(GetMethod(implObj, "ThreadIsBlockingForSuspension"), flags, 1)
        this.vtbl.SuspensionStarting := CallbackCreate(GetMethod(implObj, "SuspensionStarting"), flags, 1)
        this.vtbl.SuspensionEnding := CallbackCreate(GetMethod(implObj, "SuspensionEnding"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ThreadIsBlockingForSuspension)
        CallbackFree(this.vtbl.SuspensionStarting)
        CallbackFree(this.vtbl.SuspensionEnding)
    }
}
