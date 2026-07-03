#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables sending an audio stream from the collaboration sharer Microsoft ActiveX control to collaboration viewer controls.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nn-rdpencomapi-irdpsrapiaudiostream
 * @namespace Windows.Win32.System.DesktopSharing
 */
export default struct IRDPSRAPIAudioStream extends IUnknown {
    /**
     * The interface identifier for IRDPSRAPIAudioStream
     * @type {Guid}
     */
    static IID := Guid("{e3e30ef9-89c6-4541-ba3b-19336ac6d31c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRDPSRAPIAudioStream interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize : IntPtr
        Start      : IntPtr
        Stop       : IntPtr
        GetBuffer  : IntPtr
        FreeBuffer : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRDPSRAPIAudioStream.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes the audio stream.
     * @returns {Integer} On return, indicates the stream period in 100 nanosecond intervals. The collaboration sharer calculates how frequently to call the <a href="https://docs.microsoft.com/windows/desktop/api/rdpencomapi/nf-rdpencomapi-irdpsrapiaudiostream-getbuffer">GetBuffer</a> method from this value.
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiaudiostream-initialize
     */
    Initialize() {
        result := ComCall(3, this, "int64*", &pnPeriodInHundredNsIntervals := 0, "HRESULT")
        return pnPeriodInHundredNsIntervals
    }

    /**
     * Starts the audio stream.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiaudiostream-start
     */
    Start() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Stops the audio stream.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiaudiostream-stop
     */
    Stop() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Gets audio data from the buffer.
     * @param {Pointer<Pointer<Integer>>} ppbData A pointer to the current location in the buffer.
     * @param {Pointer<Integer>} pcbData The size in bytes of the available data in the buffer.
     * @param {Pointer<Integer>} pTimestamp The time-based location of the location pointer.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiaudiostream-getbuffer
     */
    GetBuffer(ppbData, pcbData, pTimestamp) {
        ppbDataMarshal := ppbData is VarRef ? "ptr*" : "ptr"
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"
        pTimestampMarshal := pTimestamp is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, ppbDataMarshal, ppbData, pcbDataMarshal, pcbData, pTimestampMarshal, pTimestamp, "HRESULT")
        return result
    }

    /**
     * Releases the hold on the buffer after the GetBuffer method is called.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiaudiostream-freebuffer
     */
    FreeBuffer() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRDPSRAPIAudioStream.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 2)
        this.vtbl.Start := CallbackCreate(GetMethod(implObj, "Start"), flags, 1)
        this.vtbl.Stop := CallbackCreate(GetMethod(implObj, "Stop"), flags, 1)
        this.vtbl.GetBuffer := CallbackCreate(GetMethod(implObj, "GetBuffer"), flags, 4)
        this.vtbl.FreeBuffer := CallbackCreate(GetMethod(implObj, "FreeBuffer"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.Start)
        CallbackFree(this.vtbl.Stop)
        CallbackFree(this.vtbl.GetBuffer)
        CallbackFree(this.vtbl.FreeBuffer)
    }
}
