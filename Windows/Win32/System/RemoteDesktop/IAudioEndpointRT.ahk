#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Gets the difference between the current read and write positions in the endpoint buffer.
 * @remarks
 * 
 * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client 
 *     applications.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//audioengineendpoint/nn-audioengineendpoint-iaudioendpointrt
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IAudioEndpointRT extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioEndpointRT
     * @type {Guid}
     */
    static IID => Guid("{dfd2005f-a6e5-4d39-a265-939ada9fbb4d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrentPadding", "ProcessingComplete", "SetPinInactive", "SetPinActive"]

    /**
     * 
     * @param {Pointer<Integer>} pPadding 
     * @param {Pointer<AE_CURRENT_POSITION>} pAeCurrentPosition 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpointrt-getcurrentpadding
     */
    GetCurrentPadding(pPadding, pAeCurrentPosition) {
        pPaddingMarshal := pPadding is VarRef ? "int64*" : "ptr"

        ComCall(3, this, pPaddingMarshal, pPadding, "ptr", pAeCurrentPosition)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpointrt-processingcomplete
     */
    ProcessingComplete() {
        ComCall(4, this)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpointrt-setpininactive
     */
    SetPinInactive() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpointrt-setpinactive
     */
    SetPinActive() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
