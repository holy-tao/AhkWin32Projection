#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPlayToControl.ahk" { IPlayToControl }
#Import ".\PLAYTO_SOURCE_CREATEFLAGS.ahk" { PLAYTO_SOURCE_CREATEFLAGS }

/**
 * Provides functionality for the IPlayToSource to determine the capabilities of the content.
 * @see https://learn.microsoft.com/windows/win32/api/mfsharingengine/nn-mfsharingengine-iplaytocontrolwithcapabilities
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IPlayToControlWithCapabilities extends IPlayToControl {
    /**
     * The interface identifier for IPlayToControlWithCapabilities
     * @type {Guid}
     */
    static IID := Guid("{aa9dd80f-c50a-4220-91c1-332287f82a34}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPlayToControlWithCapabilities interfaces
    */
    struct Vtbl extends IPlayToControl.Vtbl {
        GetCapabilities : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPlayToControlWithCapabilities.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the capabilities information for the content.
     * @returns {PLAYTO_SOURCE_CREATEFLAGS} The capabilities information for the content.
     * @see https://learn.microsoft.com/windows/win32/api/mfsharingengine/nf-mfsharingengine-iplaytocontrolwithcapabilities-getcapabilities
     */
    GetCapabilities() {
        result := ComCall(5, this, "int*", &pCapabilities := 0, "HRESULT")
        return pCapabilities
    }

    _Query(iid) {
        if (IPlayToControlWithCapabilities.IID.Equals(iid)) {
            return true
        }
        return super._Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCapabilities := CallbackCreate(GetMethod(implObj, "GetCapabilities"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCapabilities)
    }
}
