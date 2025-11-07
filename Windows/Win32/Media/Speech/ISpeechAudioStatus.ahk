#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
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
     * @returns {Integer} 
     */
    get_FreeBufferSpace() {
        result := ComCall(7, this, "int*", &FreeBufferSpace := 0, "HRESULT")
        return FreeBufferSpace
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NonBlockingIO() {
        result := ComCall(8, this, "int*", &NonBlockingIO := 0, "HRESULT")
        return NonBlockingIO
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        result := ComCall(9, this, "int*", &State := 0, "HRESULT")
        return State
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_CurrentSeekPosition() {
        CurrentSeekPosition := VARIANT()
        result := ComCall(10, this, "ptr", CurrentSeekPosition, "HRESULT")
        return CurrentSeekPosition
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_CurrentDevicePosition() {
        CurrentDevicePosition := VARIANT()
        result := ComCall(11, this, "ptr", CurrentDevicePosition, "HRESULT")
        return CurrentDevicePosition
    }
}
