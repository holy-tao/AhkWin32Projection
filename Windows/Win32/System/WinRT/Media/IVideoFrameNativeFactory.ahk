#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Media\MediaFoundation\MFVideoArea.ahk" { MFVideoArea }
#Import "..\..\..\Media\MediaFoundation\IMFSample.ahk" { IMFSample }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IInspectable.ahk" { IInspectable }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Media\MediaFoundation\IMFDXGIDeviceManager.ahk" { IMFDXGIDeviceManager }

/**
 * Creates instances of IVideoFrameNative.
 * @see https://learn.microsoft.com/windows/win32/api/windows.media.core.interop/nn-windows-media-core-interop-ivideoframenativefactory
 * @namespace Windows.Win32.System.WinRT.Media
 */
export default struct IVideoFrameNativeFactory extends IInspectable {
    /**
     * The interface identifier for IVideoFrameNativeFactory
     * @type {Guid}
     */
    static IID := Guid("{69e3693e-8e1e-4e63-ac4c-7fdc21d9731d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVideoFrameNativeFactory interfaces
    */
    struct Vtbl extends IInspectable.Vtbl {
        CreateFromMFSample : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVideoFrameNativeFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IMFSample} data 
     * @param {Pointer<Guid>} subtype 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {BOOL} forceReadOnly 
     * @param {Pointer<MFVideoArea>} minDisplayAperture 
     * @param {IMFDXGIDeviceManager} device 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    CreateFromMFSample(data, subtype, width, height, forceReadOnly, minDisplayAperture, device, riid) {
        result := ComCall(6, this, "ptr", data, Guid.Ptr, subtype, "uint", width, "uint", height, BOOL, forceReadOnly, MFVideoArea.Ptr, minDisplayAperture, "ptr", device, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    Query(iid) {
        if (IVideoFrameNativeFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateFromMFSample := CallbackCreate(GetMethod(implObj, "CreateFromMFSample"), flags, 10)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateFromMFSample)
    }
}
