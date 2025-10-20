#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICBitmapCodecInfo.ahk

/**
 * Exposes methods that provide information about an encoder.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicbitmapencoderinfo
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICBitmapEncoderInfo extends IWICBitmapCodecInfo{
    /**
     * The interface identifier for IWICBitmapEncoderInfo
     * @type {Guid}
     */
    static IID => Guid("{94c9b4ee-a09f-4f92-8a1e-4a9bce7e76fb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 23

    /**
     * 
     * @param {Pointer<IWICBitmapEncoder>} ppIBitmapEncoder 
     * @returns {HRESULT} 
     */
    CreateInstance(ppIBitmapEncoder) {
        result := ComCall(23, this, "ptr", ppIBitmapEncoder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
