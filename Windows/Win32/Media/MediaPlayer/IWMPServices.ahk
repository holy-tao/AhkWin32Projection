#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WMPServices_StreamState.ahk" { WMPServices_StreamState }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMPServices interface is implemented by Windows Media Player. It provides methods to retrieve the current stream state and current stream time.
 * @see https://learn.microsoft.com/windows/win32/api/wmpservices/nn-wmpservices-iwmpservices
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPServices extends IUnknown {
    /**
     * The interface identifier for IWMPServices
     * @type {Guid}
     */
    static IID := Guid("{afb6b76b-1e20-4198-83b3-191db6e0b149}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPServices interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetStreamTime  : IntPtr
        GetStreamState : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPServices.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IWMPServices::GetStreamTime method retrieves a structure indicating the current stream time.
     * @remarks
     * The current stream time is determined by Windows Media Player. This means that the value returned by this method do not necessarily represent the elapsed time relative to the beginning of the file. For instance, if the user moves the trackbar in the Player to seek the media to a new position, the value returned by this method returns the time elapsed since the media began playing from the new position. Changes in playback rate will also affect the value returned by this method.
     * 
     * The values provided in the <b>rtTimestamp</b> member of <b>IMediaObject::ProcessInput</b> and the <b>rtTimestamp</b> member of the <b>DMO_OUTPUT_DATA_BUFFER</b> structure supplied by <b>IMediaObject::ProcessOutput</b> contain values that indicate when the data provided in the buffer will be rendered relative to the current stream time. Therefore, these values also do not necessarily represent the elapsed time relative to the beginning of the file file or the presentation time specified in the file.
     * @param {Pointer<Integer>} prt Pointer to a <b>REFERENCE_TIME</b> structure.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wmpservices/nf-wmpservices-iwmpservices-getstreamtime
     */
    GetStreamTime(prt) {
        prtMarshal := prt is VarRef ? "int64*" : "ptr"

        result := ComCall(3, this, prtMarshal, prt, "HRESULT")
        return result
    }

    /**
     * The IWMPServices::GetStreamState method retrieves information about the current play state of the stream.
     * @remarks
     * The stream is stopped, paused, or playing.
     * @param {Pointer<WMPServices_StreamState>} pState A pointer to a <b>WMPServices_StreamState</b> enumeration value.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wmpservices/nf-wmpservices-iwmpservices-getstreamstate
     */
    GetStreamState(pState) {
        pStateMarshal := pState is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pStateMarshal, pState, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPServices.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStreamTime := CallbackCreate(GetMethod(implObj, "GetStreamTime"), flags, 2)
        this.vtbl.GetStreamState := CallbackCreate(GetMethod(implObj, "GetStreamState"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStreamTime)
        CallbackFree(this.vtbl.GetStreamState)
    }
}
