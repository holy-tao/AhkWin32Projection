#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFAttributes.ahk" { IMFAttributes }
#Import ".\IMFMediaType.ahk" { IMFMediaType }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides additional functionality on the sink writer for dynamically changing the media type and encoder configuration.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/medfound/sink-writer">Sink Writer</a> implements this interface in Windows 8.1. To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nn-mfreadwrite-imfsinkwriter">IMFSinkWriter</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nn-mfreadwrite-imfsinkwriterencoderconfig
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFSinkWriterEncoderConfig extends IUnknown {
    /**
     * The interface identifier for IMFSinkWriterEncoderConfig
     * @type {Guid}
     */
    static IID := Guid("{17c3779e-3cde-4ede-8c60-3899f5f53ad6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFSinkWriterEncoderConfig interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetTargetMediaType      : IntPtr
        PlaceEncodingParameters : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFSinkWriterEncoderConfig.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Dynamically changes the target media type that Sink Writer is encoding to.
     * @remarks
     * The new media type must be supported by the media sink being used and by     the encoder MFTs installed on the system.
     * @param {Integer} dwStreamIndex Specifies the stream index.
     * @param {IMFMediaType} pTargetMediaType The new media format to encode to.
     * @param {IMFAttributes} pEncodingParameters The new set of encoding parameters to configure the encoder with.
     *     If not specified, previously provided parameters will be used.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsinkwriterencoderconfig-settargetmediatype
     */
    SetTargetMediaType(dwStreamIndex, pTargetMediaType, pEncodingParameters) {
        result := ComCall(3, this, "uint", dwStreamIndex, "ptr", pTargetMediaType, "ptr", pEncodingParameters, "HRESULT")
        return result
    }

    /**
     * Dynamically updates the encoder configuration with a collection of new encoder settings.
     * @remarks
     * The encoder will be configured with these settings after all previously queued input media samples have been sent to it through <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processinput">IMFTransform::ProcessInput</a>.
     * @param {Integer} dwStreamIndex Specifies the stream index.
     * @param {IMFAttributes} pEncodingParameters A set of encoding parameters to configure the encoder with.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsinkwriterencoderconfig-placeencodingparameters
     */
    PlaceEncodingParameters(dwStreamIndex, pEncodingParameters) {
        result := ComCall(4, this, "uint", dwStreamIndex, "ptr", pEncodingParameters, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFSinkWriterEncoderConfig.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetTargetMediaType := CallbackCreate(GetMethod(implObj, "SetTargetMediaType"), flags, 4)
        this.vtbl.PlaceEncodingParameters := CallbackCreate(GetMethod(implObj, "PlaceEncodingParameters"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetTargetMediaType)
        CallbackFree(this.vtbl.PlaceEncodingParameters)
    }
}
