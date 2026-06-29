#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables an input source on a Windows application's core input object.
 * @remarks
 * The <a href="https://docs.microsoft.com/uwp/api/windows.ui.core.coreindependentinputsource">CoreIndependentInputSource</a> or <a href="https://docs.microsoft.com/uwp/api/windows.ui.core.corecomponentinputsource">CoreComponentInputSource</a> object defines the basic keyboard and pointer input events  for a Windows Store app.
 * @see https://learn.microsoft.com/windows/win32/api/corewindow/nn-corewindow-icoreinputinterop
 * @namespace Windows.Win32.System.WinRT
 */
export default struct ICoreInputInterop extends IUnknown {
    /**
     * The interface identifier for ICoreInputInterop
     * @type {Guid}
     */
    static IID := Guid("{40bfe3e3-b75a-4479-ac96-475365749bb8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICoreInputInterop interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetInputSource     : IntPtr
        put_MessageHandled : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICoreInputInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    MessageHandled {
        set => this.put_MessageHandled(value)
    }

    /**
     * Sets the input source for an app's CoreIndependentInputSource or CoreComponentInputSource.
     * @param {IUnknown} value Pointer to the base COM interface of the input source.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/corewindow/nf-corewindow-icoreinputinterop-setinputsource
     */
    SetInputSource(value) {
        result := ComCall(3, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * Sets whether or not the message to the CoreWindow has been handled. (ICoreInputInterop.put_MessageHandled)
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/corewindow/nf-corewindow-icoreinputinterop-put_messagehandled
     */
    put_MessageHandled(value) {
        result := ComCall(4, this, "char", value, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICoreInputInterop.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetInputSource := CallbackCreate(GetMethod(implObj, "SetInputSource"), flags, 2)
        this.vtbl.put_MessageHandled := CallbackCreate(GetMethod(implObj, "put_MessageHandled"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetInputSource)
        CallbackFree(this.vtbl.put_MessageHandled)
    }
}
