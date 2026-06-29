#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IAudioMediaType.ahk" { IAudioMediaType }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAudioSystemEffectsCustomFormats interface is supported in Windows Vista and later versions of Windows.
 * @see https://learn.microsoft.com/windows/win32/api/audioenginebaseapo/nn-audioenginebaseapo-iaudiosystemeffectscustomformats
 * @namespace Windows.Win32.Media.Audio.Apo
 */
export default struct IAudioSystemEffectsCustomFormats extends IUnknown {
    /**
     * The interface identifier for IAudioSystemEffectsCustomFormats
     * @type {Guid}
     */
    static IID := Guid("{b1176e34-bb7f-4f05-bebd-1b18a534e097}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioSystemEffectsCustomFormats interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetFormatCount          : IntPtr
        GetFormat               : IntPtr
        GetFormatRepresentation : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioSystemEffectsCustomFormats.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetFormatCount method retrieves the number of custom formats supported by the system effects audio processing object (sAPO).
     * @remarks
     * For more information about sAPOs, see <a href="https://docs.microsoft.com/windows-hardware/drivers/audio/target-device-id">System Effects Audio Processing Objects</a>.
     * @returns {Integer} Specifies a pointer to an unsigned integer. The unsigned integer represents the number of formats supported by the sAPO.
     * @see https://learn.microsoft.com/windows/win32/api/audioenginebaseapo/nf-audioenginebaseapo-iaudiosystemeffectscustomformats-getformatcount
     */
    GetFormatCount() {
        result := ComCall(3, this, "uint*", &pcFormats := 0, "HRESULT")
        return pcFormats
    }

    /**
     * The GetFormat method retrieves an IAudioMediaType representation of a custom format.
     * @remarks
     * When the audio system calls the <c>GetFormat</c> method, the sAPO creates an audio media type object and returns an <b>IAudioMediaType</b> interface. The sAPO implementation can use the <a href="https://docs.microsoft.com/windows/desktop/api/audiomediatype/nf-audiomediatype-createaudiomediatype">CreateAudioMediaType</a> utility function to create the audio media type object.
     * @param {Integer} nFormat Specifies the index of a supported format. This parameter can be any value in the range from zero to one less than the return value of <a href="https://docs.microsoft.com/windows/desktop/api/audioenginebaseapo/nf-audioenginebaseapo-iaudiosystemeffectscustomformats-getformatcount">GetFormatCount</a>. In other words, any value in the range from zero to GetFormatCount( ) - 1.
     * @returns {IAudioMediaType} Specifies a pointer to a pointer to an <b>IAudioMediaType</b> interface. It is the responsibility of the caller to release the <b>IAudioMediaType</b> interface to which the <i>ppFormat</i> parameter points.
     * @see https://learn.microsoft.com/windows/win32/api/audioenginebaseapo/nf-audioenginebaseapo-iaudiosystemeffectscustomformats-getformat
     */
    GetFormat(nFormat) {
        result := ComCall(4, this, "uint", nFormat, "ptr*", &ppFormat := 0, "HRESULT")
        return IAudioMediaType(ppFormat)
    }

    /**
     * The GetFormatRepresentation method retrieves a string representation of the custom format so that it can be displayed on a user-interface.
     * @remarks
     * The sAPO uses <a href="https://docs.microsoft.com/previous-versions/windows/embedded/ms886939(v=msdn.10)">CoTaskMemAlloc</a> to allocate the returned string. The caller must use <a href="https://docs.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> to delete the buffer that is pointed to by the <i>ppwstrFormatRep</i> parameter.
     * @param {Integer} nFormat Specifies the index of a supported format. This parameter can be any value in the range from zero to one less than the return value of <a href="https://docs.microsoft.com/windows/desktop/api/audioenginebaseapo/nf-audioenginebaseapo-iaudiosystemeffectscustomformats-getformatcount">GetFormatCount</a>. In other words, any value in the range from zero to GetFormatCount( ) - 1.
     * @returns {PWSTR} Specifies the address of the buffer that receives a NULL-terminated Unicode string that describes the custom format.
     * @see https://learn.microsoft.com/windows/win32/api/audioenginebaseapo/nf-audioenginebaseapo-iaudiosystemeffectscustomformats-getformatrepresentation
     */
    GetFormatRepresentation(nFormat) {
        result := ComCall(5, this, "uint", nFormat, PWSTR.Ptr, &ppwstrFormatRep := 0, "HRESULT")
        return ppwstrFormatRep
    }

    Query(iid) {
        if (IAudioSystemEffectsCustomFormats.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFormatCount := CallbackCreate(GetMethod(implObj, "GetFormatCount"), flags, 2)
        this.vtbl.GetFormat := CallbackCreate(GetMethod(implObj, "GetFormat"), flags, 3)
        this.vtbl.GetFormatRepresentation := CallbackCreate(GetMethod(implObj, "GetFormatRepresentation"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFormatCount)
        CallbackFree(this.vtbl.GetFormat)
        CallbackFree(this.vtbl.GetFormatRepresentation)
    }
}
