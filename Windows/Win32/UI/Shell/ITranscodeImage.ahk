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
     * 
     * @param {Pointer<IShellItem>} pShellItem 
     * @param {Integer} uiMaxWidth 
     * @param {Integer} uiMaxHeight 
     * @param {Integer} flags 
     * @param {Pointer<IStream>} pvImage 
     * @param {Pointer<UInt32>} puiWidth 
     * @param {Pointer<UInt32>} puiHeight 
     * @returns {HRESULT} 
     */
    TranscodeImage(pShellItem, uiMaxWidth, uiMaxHeight, flags, pvImage, puiWidth, puiHeight) {
        result := ComCall(3, this, "ptr", pShellItem, "uint", uiMaxWidth, "uint", uiMaxHeight, "uint", flags, "ptr", pvImage, "uint*", puiWidth, "uint*", puiHeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
