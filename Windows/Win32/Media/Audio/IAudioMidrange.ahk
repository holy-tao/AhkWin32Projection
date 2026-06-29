#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPerChannelDbLevel.ahk" { IPerChannelDbLevel }

/**
 * The IAudioMidrange interface provides access to a hardware midrange-level control.
 * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nn-devicetopology-iaudiomidrange
 * @namespace Windows.Win32.Media.Audio
 */
export default struct IAudioMidrange extends IPerChannelDbLevel {
    /**
     * The interface identifier for IAudioMidrange
     * @type {Guid}
     */
    static IID := Guid("{5e54b6d7-b44b-40d9-9a9e-e691d9ce6edf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioMidrange interfaces
    */
    struct Vtbl extends IPerChannelDbLevel.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioMidrange.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IAudioMidrange.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
    }
}
