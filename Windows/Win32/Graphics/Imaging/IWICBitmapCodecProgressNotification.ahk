#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods used for progress notification for encoders and decoders.
 * @remarks
 * 
  * This interface is not supported by the Windows provided codecs.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicbitmapcodecprogressnotification
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICBitmapCodecProgressNotification extends IUnknown{
    /**
     * The interface identifier for IWICBitmapCodecProgressNotification
     * @type {Guid}
     */
    static IID => Guid("{64c1024e-c3cf-4462-8078-88c2b11c46d9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PFNProgressNotification>} pfnProgressNotification 
     * @param {Pointer<Void>} pvData 
     * @param {Integer} dwProgressFlags 
     * @returns {HRESULT} 
     */
    RegisterProgressNotification(pfnProgressNotification, pvData, dwProgressFlags) {
        result := ComCall(3, this, "ptr", pfnProgressNotification, "ptr", pvData, "uint", dwProgressFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
