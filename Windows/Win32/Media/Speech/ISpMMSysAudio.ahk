#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpAudio.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpMMSysAudio extends ISpAudio{
    /**
     * The interface identifier for ISpMMSysAudio
     * @type {Guid}
     */
    static IID => Guid("{15806f6e-1d70-4b48-98e6-3b1a007509ab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 26

    /**
     * 
     * @param {Pointer<UInt32>} puDeviceId 
     * @returns {HRESULT} 
     */
    GetDeviceId(puDeviceId) {
        result := ComCall(26, this, "uint*", puDeviceId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uDeviceId 
     * @returns {HRESULT} 
     */
    SetDeviceId(uDeviceId) {
        result := ComCall(27, this, "uint", uDeviceId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pHandle 
     * @returns {HRESULT} 
     */
    GetMMHandle(pHandle) {
        result := ComCall(28, this, "ptr", pHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} puLineId 
     * @returns {HRESULT} 
     */
    GetLineId(puLineId) {
        result := ComCall(29, this, "uint*", puLineId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uLineId 
     * @returns {HRESULT} 
     */
    SetLineId(uLineId) {
        result := ComCall(30, this, "uint", uLineId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
