#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Controls the stream state of an endpoint.
 * @remarks
 * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client 
 *     applications.
 * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nn-audioengineendpoint-iaudioendpointcontrol
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IAudioEndpointControl extends IUnknown {
    /**
     * The interface identifier for IAudioEndpointControl
     * @type {Guid}
     */
    static IID := Guid("{c684b72a-6df4-4774-bdf9-76b77509b653}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioEndpointControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Start : IntPtr
        Reset : IntPtr
        Stop  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioEndpointControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Starts the endpoint stream.
     * @remarks
     * The implementation of this method can differ depending on the type of device that the endpoint represents.
     * 
     * This method must not be called from a real-time processing thread.
     * 
     * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client applications.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpointcontrol-start
     */
    Start() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Resets the endpoint stream.
     * @remarks
     * <b>Reset</b> discards all data that has not been processed yet.
     *     The implementation of this method may differ depending on the type of device that the endpoint represents.
     * 
     * This method must not be called from a real-time processing thread.
     * 
     * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client applications.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpointcontrol-reset
     */
    Reset() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Stops the endpoint stream.
     * @remarks
     * The implementation of this method can differ depending on the type of device that the endpoint represents.
     * 
     * This method must not be called from a real-time processing thread.
     * 
     * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client applications.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpointcontrol-stop
     */
    Stop() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAudioEndpointControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Start := CallbackCreate(GetMethod(implObj, "Start"), flags, 1)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.Stop := CallbackCreate(GetMethod(implObj, "Stop"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Start)
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.Stop)
    }
}
