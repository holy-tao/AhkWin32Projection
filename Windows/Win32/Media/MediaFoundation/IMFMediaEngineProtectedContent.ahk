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
     * 
     * @param {IUnknown} pUnkDeviceContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineprotectedcontent-shareresources
     */
    ShareResources(pUnkDeviceContext) {
        result := ComCall(3, this, "ptr", pUnkDeviceContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pFrameProtectionFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineprotectedcontent-getrequiredprotections
     */
    GetRequiredProtections(pFrameProtectionFlags) {
        pFrameProtectionFlagsMarshal := pFrameProtectionFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pFrameProtectionFlagsMarshal, pFrameProtectionFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineprotectedcontent-setopmwindow
     */
    SetOPMWindow(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(5, this, "ptr", hwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pDstSurf 
     * @param {Pointer<MFVideoNormalizedRect>} pSrc 
     * @param {Pointer<RECT>} pDst 
     * @param {Pointer<MFARGB>} pBorderClr 
     * @param {Pointer<Integer>} pFrameProtectionFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineprotectedcontent-transfervideoframe
     */
    TransferVideoFrame(pDstSurf, pSrc, pDst, pBorderClr, pFrameProtectionFlags) {
        pFrameProtectionFlagsMarshal := pFrameProtectionFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", pDstSurf, "ptr", pSrc, "ptr", pDst, "ptr", pBorderClr, pFrameProtectionFlagsMarshal, pFrameProtectionFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFContentProtectionManager} pCPM 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineprotectedcontent-setcontentprotectionmanager
     */
    SetContentProtectionManager(pCPM) {
        result := ComCall(7, this, "ptr", pCPM, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} pbBlob 
     * @param {Integer} cbBlob 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineprotectedcontent-setapplicationcertificate
     */
    SetApplicationCertificate(pbBlob, cbBlob) {
        result := ComCall(8, this, "ptr", pbBlob, "uint", cbBlob, "HRESULT")
        return result
    }
}
