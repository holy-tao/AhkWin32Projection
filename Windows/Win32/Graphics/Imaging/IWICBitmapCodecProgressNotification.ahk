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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterProgressNotification"]

    /**
     * 
     * @param {Pointer<PFNProgressNotification>} pfnProgressNotification 
     * @param {Pointer<Void>} pvData 
     * @param {Integer} dwProgressFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapcodecprogressnotification-registerprogressnotification
     */
    RegisterProgressNotification(pfnProgressNotification, pvData, dwProgressFlags) {
        pvDataMarshal := pvData is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", pfnProgressNotification, pvDataMarshal, pvData, "uint", dwProgressFlags, "HRESULT")
        return result
    }
}
