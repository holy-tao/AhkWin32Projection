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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance"]

    /**
     * 
     * @param {Pointer<IWICBitmapEncoder>} ppIBitmapEncoder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapencoderinfo-createinstance
     */
    CreateInstance(ppIBitmapEncoder) {
        result := ComCall(23, this, "ptr*", ppIBitmapEncoder, "HRESULT")
        return result
    }
}
