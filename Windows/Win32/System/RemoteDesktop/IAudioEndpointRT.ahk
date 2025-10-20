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
     * 
     * @param {Pointer<Int64>} pPadding 
     * @param {Pointer<AE_CURRENT_POSITION>} pAeCurrentPosition 
     * @returns {String} Nothing - always returns an empty string
     */
    GetCurrentPadding(pPadding, pAeCurrentPosition) {
        ComCall(3, this, "int64*", pPadding, "ptr", pAeCurrentPosition)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    ProcessingComplete() {
        ComCall(4, this)
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetPinInactive() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetPinActive() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
