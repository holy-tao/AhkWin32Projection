#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IStreamSample.ahk" { IStreamSample }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAudioData.ahk" { IAudioData }

/**
 * Note  This interface is deprecated.
 * @see https://learn.microsoft.com/windows/win32/api/austream/nn-austream-iaudiostreamsample
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAudioStreamSample extends IStreamSample {
    /**
     * The interface identifier for IAudioStreamSample
     * @type {Guid}
     */
    static IID := Guid("{345fee00-aba5-11d0-8212-00c04fc32c45}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioStreamSample interfaces
    */
    struct Vtbl extends IStreamSample.Vtbl {
        GetAudioData : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioStreamSample.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. Retrieves the address of a pointer to the IAudioData object associated with the sample.
     * @returns {IAudioData} Address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/austream/nn-austream-iaudiodata">IAudioData</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/austream/nf-austream-iaudiostreamsample-getaudiodata
     */
    GetAudioData() {
        result := ComCall(8, this, "ptr*", &ppAudio := 0, "HRESULT")
        return IAudioData(ppAudio)
    }

    Query(iid) {
        if (IAudioStreamSample.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAudioData := CallbackCreate(GetMethod(implObj, "GetAudioData"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAudioData)
    }
}
