#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MFARGB.ahk" { MFARGB }
#Import ".\IMFContentProtectionManager.ahk" { IMFContentProtectionManager }
#Import ".\MFVideoNormalizedRect.ahk" { MFVideoNormalizedRect }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables the Media Engine to play protected video content.
 * @remarks
 * To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the Media Engine.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nn-mfmediaengine-imfmediaengineprotectedcontent
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaEngineProtectedContent extends IUnknown {
    /**
     * The interface identifier for IMFMediaEngineProtectedContent
     * @type {Guid}
     */
    static IID := Guid("{9f8021e8-9c8c-487e-bb5c-79aa4779938c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaEngineProtectedContent interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ShareResources              : IntPtr
        GetRequiredProtections      : IntPtr
        SetOPMWindow                : IntPtr
        TransferVideoFrame          : IntPtr
        SetContentProtectionManager : IntPtr
        SetApplicationCertificate   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaEngineProtectedContent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Enables the Media Engine to access protected content while in frame-server mode.
     * @remarks
     * In frame-server mode, this method enables the Media Engine to share protected content with the Direct3D 11 device.
     * @param {IUnknown} pUnkDeviceContext A pointer to the Direct3D 11 device content. The Media Engine queries this pointer for the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videocontext">ID3D11VideoContext</a> interface.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineprotectedcontent-shareresources
     */
    ShareResources(pUnkDeviceContext) {
        result := ComCall(3, this, "ptr", pUnkDeviceContext, "HRESULT")
        return result
    }

    /**
     * Gets the content protections that must be applied in frame-server mode.
     * @returns {Integer} Receives a bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_frame_protection_flags">MF_MEDIA_ENGINE_FRAME_PROTECTION_FLAGS</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineprotectedcontent-getrequiredprotections
     */
    GetRequiredProtections() {
        result := ComCall(4, this, "uint*", &pFrameProtectionFlags := 0, "HRESULT")
        return pFrameProtectionFlags
    }

    /**
     * Specifies the window that should receive output link protections.
     * @remarks
     * In frame-server mode, call this method to specify the destination window for protected video content. The Media Engine uses this window to set link protections, using the <a href="https://docs.microsoft.com/windows/desktop/medfound/output-protection-manager">Output Protection Manager</a> (OPM).
     * @param {HWND} _hwnd A handle to the window.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineprotectedcontent-setopmwindow
     */
    SetOPMWindow(_hwnd) {
        result := ComCall(5, this, HWND, _hwnd, "HRESULT")
        return result
    }

    /**
     * Copies a protected video frame to a DXGI surface.
     * @remarks
     * For protected content, call this method instead of the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-transfervideoframe">IMFMediaEngine::TransferVideoFrame</a> method.
     * @param {IUnknown} pDstSurf A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the destination surface.
     * @param {Pointer<MFVideoNormalizedRect>} pSrc A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/evr/ns-evr-mfvideonormalizedrect">MFVideoNormalizedRect</a> structure that specifies the source rectangle.
     * @param {Pointer<RECT>} pDst A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies the destination rectangle.
     * @param {Pointer<MFARGB>} pBorderClr A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfargb">MFARGB</a> structure that specifies the border color.
     * @returns {Integer} Receives a bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_frame_protection_flags">MF_MEDIA_ENGINE_FRAME_PROTECTION_FLAGS</a> enumeration. These flags indicate which content protections the application must apply before presenting the surface.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineprotectedcontent-transfervideoframe
     */
    TransferVideoFrame(pDstSurf, pSrc, pDst, pBorderClr) {
        result := ComCall(6, this, "ptr", pDstSurf, MFVideoNormalizedRect.Ptr, pSrc, RECT.Ptr, pDst, MFARGB.Ptr, pBorderClr, "uint*", &pFrameProtectionFlags := 0, "HRESULT")
        return pFrameProtectionFlags
    }

    /**
     * Sets the content protection manager (CPM).
     * @remarks
     * The Media Engine uses the CPM to handle events related to protected content, such as license acquisition.
     * @param {IMFContentProtectionManager} pCPM A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfcontentprotectionmanager">IMFContentProtectionManager</a> interface, implemented by the caller.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineprotectedcontent-setcontentprotectionmanager
     */
    SetContentProtectionManager(pCPM) {
        result := ComCall(7, this, "ptr", pCPM, "HRESULT")
        return result
    }

    /**
     * Sets the application's certificate.
     * @remarks
     * Call this method to access protected video content in frame-server mode.
     * @param {Integer} pbBlob A pointer to a buffer that contains the certificate in X.509 format, followed by the application identifier signed with a SHA-256 signature using the private key from the certificate.
     * @param {Integer} cbBlob The size of the <i>pbBlob</i> buffer, in bytes.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineprotectedcontent-setapplicationcertificate
     */
    SetApplicationCertificate(pbBlob, cbBlob) {
        result := ComCall(8, this, "ptr", pbBlob, "uint", cbBlob, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFMediaEngineProtectedContent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ShareResources := CallbackCreate(GetMethod(implObj, "ShareResources"), flags, 2)
        this.vtbl.GetRequiredProtections := CallbackCreate(GetMethod(implObj, "GetRequiredProtections"), flags, 2)
        this.vtbl.SetOPMWindow := CallbackCreate(GetMethod(implObj, "SetOPMWindow"), flags, 2)
        this.vtbl.TransferVideoFrame := CallbackCreate(GetMethod(implObj, "TransferVideoFrame"), flags, 6)
        this.vtbl.SetContentProtectionManager := CallbackCreate(GetMethod(implObj, "SetContentProtectionManager"), flags, 2)
        this.vtbl.SetApplicationCertificate := CallbackCreate(GetMethod(implObj, "SetApplicationCertificate"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ShareResources)
        CallbackFree(this.vtbl.GetRequiredProtections)
        CallbackFree(this.vtbl.SetOPMWindow)
        CallbackFree(this.vtbl.TransferVideoFrame)
        CallbackFree(this.vtbl.SetContentProtectionManager)
        CallbackFree(this.vtbl.SetApplicationCertificate)
    }
}
