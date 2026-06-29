#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMSVidFeature.ahk" { IMSVidFeature }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IMSVidEncoder interface represents the MSVidEncoder feature object, which is required for stream buffer applications using the Video Control. For more information, see Using the Stream Buffer Engine with the Video Control.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidEncoder)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidencoder
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidEncoder extends IMSVidFeature {
    /**
     * The interface identifier for IMSVidEncoder
     * @type {Guid}
     */
    static IID := Guid("{c0020fd4-bee7-43d9-a495-9f213117103d}")

    /**
     * The class identifier for MSVidEncoder
     * @type {Guid}
     */
    static CLSID := Guid("{bb530c63-d9df-4b49-9439-63453962e598}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidEncoder interfaces
    */
    struct Vtbl extends IMSVidFeature.Vtbl {
        get_VideoEncoderInterface : IntPtr
        get_AudioEncoderInterface : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidEncoder.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IUnknown} 
     */
    VideoEncoderInterface {
        get => this.get_VideoEncoderInterface()
    }

    /**
     * @type {IUnknown} 
     */
    AudioEncoderInterface {
        get => this.get_AudioEncoderInterface()
    }

    /**
     * The get_VideoEncoderInterface method retrieves a pointer to the video encoder interface.
     * @remarks
     * If the method succeeds, the caller must release the <b>IUnknown</b> interface.
     * @returns {IUnknown} Pointer to a variable that receives an <b>IUnknown</b> interface pointer. The caller can query this interface for the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iencoderapi">IEncoderAPI</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidencoder-get_videoencoderinterface
     */
    get_VideoEncoderInterface() {
        result := ComCall(16, this, "ptr*", &ppEncInt := 0, "HRESULT")
        return IUnknown(ppEncInt)
    }

    /**
     * The get_AudioEncoderInterface method retrieves a pointer to the audio encoder interface.
     * @remarks
     * If the method succeeds, the caller must release the <b>IUnknown</b> interface.
     * @returns {IUnknown} Pointer to a variable that receives an <b>IUnknown</b> interface pointer. The caller can query this interface for the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iencoderapi">IEncoderAPI</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidencoder-get_audioencoderinterface
     */
    get_AudioEncoderInterface() {
        result := ComCall(17, this, "ptr*", &ppEncInt := 0, "HRESULT")
        return IUnknown(ppEncInt)
    }

    Query(iid) {
        if (IMSVidEncoder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_VideoEncoderInterface := CallbackCreate(GetMethod(implObj, "get_VideoEncoderInterface"), flags, 2)
        this.vtbl.get_AudioEncoderInterface := CallbackCreate(GetMethod(implObj, "get_AudioEncoderInterface"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_VideoEncoderInterface)
        CallbackFree(this.vtbl.get_AudioEncoderInterface)
    }
}
