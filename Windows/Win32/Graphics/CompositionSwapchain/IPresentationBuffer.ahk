#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Describes a presentation buffer that has been registered with a presentation manager.
 * @see https://learn.microsoft.com/windows/win32/api/presentation/nn-presentation-ipresentationbuffer
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 */
export default struct IPresentationBuffer extends IUnknown {
    /**
     * The interface identifier for IPresentationBuffer
     * @type {Guid}
     */
    static IID := Guid("{2e217d3a-5abb-4138-9a13-a775593c89ca}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPresentationBuffer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetAvailableEvent : IntPtr
        IsAvailable       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPresentationBuffer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a handle to an event that signals when the buffer is available.
     * @remarks
     * The caller is responsible for closing the returned event.
     * 
     * An application can wait on and query this event, but it cannot modify its state. The presentation manager controls this event.
     * @returns {HANDLE} Type: **[HANDLE](/windows/win32/winprog/windows-data-types)**
     * 
     * A handle to the event.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationbuffer-getavailableevent
     */
    GetAvailableEvent() {
        availableEventHandle := HANDLE.Owned()
        result := ComCall(3, this, HANDLE.Ptr, availableEventHandle, "HRESULT")
        return availableEventHandle
    }

    /**
     * Gets a value that indicates whether or not this buffer is available for use by the producer.
     * @returns {Integer} Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * `TRUE` if the buffer is available; otherwise, `FALSE`.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationbuffer-isavailable
     */
    IsAvailable() {
        result := ComCall(4, this, "char*", &isAvailable := 0, "HRESULT")
        return isAvailable
    }

    Query(iid) {
        if (IPresentationBuffer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAvailableEvent := CallbackCreate(GetMethod(implObj, "GetAvailableEvent"), flags, 2)
        this.vtbl.IsAvailable := CallbackCreate(GetMethod(implObj, "IsAvailable"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAvailableEvent)
        CallbackFree(this.vtbl.IsAvailable)
    }
}
