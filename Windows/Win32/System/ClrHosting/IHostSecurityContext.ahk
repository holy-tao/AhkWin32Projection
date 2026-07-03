#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct IHostSecurityContext extends IUnknown {
    /**
     * The interface identifier for IHostSecurityContext
     * @type {Guid}
     */
    static IID := Guid("{7e573ce4-0343-4423-98d7-6318348a1d3c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHostSecurityContext interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Capture : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHostSecurityContext.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Capture method captures a still image from the video frame when the MSWebDVD object is in windowless mode.
     * @remarks
     * This method captures the current frame from the DVD-Video image and pastes it into a window from which the user can save or edit the image. The MSWebDVD object must be in windowless mode for this method to succeed.
     * @returns {IHostSecurityContext} 
     * @see https://learn.microsoft.com/windows/win32/DirectShow/capture-method
     */
    Capture() {
        result := ComCall(3, this, "ptr*", &ppClonedContext := 0, "HRESULT")
        return IHostSecurityContext(ppClonedContext)
    }

    Query(iid) {
        if (IHostSecurityContext.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Capture := CallbackCreate(GetMethod(implObj, "Capture"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Capture)
    }
}
