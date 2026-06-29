#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPerChannelDbLevel.ahk" { IPerChannelDbLevel }

/**
 * The IAudioVolumeLevel interface provides access to a hardware volume control.
 * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nn-devicetopology-iaudiovolumelevel
 * @namespace Windows.Win32.Media.Audio
 */
export default struct IAudioVolumeLevel extends IPerChannelDbLevel {
    /**
     * The interface identifier for IAudioVolumeLevel
     * @type {Guid}
     */
    static IID := Guid("{7fb7b48f-531d-44a2-bcb3-5ad5a134b3dc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioVolumeLevel interfaces
    */
    struct Vtbl extends IPerChannelDbLevel.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioVolumeLevel.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IAudioVolumeLevel.IID.Equals(iid)) {
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
