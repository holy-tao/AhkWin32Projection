#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IWMCodecVideoAccelerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMCodecVideoAccelerator
     * @type {Guid}
     */
    static IID => Guid("{990641b0-739f-4e94-a808-9888da8f75af}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["NegotiateConnection", "SetPlayerNotify"]

    /**
     * 
     * @param {IAMVideoAccelerator} pIAMVA 
     * @param {Pointer<AM_MEDIA_TYPE>} pMediaType 
     * @returns {HRESULT} 
     */
    NegotiateConnection(pIAMVA, pMediaType) {
        result := ComCall(3, this, "ptr", pIAMVA, "ptr", pMediaType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMPlayerTimestampHook} pHook 
     * @returns {HRESULT} 
     */
    SetPlayerNotify(pHook) {
        result := ComCall(4, this, "ptr", pHook, "HRESULT")
        return result
    }
}
