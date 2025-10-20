#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Encodes ID2D1Image interfaces to an IWICBitmapEncoder.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicimageencoder
 * @namespace Windows.Win32.Graphics.Imaging.D2D
 * @version v4.0.30319
 */
class IWICImageEncoder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICImageEncoder
     * @type {Guid}
     */
    static IID => Guid("{04c75bf8-3ce1-473b-acc5-3cc4f5e94999}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["WriteFrame", "WriteFrameThumbnail", "WriteThumbnail"]

    /**
     * 
     * @param {ID2D1Image} pImage 
     * @param {IWICBitmapFrameEncode} pFrameEncode 
     * @param {Pointer<WICImageParameters>} pImageParameters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimageencoder-writeframe
     */
    WriteFrame(pImage, pFrameEncode, pImageParameters) {
        result := ComCall(3, this, "ptr", pImage, "ptr", pFrameEncode, "ptr", pImageParameters, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID2D1Image} pImage 
     * @param {IWICBitmapFrameEncode} pFrameEncode 
     * @param {Pointer<WICImageParameters>} pImageParameters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimageencoder-writeframethumbnail
     */
    WriteFrameThumbnail(pImage, pFrameEncode, pImageParameters) {
        result := ComCall(4, this, "ptr", pImage, "ptr", pFrameEncode, "ptr", pImageParameters, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID2D1Image} pImage 
     * @param {IWICBitmapEncoder} pEncoder 
     * @param {Pointer<WICImageParameters>} pImageParameters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimageencoder-writethumbnail
     */
    WriteThumbnail(pImage, pEncoder, pImageParameters) {
        result := ComCall(5, this, "ptr", pImage, "ptr", pEncoder, "ptr", pImageParameters, "HRESULT")
        return result
    }
}
