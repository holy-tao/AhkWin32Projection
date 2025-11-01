#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechAudioStatus extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechAudioStatus
     * @type {Guid}
     */
    static IID => Guid("{c62d9c91-7458-47f6-862d-1ef86fb0b278}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FreeBufferSpace", "get_NonBlockingIO", "get_State", "get_CurrentSeekPosition", "get_CurrentDevicePosition"]

    /**
     * 
     * @param {Pointer<Integer>} FreeBufferSpace 
     * @returns {HRESULT} 
     */
    get_FreeBufferSpace(FreeBufferSpace) {
        FreeBufferSpaceMarshal := FreeBufferSpace is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, FreeBufferSpaceMarshal, FreeBufferSpace, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} NonBlockingIO 
     * @returns {HRESULT} 
     */
    get_NonBlockingIO(NonBlockingIO) {
        NonBlockingIOMarshal := NonBlockingIO is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, NonBlockingIOMarshal, NonBlockingIO, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} State 
     * @returns {HRESULT} 
     */
    get_State(State) {
        StateMarshal := State is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, StateMarshal, State, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} CurrentSeekPosition 
     * @returns {HRESULT} 
     */
    get_CurrentSeekPosition(CurrentSeekPosition) {
        result := ComCall(10, this, "ptr", CurrentSeekPosition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} CurrentDevicePosition 
     * @returns {HRESULT} 
     */
    get_CurrentDevicePosition(CurrentDevicePosition) {
        result := ComCall(11, this, "ptr", CurrentDevicePosition, "HRESULT")
        return result
    }
}
