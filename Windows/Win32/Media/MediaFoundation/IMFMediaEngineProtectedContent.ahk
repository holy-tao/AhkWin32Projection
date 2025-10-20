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
     * 
     * @param {Pointer<IUnknown>} pUnkDeviceContext 
     * @returns {HRESULT} 
     */
    ShareResources(pUnkDeviceContext) {
        result := ComCall(3, this, "ptr", pUnkDeviceContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pFrameProtectionFlags 
     * @returns {HRESULT} 
     */
    GetRequiredProtections(pFrameProtectionFlags) {
        result := ComCall(4, this, "uint*", pFrameProtectionFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @returns {HRESULT} 
     */
    SetOPMWindow(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(5, this, "ptr", hwnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pDstSurf 
     * @param {Pointer<MFVideoNormalizedRect>} pSrc 
     * @param {Pointer<RECT>} pDst 
     * @param {Pointer<MFARGB>} pBorderClr 
     * @param {Pointer<UInt32>} pFrameProtectionFlags 
     * @returns {HRESULT} 
     */
    TransferVideoFrame(pDstSurf, pSrc, pDst, pBorderClr, pFrameProtectionFlags) {
        result := ComCall(6, this, "ptr", pDstSurf, "ptr", pSrc, "ptr", pDst, "ptr", pBorderClr, "uint*", pFrameProtectionFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFContentProtectionManager>} pCPM 
     * @returns {HRESULT} 
     */
    SetContentProtectionManager(pCPM) {
        result := ComCall(7, this, "ptr", pCPM, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} pbBlob 
     * @param {Integer} cbBlob 
     * @returns {HRESULT} 
     */
    SetApplicationCertificate(pbBlob, cbBlob) {
        result := ComCall(8, this, "ptr", pbBlob, "uint", cbBlob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
