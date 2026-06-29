#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFMediaSource.ahk" { IMFMediaSource }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFByteStream.ahk" { IMFByteStream }
#Import ".\IMFMediaSourceExtension.ahk" { IMFMediaSourceExtension }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables the media source to be transferred between the media engine and the sharing engine for Play To.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nn-mfmediaengine-imfmediaenginesupportssourcetransfer
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaEngineSupportsSourceTransfer extends IUnknown {
    /**
     * The interface identifier for IMFMediaEngineSupportsSourceTransfer
     * @type {Guid}
     */
    static IID := Guid("{a724b056-1b2e-4642-a6f3-db9420c52908}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaEngineSupportsSourceTransfer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ShouldTransferSource : IntPtr
        DetachMediaSource    : IntPtr
        AttachMediaSource    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaEngineSupportsSourceTransfer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Specifies whether or not the source should be transferred.
     * @returns {BOOL} <b>true</b> if the source should be transferred; otherwise, <b>false</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaenginesupportssourcetransfer-shouldtransfersource
     */
    ShouldTransferSource() {
        result := ComCall(3, this, BOOL.Ptr, &pfShouldTransfer := 0, "HRESULT")
        return pfShouldTransfer
    }

    /**
     * Detaches the media source.
     * @param {Pointer<IMFByteStream>} ppByteStream Receives the byte stream.
     * @param {Pointer<IMFMediaSource>} ppMediaSource Receives the media source.
     * @param {Pointer<IMFMediaSourceExtension>} ppMSE Receives the media source extension.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaenginesupportssourcetransfer-detachmediasource
     */
    DetachMediaSource(ppByteStream, ppMediaSource, ppMSE) {
        result := ComCall(4, this, IMFByteStream.Ptr, ppByteStream, IMFMediaSource.Ptr, ppMediaSource, IMFMediaSourceExtension.Ptr, ppMSE, "HRESULT")
        return result
    }

    /**
     * Attaches the media source.
     * @param {IMFByteStream} pByteStream Specifies the byte stream.
     * @param {IMFMediaSource} pMediaSource Specifies the media source.
     * @param {IMFMediaSourceExtension} pMSE Specifies the media source extension.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaenginesupportssourcetransfer-attachmediasource
     */
    AttachMediaSource(pByteStream, pMediaSource, pMSE) {
        result := ComCall(5, this, "ptr", pByteStream, "ptr", pMediaSource, "ptr", pMSE, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFMediaEngineSupportsSourceTransfer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ShouldTransferSource := CallbackCreate(GetMethod(implObj, "ShouldTransferSource"), flags, 2)
        this.vtbl.DetachMediaSource := CallbackCreate(GetMethod(implObj, "DetachMediaSource"), flags, 4)
        this.vtbl.AttachMediaSource := CallbackCreate(GetMethod(implObj, "AttachMediaSource"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ShouldTransferSource)
        CallbackFree(this.vtbl.DetachMediaSource)
        CallbackFree(this.vtbl.AttachMediaSource)
    }
}
