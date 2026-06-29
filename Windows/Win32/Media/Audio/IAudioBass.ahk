#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPerChannelDbLevel.ahk" { IPerChannelDbLevel }

/**
 * The IAudioBass interface provides access to a hardware bass-level control.
 * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nn-devicetopology-iaudiobass
 * @namespace Windows.Win32.Media.Audio
 */
export default struct IAudioBass extends IPerChannelDbLevel {
    /**
     * The interface identifier for IAudioBass
     * @type {Guid}
     */
    static IID := Guid("{a2b1a1d9-4db3-425d-a2b2-bd335cb3e2e5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioBass interfaces
    */
    struct Vtbl extends IPerChannelDbLevel.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioBass.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IAudioBass.IID.Equals(iid)) {
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
