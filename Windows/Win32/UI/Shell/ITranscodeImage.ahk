#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that allows conversion to JPEG or bitmap (BMP) image formats from any image type supported by Windows.
 * @see https://docs.microsoft.com/windows/win32/api//imagetranscode/nn-imagetranscode-itranscodeimage
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ITranscodeImage extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITranscodeImage
     * @type {Guid}
     */
    static IID => Guid("{bae86ddd-dc11-421c-b7ab-cc55d1d65c44}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TranscodeImage"]

    /**
     * Converts an image to JPEG or bitmap (BMP) image format.
     * @param {IShellItem} pShellItem Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * The Shell Item for the image to convert.
     * @param {Integer} uiMaxWidth Type: <b>UINT</b>
     * 
     * The requested height in pixels. Should be less than or equal to the actual height of the original image. See Remarks.
     * @param {Integer} uiMaxHeight Type: <b>UINT</b>
     * 
     * The requested width in pixels. Should be less than or equal to the actual width of the original image. See Remarks.
     * @param {Integer} flags Type: <b>TI_FLAGS</b>
     * 
     * One of the following flags.
     * @param {IStream} pvImage Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * A stream to receive the converted image. The stream must be created by the calling code prior to calling <b>TranscodeImage</b>.
     * @param {Pointer<Integer>} puiWidth Type: <b>UINT*</b>
     * 
     * The actual width of the converted image.
     * @param {Pointer<Integer>} puiHeight Type: <b>UINT*</b>
     * 
     * The actual height of the converted image.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//imagetranscode/nf-imagetranscode-itranscodeimage-transcodeimage
     */
    TranscodeImage(pShellItem, uiMaxWidth, uiMaxHeight, flags, pvImage, puiWidth, puiHeight) {
        puiWidthMarshal := puiWidth is VarRef ? "uint*" : "ptr"
        puiHeightMarshal := puiHeight is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pShellItem, "uint", uiMaxWidth, "uint", uiMaxHeight, "uint", flags, "ptr", pvImage, puiWidthMarshal, puiWidth, puiHeightMarshal, puiHeight, "HRESULT")
        return result
    }
}
