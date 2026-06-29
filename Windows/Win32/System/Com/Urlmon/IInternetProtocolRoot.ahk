#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IInternetProtocolSink.ahk" { IInternetProtocolSink }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\PROTOCOLDATA.ahk" { PROTOCOLDATA }
#Import ".\IInternetBindInfo.ahk" { IInternetBindInfo }
#Import "..\IUnknown.ahk" { IUnknown }
#Import "..\..\..\Foundation\HANDLE_PTR.ahk" { HANDLE_PTR }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IInternetProtocolRoot extends IUnknown {
    /**
     * The interface identifier for IInternetProtocolRoot
     * @type {Guid}
     */
    static IID := Guid("{79eac9e3-baf9-11ce-8c82-00aa004ba90b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInternetProtocolRoot interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Start     : IntPtr
        Continue  : IntPtr
        Abort     : IntPtr
        Terminate : IntPtr
        Suspend   : IntPtr
        Resume    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInternetProtocolRoot.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} szUrl 
     * @param {IInternetProtocolSink} pOIProtSink 
     * @param {IInternetBindInfo} pOIBindInfo 
     * @param {Integer} grfPI 
     * @param {HANDLE_PTR} dwReserved 
     * @returns {HRESULT} 
     */
    Start(szUrl, pOIProtSink, pOIBindInfo, grfPI, dwReserved) {
        szUrl := szUrl is String ? StrPtr(szUrl) : szUrl

        result := ComCall(3, this, "ptr", szUrl, "ptr", pOIProtSink, "ptr", pOIBindInfo, "uint", grfPI, HANDLE_PTR, dwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROTOCOLDATA>} pProtocolData 
     * @returns {HRESULT} 
     */
    Continue(pProtocolData) {
        result := ComCall(4, this, PROTOCOLDATA.Ptr, pProtocolData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hrReason 
     * @param {Integer} dwOptions 
     * @returns {HRESULT} 
     */
    Abort(hrReason, dwOptions) {
        result := ComCall(5, this, "int", hrReason, "uint", dwOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOptions 
     * @returns {HRESULT} 
     */
    Terminate(dwOptions) {
        result := ComCall(6, this, "uint", dwOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Suspend() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * The Resume method resumes playback after a menu has been displayed.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/resume-method
     */
    Resume() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInternetProtocolRoot.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Start := CallbackCreate(GetMethod(implObj, "Start"), flags, 6)
        this.vtbl.Continue := CallbackCreate(GetMethod(implObj, "Continue"), flags, 2)
        this.vtbl.Abort := CallbackCreate(GetMethod(implObj, "Abort"), flags, 3)
        this.vtbl.Terminate := CallbackCreate(GetMethod(implObj, "Terminate"), flags, 2)
        this.vtbl.Suspend := CallbackCreate(GetMethod(implObj, "Suspend"), flags, 1)
        this.vtbl.Resume := CallbackCreate(GetMethod(implObj, "Resume"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Start)
        CallbackFree(this.vtbl.Continue)
        CallbackFree(this.vtbl.Abort)
        CallbackFree(this.vtbl.Terminate)
        CallbackFree(this.vtbl.Suspend)
        CallbackFree(this.vtbl.Resume)
    }
}
