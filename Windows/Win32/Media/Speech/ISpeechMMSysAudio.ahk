#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpeechAudio.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechMMSysAudio extends ISpeechAudio{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechMMSysAudio
     * @type {Guid}
     */
    static IID => Guid("{3c76af6d-1fd7-4831-81d1-3b71d5a13c44}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 21

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceId", "put_DeviceId", "get_LineId", "put_LineId", "get_MMHandle"]

    /**
     * 
     * @param {Pointer<Integer>} DeviceId 
     * @returns {HRESULT} 
     */
    get_DeviceId(DeviceId) {
        result := ComCall(21, this, "int*", DeviceId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} DeviceId 
     * @returns {HRESULT} 
     */
    put_DeviceId(DeviceId) {
        result := ComCall(22, this, "int", DeviceId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} LineId 
     * @returns {HRESULT} 
     */
    get_LineId(LineId) {
        result := ComCall(23, this, "int*", LineId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} LineId 
     * @returns {HRESULT} 
     */
    put_LineId(LineId) {
        result := ComCall(24, this, "int", LineId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Handle 
     * @returns {HRESULT} 
     */
    get_MMHandle(Handle) {
        result := ComCall(25, this, "int*", Handle, "HRESULT")
        return result
    }
}
