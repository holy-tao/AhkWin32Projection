#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides APIs for associating an HWND with an audio stream.
 * @remarks
 * Get an instance of the [IAudioViewManagerService](nn-audioclient-iaudioviewmanagerservice.md) by calling [GetService](nf-audioclient-iaudioclient-getservice) on an instance of [IAudioClient](nn-audioclient-iaudioclient.md).
 * @see https://learn.microsoft.com/windows/win32/api/audioclient/nn-audioclient-iaudioviewmanagerservice
 * @namespace Windows.Win32.Media.Audio
 */
export default struct IAudioViewManagerService extends IUnknown {
    /**
     * The interface identifier for IAudioViewManagerService
     * @type {Guid}
     */
    static IID := Guid("{a7a7ef10-1f49-45e0-ad35-612057cc8f74}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioViewManagerService interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetAudioStreamWindow : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioViewManagerService.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Associates the specified HWND window handle with an audio stream.
     * @remarks
     * An app can choose to associate audio streams with a particular window of their app for proper audio location representation in a Mixed Reality scenario
     * 
     * Get an instance of the [IAudioViewManagerService](nn-audioclient-iaudioviewmanagerservice.md) by calling [GetService](nf-audioclient-iaudioclient-getservice) on the [IAudioClient](nn-audioclient-iaudioclient.md) instance representing the stream you want to associate a window with. The following code example illustrates creating an audio stream on the default audio render endpoint and associating it with an **HWND**.
     * 
     * ```cpp
     * @param {HWND} _hwnd The [HWND](https://docs.microsoft.com/en-us/windows/win32/winprog/windows-data-types) with which the audio stream wll be associated.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioviewmanagerservice-setaudiostreamwindow
     */
    SetAudioStreamWindow(_hwnd) {
        result := ComCall(3, this, HWND, _hwnd, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAudioViewManagerService.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetAudioStreamWindow := CallbackCreate(GetMethod(implObj, "SetAudioStreamWindow"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetAudioStreamWindow)
    }
}
