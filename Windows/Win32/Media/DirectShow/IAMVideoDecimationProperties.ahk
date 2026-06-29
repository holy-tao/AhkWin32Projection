#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DECIMATION_USAGE.ahk" { DECIMATION_USAGE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAMVideoDecimationProperties interface controls how the Overlay Mixer performs video decimationIf a video window is smaller than the native size of the video being displayed, the video renderer must decimate the incoming video�that is, scale the video down to the smaller size. Decimation can be performed in one of the following places.The overlay hardware on the VGA chip.The scaler built in to the video port (if the connection is through a video port).The decoder supplying video to the renderer.An application can call methods on this interface to select a particular decimation strategy, in order to optimize performance. However, most applications will have no occasion to use this interface. Unless your application is designed to support particular hardware, there is no reason to modify the Overlay Mixer filter's default behavior for decimation.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iamvideodecimationproperties
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMVideoDecimationProperties extends IUnknown {
    /**
     * The interface identifier for IAMVideoDecimationProperties
     * @type {Guid}
     */
    static IID := Guid("{60d32930-13da-11d3-9ec6-c4fcaef5c7be}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMVideoDecimationProperties interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        QueryDecimationUsage : IntPtr
        SetDecimationUsage   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMVideoDecimationProperties.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The QueryDecimationUsage method retrieves the current decimation strategy.
     * @returns {DECIMATION_USAGE} Pointer to a variable of type [DECIMATION_USAGE](/windows/desktop/api/strmif/ne-strmif-decimation_usage) that receives the decimation setting.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideodecimationproperties-querydecimationusage
     */
    QueryDecimationUsage() {
        result := ComCall(3, this, "int*", &lpUsage := 0, "HRESULT")
        return lpUsage
    }

    /**
     * The SetDecimationUsage method sets the decimation strategy.
     * @param {DECIMATION_USAGE} Usage Member of the [DECIMATION_USAGE](/windows/desktop/api/strmif/ne-strmif-decimation_usage) enumeration that specifies the decimation strategy.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface. The DirectShow implementation returns S_OK if successful, or E_INVALIDARG otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvideodecimationproperties-setdecimationusage
     */
    SetDecimationUsage(Usage) {
        result := ComCall(4, this, DECIMATION_USAGE, Usage, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAMVideoDecimationProperties.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.QueryDecimationUsage := CallbackCreate(GetMethod(implObj, "QueryDecimationUsage"), flags, 2)
        this.vtbl.SetDecimationUsage := CallbackCreate(GetMethod(implObj, "SetDecimationUsage"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.QueryDecimationUsage)
        CallbackFree(this.vtbl.SetDecimationUsage)
    }
}
