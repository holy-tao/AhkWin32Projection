#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\Apo\APO_CONNECTION_PROPERTY.ahk" { APO_CONNECTION_PROPERTY }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides functionality to allow an offload stream client to notify the endpoint that the last buffer has been sent only partially filled.
 * @remarks
 * This is an optional interface on an endpoint.
 * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nn-audioengineendpoint-iaudioendpointlastbuffercontrol
 * @namespace Windows.Win32.Media.Audio.Endpoints
 */
export default struct IAudioEndpointLastBufferControl extends IUnknown {
    /**
     * The interface identifier for IAudioEndpointLastBufferControl
     * @type {Guid}
     */
    static IID := Guid("{f8520dd3-8f9d-4437-9861-62f584c33dd6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioEndpointLastBufferControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IsLastBufferControlSupported          : IntPtr
        ReleaseOutputDataPointerForLastBuffer : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioEndpointLastBufferControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Indicates if last buffer control is supported.
     * @returns {BOOL} <b>true</b> if last buffer control is supported; otherwise, <b>false</b>.
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpointlastbuffercontrol-islastbuffercontrolsupported
     */
    IsLastBufferControlSupported() {
        result := ComCall(3, this, BOOL)
        return result
    }

    /**
     * Releases the output data pointer for the last buffer.
     * @param {Pointer<APO_CONNECTION_PROPERTY>} pConnectionProperty The APO connection property.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpointlastbuffercontrol-releaseoutputdatapointerforlastbuffer
     */
    ReleaseOutputDataPointerForLastBuffer(pConnectionProperty) {
        ComCall(4, this, APO_CONNECTION_PROPERTY.Ptr, pConnectionProperty)
    }

    Query(iid) {
        if (IAudioEndpointLastBufferControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsLastBufferControlSupported := CallbackCreate(GetMethod(implObj, "IsLastBufferControlSupported"), flags, 1)
        this.vtbl.ReleaseOutputDataPointerForLastBuffer := CallbackCreate(GetMethod(implObj, "ReleaseOutputDataPointerForLastBuffer"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsLastBufferControlSupported)
        CallbackFree(this.vtbl.ReleaseOutputDataPointerForLastBuffer)
    }
}
