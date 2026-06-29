#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\WindowsAndMessaging\MSG.ahk" { MSG }

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct IActiveIMMMessagePumpOwner extends IUnknown {
    /**
     * The interface identifier for IActiveIMMMessagePumpOwner
     * @type {Guid}
     */
    static IID := Guid("{b5cf2cfa-8aeb-11d1-9364-0060b067b86e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActiveIMMMessagePumpOwner interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Start              : IntPtr
        End                : IntPtr
        OnTranslateMessage : IntPtr
        Pause              : IntPtr
        Resume             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActiveIMMMessagePumpOwner.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Start() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    End() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MSG>} pMsg 
     * @returns {HRESULT} 
     */
    OnTranslateMessage(pMsg) {
        result := ComCall(5, this, MSG.Ptr, pMsg, "HRESULT")
        return result
    }

    /**
     * The Pause method pauses playback at the current location.
     * @remarks
     * If playback is already paused, this method does nothing.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/DirectShow/pause-method
     */
    Pause() {
        result := ComCall(6, this, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * The Resume method resumes playback after a menu has been displayed.
     * @param {Integer} dwCookie 
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/resume-method
     */
    Resume(dwCookie) {
        result := ComCall(7, this, "uint", dwCookie, "HRESULT")
        return result
    }

    Query(iid) {
        if (IActiveIMMMessagePumpOwner.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Start := CallbackCreate(GetMethod(implObj, "Start"), flags, 1)
        this.vtbl.End := CallbackCreate(GetMethod(implObj, "End"), flags, 1)
        this.vtbl.OnTranslateMessage := CallbackCreate(GetMethod(implObj, "OnTranslateMessage"), flags, 2)
        this.vtbl.Pause := CallbackCreate(GetMethod(implObj, "Pause"), flags, 2)
        this.vtbl.Resume := CallbackCreate(GetMethod(implObj, "Resume"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Start)
        CallbackFree(this.vtbl.End)
        CallbackFree(this.vtbl.OnTranslateMessage)
        CallbackFree(this.vtbl.Pause)
        CallbackFree(this.vtbl.Resume)
    }
}
