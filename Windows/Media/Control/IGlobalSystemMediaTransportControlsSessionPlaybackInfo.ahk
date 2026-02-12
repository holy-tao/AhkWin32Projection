#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\GlobalSystemMediaTransportControlsSessionPlaybackControls.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Control
 * @version WindowsRuntime 1.4
 */
class IGlobalSystemMediaTransportControlsSessionPlaybackInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGlobalSystemMediaTransportControlsSessionPlaybackInfo
     * @type {Guid}
     */
    static IID => Guid("{94b4b6cf-e8ba-51ad-87a7-c10ade106127}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Controls", "get_PlaybackStatus", "get_PlaybackType", "get_AutoRepeatMode", "get_PlaybackRate", "get_IsShuffleActive"]

    /**
     * @type {GlobalSystemMediaTransportControlsSessionPlaybackControls} 
     */
    Controls {
        get => this.get_Controls()
    }

    /**
     * @type {Integer} 
     */
    PlaybackStatus {
        get => this.get_PlaybackStatus()
    }

    /**
     * @type {IReference<Integer>} 
     */
    PlaybackType {
        get => this.get_PlaybackType()
    }

    /**
     * @type {IReference<Integer>} 
     */
    AutoRepeatMode {
        get => this.get_AutoRepeatMode()
    }

    /**
     * @type {IReference<Float>} 
     */
    PlaybackRate {
        get => this.get_PlaybackRate()
    }

    /**
     * @type {IReference<Boolean>} 
     */
    IsShuffleActive {
        get => this.get_IsShuffleActive()
    }

    /**
     * 
     * @returns {GlobalSystemMediaTransportControlsSessionPlaybackControls} 
     */
    get_Controls() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GlobalSystemMediaTransportControlsSessionPlaybackControls(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PlaybackStatus() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_PlaybackType() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_AutoRepeatMode() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_PlaybackRate() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDouble(), value)
    }

    /**
     * 
     * @returns {IReference<Boolean>} 
     */
    get_IsShuffleActive() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetBoolean(), value)
    }
}
