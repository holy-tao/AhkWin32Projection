#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITfThreadMgr.ahk" { ITfThreadMgr }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfTextInputProcessor interface is implemented by a text service and used by the TSF manager to activate and deactivate the text service.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itftextinputprocessor
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfTextInputProcessor extends IUnknown {
    /**
     * The interface identifier for ITfTextInputProcessor
     * @type {Guid}
     */
    static IID := Guid("{aa80e7f7-2021-11d2-93e0-0060b067b86e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfTextInputProcessor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Activate   : IntPtr
        Deactivate : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfTextInputProcessor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfTextInputProcessor::Activate method
     * @remarks
     * TSF calls this method after creating an instance of a text service with a call to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a>. This enables operations necessary to start the text service.
     * 
     * This method usually adds a reference to the thread manager for the session and advise sinks for events that involve the text service, such as change of focus, keystrokes, and window events. It also customizes the language bar for the text service.
     * 
     * The corresponding <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itftextinputprocessor-deactivate">ITfTextInputProcessor::Deactivate</a> method that shuts down the text service must release all references to the <i>ptim</i> parameter.
     * @param {ITfThreadMgr} ptim Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfthreadmgr">ITfThreadMgr</a> interface for the thread manager that owns the text service.
     * @param {Integer} tid Specifies the client identifier for the text service.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itftextinputprocessor-activate
     */
    Activate(ptim, tid) {
        result := ComCall(3, this, "ptr", ptim, "uint", tid, "HRESULT")
        return result
    }

    /**
     * ITfTextInputProcessor::Deactivate method
     * @remarks
     * TSF calls this method immediately before releasing its final reference to a text service. This provides the opportunity to perform operations necessary to shut down the text service.
     * 
     * This method usually unadvises sinks for events that involve the text service. It can also close any user interface elements of the text service.
     * 
     * Before this method returns, it must release all references to the <i>ptim</i> parameter passed to the text service by the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itftextinputprocessor-activate">ITfTextInputProcessor::Activate</a> method.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itftextinputprocessor-deactivate
     */
    Deactivate() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfTextInputProcessor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Activate := CallbackCreate(GetMethod(implObj, "Activate"), flags, 3)
        this.vtbl.Deactivate := CallbackCreate(GetMethod(implObj, "Deactivate"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Activate)
        CallbackFree(this.vtbl.Deactivate)
    }
}
