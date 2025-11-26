#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables the Media Engine to play protected video content.
 * @remarks
 * 
 * To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the Media Engine.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imfmediaengineprotectedcontent
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaEngineProtectedContent extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaEngineProtectedContent
     * @type {Guid}
     */
    static IID => Guid("{9f8021e8-9c8c-487e-bb5c-79aa4779938c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShareResources", "GetRequiredProtections", "SetOPMWindow", "TransferVideoFrame", "SetContentProtectionManager", "SetApplicationCertificate"]

    /**
     * Enables the Media Engine to access protected content while in frame-server mode.
     * @param {IUnknown} pUnkDeviceContext A pointer to the Direct3D 11 device content. The Media Engine queries this pointer for the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videocontext">ID3D11VideoContext</a> interface.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineprotectedcontent-shareresources
     */
    ShareResources(pUnkDeviceContext) {
        result := ComCall(3, this, "ptr", pUnkDeviceContext, "HRESULT")
        return result
    }

    /**
     * Gets the content protections that must be applied in frame-server mode.
     * @returns {Integer} Receives a bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_frame_protection_flags">MF_MEDIA_ENGINE_FRAME_PROTECTION_FLAGS</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineprotectedcontent-getrequiredprotections
     */
    GetRequiredProtections() {
        result := ComCall(4, this, "uint*", &pFrameProtectionFlags := 0, "HRESULT")
        return pFrameProtectionFlags
    }

    /**
     * Specifies the window that should receive output link protections.
     * @param {HWND} hwnd A handle to the window.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineprotectedcontent-setopmwindow
     */
    SetOPMWindow(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(5, this, "ptr", hwnd, "HRESULT")
        return result
    }

    /**
     * Copies a protected video frame to a DXGI surface.
     * @param {IUnknown} pDstSurf A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the destination surface.
     * @param {Pointer<MFVideoNormalizedRect>} pSrc A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/evr/ns-evr-mfvideonormalizedrect">MFVideoNormalizedRect</a> structure that specifies the source rectangle.
     * @param {Pointer<RECT>} pDst A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies the destination rectangle.
     * @param {Pointer<MFARGB>} pBorderClr A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfargb">MFARGB</a> structure that specifies the border color.
     * @returns {Integer} Receives a bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_frame_protection_flags">MF_MEDIA_ENGINE_FRAME_PROTECTION_FLAGS</a> enumeration. These flags indicate which content protections the application must apply before presenting the surface.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineprotectedcontent-transfervideoframe
     */
    TransferVideoFrame(pDstSurf, pSrc, pDst, pBorderClr) {
        result := ComCall(6, this, "ptr", pDstSurf, "ptr", pSrc, "ptr", pDst, "ptr", pBorderClr, "uint*", &pFrameProtectionFlags := 0, "HRESULT")
        return pFrameProtectionFlags
    }

    /**
     * Sets the content protection manager (CPM).
     * @param {IMFContentProtectionManager} pCPM A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfcontentprotectionmanager">IMFContentProtectionManager</a> interface, implemented by the caller.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineprotectedcontent-setcontentprotectionmanager
     */
    SetContentProtectionManager(pCPM) {
        result := ComCall(7, this, "ptr", pCPM, "HRESULT")
        return result
    }

    /**
     * Sets the application's certificate.
     * @param {Pointer} pbBlob A pointer to a buffer that contains the certificate in X.509 format, followed by the application identifier signed with a SHA-256 signature using the private key from the certificate.
     * @param {Integer} cbBlob The size of the <i>pbBlob</i> buffer, in bytes.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineprotectedcontent-setapplicationcertificate
     */
    SetApplicationCertificate(pbBlob, cbBlob) {
        result := ComCall(8, this, "ptr", pbBlob, "uint", cbBlob, "HRESULT")
        return result
    }
}
