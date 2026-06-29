#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IJsDebugStackWalker.ahk" { IJsDebugStackWalker }
#Import "..\..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IJsDebugBreakPoint.ahk" { IJsDebugBreakPoint }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IJsDebugProcess extends IUnknown {
    /**
     * The interface identifier for IJsDebugProcess
     * @type {Guid}
     */
    static IID := Guid("{3d587168-6a2d-4041-bd3b-0de674502862}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IJsDebugProcess interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateStackWalker      : IntPtr
        CreateBreakPoint       : IntPtr
        PerformAsyncBreak      : IntPtr
        GetExternalStepAddress : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IJsDebugProcess.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} threadId 
     * @returns {IJsDebugStackWalker} 
     */
    CreateStackWalker(threadId) {
        result := ComCall(3, this, "uint", threadId, "ptr*", &ppStackWalker := 0, "HRESULT")
        return IJsDebugStackWalker(ppStackWalker)
    }

    /**
     * 
     * @param {Integer} documentId 
     * @param {Integer} characterOffset 
     * @param {Integer} characterCount 
     * @param {BOOL} isEnabled 
     * @returns {IJsDebugBreakPoint} 
     */
    CreateBreakPoint(documentId, characterOffset, characterCount, isEnabled) {
        result := ComCall(4, this, "uint", documentId, "uint", characterOffset, "uint", characterCount, BOOL, isEnabled, "ptr*", &ppDebugBreakPoint := 0, "HRESULT")
        return IJsDebugBreakPoint(ppDebugBreakPoint)
    }

    /**
     * 
     * @param {Integer} threadId 
     * @returns {HRESULT} 
     */
    PerformAsyncBreak(threadId) {
        result := ComCall(5, this, "uint", threadId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetExternalStepAddress() {
        result := ComCall(6, this, "uint*", &pCodeAddress := 0, "HRESULT")
        return pCodeAddress
    }

    Query(iid) {
        if (IJsDebugProcess.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateStackWalker := CallbackCreate(GetMethod(implObj, "CreateStackWalker"), flags, 3)
        this.vtbl.CreateBreakPoint := CallbackCreate(GetMethod(implObj, "CreateBreakPoint"), flags, 6)
        this.vtbl.PerformAsyncBreak := CallbackCreate(GetMethod(implObj, "PerformAsyncBreak"), flags, 2)
        this.vtbl.GetExternalStepAddress := CallbackCreate(GetMethod(implObj, "GetExternalStepAddress"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateStackWalker)
        CallbackFree(this.vtbl.CreateBreakPoint)
        CallbackFree(this.vtbl.PerformAsyncBreak)
        CallbackFree(this.vtbl.GetExternalStepAddress)
    }
}
