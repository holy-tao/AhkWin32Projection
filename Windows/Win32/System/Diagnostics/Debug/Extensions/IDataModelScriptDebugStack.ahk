#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDataModelScriptDebugStackFrame.ahk" { IDataModelScriptDebugStackFrame }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDataModelScriptDebugStack extends IUnknown {
    /**
     * The interface identifier for IDataModelScriptDebugStack
     * @type {Guid}
     */
    static IID := Guid("{051364dd-e449-443e-9762-fe578f4a5473}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDataModelScriptDebugStack interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetFrameCount : IntPtr
        GetStackFrame : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDataModelScriptDebugStack.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetFrameCount() {
        result := ComCall(3, this, Int64)
        return result
    }

    /**
     * 
     * @param {Integer} frameNumber 
     * @returns {IDataModelScriptDebugStackFrame} 
     */
    GetStackFrame(frameNumber) {
        result := ComCall(4, this, "uint", frameNumber, "ptr*", &_stackFrame := 0, "HRESULT")
        return IDataModelScriptDebugStackFrame(_stackFrame)
    }

    Query(iid) {
        if (IDataModelScriptDebugStack.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFrameCount := CallbackCreate(GetMethod(implObj, "GetFrameCount"), flags, 1)
        this.vtbl.GetStackFrame := CallbackCreate(GetMethod(implObj, "GetStackFrame"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFrameCount)
        CallbackFree(this.vtbl.GetStackFrame)
    }
}
