#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPTranscodePolicy interface provides a method implemented by DirectShow source filters to manage changing the format of digital media files.
 * @see https://docs.microsoft.com/windows/win32/api//wmpservices/nn-wmpservices-iwmptranscodepolicy
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPTranscodePolicy extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPTranscodePolicy
     * @type {Guid}
     */
    static IID => Guid("{b64cbac3-401c-4327-a3e8-b9feb3a8c25c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["allowTranscode"]

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pvbAllow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmpservices/nf-wmpservices-iwmptranscodepolicy-allowtranscode
     */
    allowTranscode(pvbAllow) {
        result := ComCall(3, this, "ptr", pvbAllow, "HRESULT")
        return result
    }
}
