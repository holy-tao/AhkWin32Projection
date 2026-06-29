#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IInspectable.ahk" { IInspectable }

/**
 * Represents a frame of video data.
 * @see https://learn.microsoft.com/windows/win32/api/windows.media.core.interop/nn-windows-media-core-interop-ivideoframenative
 * @namespace Windows.Win32.System.WinRT.Media
 */
export default struct IVideoFrameNative extends IInspectable {
    /**
     * The interface identifier for IVideoFrameNative
     * @type {Guid}
     */
    static IID := Guid("{26ba702b-314a-4620-aaf6-7a51aa58fa18}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVideoFrameNative interfaces
    */
    struct Vtbl extends IInspectable.Vtbl {
        GetData   : IntPtr
        GetDevice : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVideoFrameNative.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This method returns an interface that provides access to the video data.
     * @param {Pointer<Guid>} riid The IID of the interface to retrieve.
     * @returns {Pointer<Void>} When this method returns successfully, contains the interface pointer requested in *riid* parameter.
     * @see https://learn.microsoft.com/windows/win32/WinRT/ivideoframenative-getdata
     */
    GetData(riid) {
        result := ComCall(6, this, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * This method returns a device associated with the video data.
     * @param {Pointer<Guid>} riid The IID of the device to retrieve.
     * @returns {Pointer<Void>} When this method returns successfully, contains the device pointer requested in *riid* parameter.
     * @see https://learn.microsoft.com/windows/win32/WinRT/ivideoframenative-getdevice
     */
    GetDevice(riid) {
        result := ComCall(7, this, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    Query(iid) {
        if (IVideoFrameNative.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetData := CallbackCreate(GetMethod(implObj, "GetData"), flags, 3)
        this.vtbl.GetDevice := CallbackCreate(GetMethod(implObj, "GetDevice"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetData)
        CallbackFree(this.vtbl.GetDevice)
    }
}
