#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpAudio.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpMMSysAudio extends ISpAudio{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeviceId", "SetDeviceId", "GetMMHandle", "GetLineId", "SetLineId"]

    /**
     * 
     * @param {Pointer<Integer>} puDeviceId 
     * @returns {HRESULT} 
     */
    GetDeviceId(puDeviceId) {
        puDeviceIdMarshal := puDeviceId is VarRef ? "uint*" : "ptr"

        result := ComCall(26, this, puDeviceIdMarshal, puDeviceId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uDeviceId 
     * @returns {HRESULT} 
     */
    SetDeviceId(uDeviceId) {
        result := ComCall(27, this, "uint", uDeviceId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} pHandle 
     * @returns {HRESULT} 
     */
    GetMMHandle(pHandle) {
        pHandleMarshal := pHandle is VarRef ? "ptr*" : "ptr"

        result := ComCall(28, this, pHandleMarshal, pHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} puLineId 
     * @returns {HRESULT} 
     */
    GetLineId(puLineId) {
        puLineIdMarshal := puLineId is VarRef ? "uint*" : "ptr"

        result := ComCall(29, this, puLineIdMarshal, puLineId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uLineId 
     * @returns {HRESULT} 
     */
    SetLineId(uLineId) {
        result := ComCall(30, this, "uint", uLineId, "HRESULT")
        return result
    }
}
