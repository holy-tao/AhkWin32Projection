#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Media\MediaFoundation\IMFSample.ahk" { IMFSample }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IInspectable.ahk" { IInspectable }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Creates instances of IAudioFrameNative.
 * @see https://learn.microsoft.com/windows/win32/api/windows.media.core.interop/nn-windows-media-core-interop-iaudioframenativefactory
 * @namespace Windows.Win32.System.WinRT.Media
 */
export default struct IAudioFrameNativeFactory extends IInspectable {
    /**
     * The interface identifier for IAudioFrameNativeFactory
     * @type {Guid}
     */
    static IID := Guid("{7bd67cf8-bf7d-43e6-af8d-b170ee0c0110}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioFrameNativeFactory interfaces
    */
    struct Vtbl extends IInspectable.Vtbl {
        CreateFromMFSample : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioFrameNativeFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IMFSample} data 
     * @param {BOOL} forceReadOnly 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    CreateFromMFSample(data, forceReadOnly, riid) {
        result := ComCall(6, this, "ptr", data, BOOL, forceReadOnly, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    Query(iid) {
        if (IAudioFrameNativeFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateFromMFSample := CallbackCreate(GetMethod(implObj, "CreateFromMFSample"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateFromMFSample)
    }
}
