#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IXAudio2Voice.ahk" { IXAudio2Voice }

/**
 * A submix voice is used primarily for performance improvements and effects processing.
 * @remarks
 * Data buffers cannot be submitted directly to submix voices and will not be audible unless submitted to a mastering voice. A submix voice can be used to ensure that a particular set of voice data is converted to the same format and/or to have a particular effect chain processed on the collective result. 
 * 
 * 
 * IXAudio2SubmixVoice inherits directly from <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2voice">IXAudio2Voice</a>, but does not implement methods specific to submix voices. The interface type exists solely because some of the base class methods are implemented differently for submix voices. Having a separate type for these voices helps client code to distinguish the different voice types and to benefit from C++ type safety.
 * 
 * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
 * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
 * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nn-xaudio2-ixaudio2submixvoice
 * @namespace Windows.Win32.Media.Audio.XAudio2
 */
export default struct IXAudio2SubmixVoice extends IXAudio2Voice {

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXAudio2SubmixVoice interfaces
    */
    struct Vtbl extends IXAudio2Voice.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXAudio2SubmixVoice.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IXAudio2SubmixVoice.IID.Equals(iid)) {
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
