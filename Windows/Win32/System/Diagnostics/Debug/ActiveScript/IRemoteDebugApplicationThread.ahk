#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IEnumDebugStackFrames.ahk" { IEnumDebugStackFrames }
#Import ".\IRemoteDebugApplication.ahk" { IRemoteDebugApplication }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IDebugStackFrame.ahk" { IDebugStackFrame }
#Import ".\IDebugCodeContext.ahk" { IDebugCodeContext }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IRemoteDebugApplicationThread extends IUnknown {
    /**
     * The interface identifier for IRemoteDebugApplicationThread
     * @type {Guid}
     */
    static IID := Guid("{51973c37-cb0c-11d0-b5c9-00a0244a0e7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRemoteDebugApplicationThread interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSystemThreadId : IntPtr
        GetApplication    : IntPtr
        EnumStackFrames   : IntPtr
        GetDescription    : IntPtr
        SetNextStatement  : IntPtr
        GetState          : IntPtr
        Suspend           : IntPtr
        Resume            : IntPtr
        GetSuspendCount   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRemoteDebugApplicationThread.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetSystemThreadId() {
        result := ComCall(3, this, "uint*", &dwThreadId := 0, "HRESULT")
        return dwThreadId
    }

    /**
     * 
     * @returns {IRemoteDebugApplication} 
     */
    GetApplication() {
        result := ComCall(4, this, "ptr*", &pprda := 0, "HRESULT")
        return IRemoteDebugApplication(pprda)
    }

    /**
     * 
     * @returns {IEnumDebugStackFrames} 
     */
    EnumStackFrames() {
        result := ComCall(5, this, "ptr*", &ppedsf := 0, "HRESULT")
        return IEnumDebugStackFrames(ppedsf)
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetDescription
     * @param {Pointer<BSTR>} pbstrDescription 
     * @param {Pointer<BSTR>} pbstrState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/iwmcodecstrings-getdescription
     */
    GetDescription(pbstrDescription, pbstrState) {
        result := ComCall(6, this, BSTR.Ptr, pbstrDescription, BSTR.Ptr, pbstrState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugStackFrame} pStackFrame 
     * @param {IDebugCodeContext} pCodeContext 
     * @returns {HRESULT} 
     */
    SetNextStatement(pStackFrame, pCodeContext) {
        result := ComCall(7, this, "ptr", pStackFrame, "ptr", pCodeContext, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetState() {
        result := ComCall(8, this, "uint*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * 
     * @returns {Integer} 
     */
    Suspend() {
        result := ComCall(9, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * The Resume method resumes playback after a menu has been displayed.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/DirectShow/resume-method
     */
    Resume() {
        result := ComCall(10, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * Retrieves the number of times BitLocker has been suspended.
     * @remarks
     * This method only applies to the OS volume, and only if it is actually suspended at the time. If the volume is not suspended or is not an OS volume, **ERROR\_NOT\_SUPPORTED** will be returned.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/SecProv/getsuspendcount-win32-encryptablevolume
     */
    GetSuspendCount() {
        result := ComCall(11, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    Query(iid) {
        if (IRemoteDebugApplicationThread.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSystemThreadId := CallbackCreate(GetMethod(implObj, "GetSystemThreadId"), flags, 2)
        this.vtbl.GetApplication := CallbackCreate(GetMethod(implObj, "GetApplication"), flags, 2)
        this.vtbl.EnumStackFrames := CallbackCreate(GetMethod(implObj, "EnumStackFrames"), flags, 2)
        this.vtbl.GetDescription := CallbackCreate(GetMethod(implObj, "GetDescription"), flags, 3)
        this.vtbl.SetNextStatement := CallbackCreate(GetMethod(implObj, "SetNextStatement"), flags, 3)
        this.vtbl.GetState := CallbackCreate(GetMethod(implObj, "GetState"), flags, 2)
        this.vtbl.Suspend := CallbackCreate(GetMethod(implObj, "Suspend"), flags, 2)
        this.vtbl.Resume := CallbackCreate(GetMethod(implObj, "Resume"), flags, 2)
        this.vtbl.GetSuspendCount := CallbackCreate(GetMethod(implObj, "GetSuspendCount"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSystemThreadId)
        CallbackFree(this.vtbl.GetApplication)
        CallbackFree(this.vtbl.EnumStackFrames)
        CallbackFree(this.vtbl.GetDescription)
        CallbackFree(this.vtbl.SetNextStatement)
        CallbackFree(this.vtbl.GetState)
        CallbackFree(this.vtbl.Suspend)
        CallbackFree(this.vtbl.Resume)
        CallbackFree(this.vtbl.GetSuspendCount)
    }
}
