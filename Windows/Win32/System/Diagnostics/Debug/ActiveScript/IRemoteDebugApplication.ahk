#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IApplicationDebugger.ahk" { IApplicationDebugger }
#Import ".\IEnumRemoteDebugApplicationThreads.ahk" { IEnumRemoteDebugApplicationThreads }
#Import ".\BREAKRESUMEACTION.ahk" { BREAKRESUMEACTION }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IRemoteDebugApplicationThread.ahk" { IRemoteDebugApplicationThread }
#Import ".\IEnumDebugExpressionContexts.ahk" { IEnumDebugExpressionContexts }
#Import ".\ERRORRESUMEACTION.ahk" { ERRORRESUMEACTION }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDebugApplicationNode.ahk" { IDebugApplicationNode }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IRemoteDebugApplication extends IUnknown {
    /**
     * The interface identifier for IRemoteDebugApplication
     * @type {Guid}
     */
    static IID := Guid("{51973c30-cb0c-11d0-b5c9-00a0244a0e7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRemoteDebugApplication interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ResumeFromBreakPoint         : IntPtr
        CauseBreak                   : IntPtr
        ConnectDebugger              : IntPtr
        DisconnectDebugger           : IntPtr
        GetDebugger                  : IntPtr
        CreateInstanceAtApplication  : IntPtr
        QueryAlive                   : IntPtr
        EnumThreads                  : IntPtr
        GetName                      : IntPtr
        GetRootNode                  : IntPtr
        EnumGlobalExpressionContexts : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRemoteDebugApplication.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IRemoteDebugApplicationThread} prptFocus 
     * @param {BREAKRESUMEACTION} bra 
     * @param {ERRORRESUMEACTION} era 
     * @returns {HRESULT} 
     */
    ResumeFromBreakPoint(prptFocus, bra, era) {
        result := ComCall(3, this, "ptr", prptFocus, BREAKRESUMEACTION, bra, ERRORRESUMEACTION, era, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CauseBreak() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IApplicationDebugger} pad 
     * @returns {HRESULT} 
     */
    ConnectDebugger(pad) {
        result := ComCall(5, this, "ptr", pad, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DisconnectDebugger() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IApplicationDebugger} 
     */
    GetDebugger() {
        result := ComCall(7, this, "ptr*", &pad := 0, "HRESULT")
        return IApplicationDebugger(pad)
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {IUnknown} pUnkOuter 
     * @param {Integer} dwClsContext 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     */
    CreateInstanceAtApplication(rclsid, pUnkOuter, dwClsContext, riid) {
        result := ComCall(8, this, Guid.Ptr, rclsid, "ptr", pUnkOuter, "uint", dwClsContext, Guid.Ptr, riid, "ptr*", &ppvObject := 0, "HRESULT")
        return IUnknown(ppvObject)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    QueryAlive() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumRemoteDebugApplicationThreads} 
     */
    EnumThreads() {
        result := ComCall(10, this, "ptr*", &pperdat := 0, "HRESULT")
        return IEnumRemoteDebugApplicationThreads(pperdat)
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetName
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/iwmcodecstrings-getname
     */
    GetName() {
        pbstrName := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @returns {IDebugApplicationNode} 
     */
    GetRootNode() {
        result := ComCall(12, this, "ptr*", &ppdanRoot := 0, "HRESULT")
        return IDebugApplicationNode(ppdanRoot)
    }

    /**
     * 
     * @returns {IEnumDebugExpressionContexts} 
     */
    EnumGlobalExpressionContexts() {
        result := ComCall(13, this, "ptr*", &ppedec := 0, "HRESULT")
        return IEnumDebugExpressionContexts(ppedec)
    }

    Query(iid) {
        if (IRemoteDebugApplication.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ResumeFromBreakPoint := CallbackCreate(GetMethod(implObj, "ResumeFromBreakPoint"), flags, 4)
        this.vtbl.CauseBreak := CallbackCreate(GetMethod(implObj, "CauseBreak"), flags, 1)
        this.vtbl.ConnectDebugger := CallbackCreate(GetMethod(implObj, "ConnectDebugger"), flags, 2)
        this.vtbl.DisconnectDebugger := CallbackCreate(GetMethod(implObj, "DisconnectDebugger"), flags, 1)
        this.vtbl.GetDebugger := CallbackCreate(GetMethod(implObj, "GetDebugger"), flags, 2)
        this.vtbl.CreateInstanceAtApplication := CallbackCreate(GetMethod(implObj, "CreateInstanceAtApplication"), flags, 6)
        this.vtbl.QueryAlive := CallbackCreate(GetMethod(implObj, "QueryAlive"), flags, 1)
        this.vtbl.EnumThreads := CallbackCreate(GetMethod(implObj, "EnumThreads"), flags, 2)
        this.vtbl.GetName := CallbackCreate(GetMethod(implObj, "GetName"), flags, 2)
        this.vtbl.GetRootNode := CallbackCreate(GetMethod(implObj, "GetRootNode"), flags, 2)
        this.vtbl.EnumGlobalExpressionContexts := CallbackCreate(GetMethod(implObj, "EnumGlobalExpressionContexts"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ResumeFromBreakPoint)
        CallbackFree(this.vtbl.CauseBreak)
        CallbackFree(this.vtbl.ConnectDebugger)
        CallbackFree(this.vtbl.DisconnectDebugger)
        CallbackFree(this.vtbl.GetDebugger)
        CallbackFree(this.vtbl.CreateInstanceAtApplication)
        CallbackFree(this.vtbl.QueryAlive)
        CallbackFree(this.vtbl.EnumThreads)
        CallbackFree(this.vtbl.GetName)
        CallbackFree(this.vtbl.GetRootNode)
        CallbackFree(this.vtbl.EnumGlobalExpressionContexts)
    }
}
