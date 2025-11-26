#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICBitmapEncoder.ahk
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
     * Creates a new IWICBitmapEncoder instance.
     * @returns {IWICBitmapEncoder} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapencoder">IWICBitmapEncoder</a>**</b>
     * 
     * A pointer that receives a pointer to a new <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapencoder">IWICBitmapEncoder</a> instance.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicbitmapencoderinfo-createinstance
     */
    CreateInstance() {
        result := ComCall(23, this, "ptr*", &ppIBitmapEncoder := 0, "HRESULT")
        return IWICBitmapEncoder(ppIBitmapEncoder)
    }
}
