#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\PrepareTranscodeResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Transcoding
 * @version WindowsRuntime 1.4
 */
class IMediaTranscoder extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaTranscoder
     * @type {Guid}
     */
    static IID => Guid("{190c99d2-a0aa-4d34-86bc-eed1b12c2f5b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_TrimStartTime", "get_TrimStartTime", "put_TrimStopTime", "get_TrimStopTime", "put_AlwaysReencode", "get_AlwaysReencode", "put_HardwareAccelerationEnabled", "get_HardwareAccelerationEnabled", "AddAudioEffect", "AddAudioEffectWithSettings", "AddVideoEffect", "AddVideoEffectWithSettings", "ClearEffects", "PrepareFileTranscodeAsync", "PrepareStreamTranscodeAsync"]

    /**
     * @type {TimeSpan} 
     */
    TrimStartTime {
        get => this.get_TrimStartTime()
        set => this.put_TrimStartTime(value)
    }

    /**
     * @type {TimeSpan} 
     */
    TrimStopTime {
        get => this.get_TrimStopTime()
        set => this.put_TrimStopTime(value)
    }

    /**
     * @type {Boolean} 
     */
    AlwaysReencode {
        get => this.get_AlwaysReencode()
        set => this.put_AlwaysReencode(value)
    }

    /**
     * @type {Boolean} 
     */
    HardwareAccelerationEnabled {
        get => this.get_HardwareAccelerationEnabled()
        set => this.put_HardwareAccelerationEnabled(value)
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_TrimStartTime(value) {
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_TrimStartTime() {
        value := TimeSpan()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_TrimStopTime(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_TrimStopTime() {
        value := TimeSpan()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AlwaysReencode(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AlwaysReencode() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_HardwareAccelerationEnabled(value) {
        result := ComCall(12, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HardwareAccelerationEnabled() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} activatableClassId 
     * @returns {HRESULT} 
     */
    AddAudioEffect(activatableClassId) {
        if(activatableClassId is String) {
            pin := HSTRING.Create(activatableClassId)
            activatableClassId := pin.Value
        }
        activatableClassId := activatableClassId is Win32Handle ? NumGet(activatableClassId, "ptr") : activatableClassId

        result := ComCall(14, this, "ptr", activatableClassId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} activatableClassId 
     * @param {Boolean} effectRequired 
     * @param {IPropertySet} configuration 
     * @returns {HRESULT} 
     */
    AddAudioEffectWithSettings(activatableClassId, effectRequired, configuration) {
        if(activatableClassId is String) {
            pin := HSTRING.Create(activatableClassId)
            activatableClassId := pin.Value
        }
        activatableClassId := activatableClassId is Win32Handle ? NumGet(activatableClassId, "ptr") : activatableClassId

        result := ComCall(15, this, "ptr", activatableClassId, "int", effectRequired, "ptr", configuration, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} activatableClassId 
     * @returns {HRESULT} 
     */
    AddVideoEffect(activatableClassId) {
        if(activatableClassId is String) {
            pin := HSTRING.Create(activatableClassId)
            activatableClassId := pin.Value
        }
        activatableClassId := activatableClassId is Win32Handle ? NumGet(activatableClassId, "ptr") : activatableClassId

        result := ComCall(16, this, "ptr", activatableClassId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} activatableClassId 
     * @param {Boolean} effectRequired 
     * @param {IPropertySet} configuration 
     * @returns {HRESULT} 
     */
    AddVideoEffectWithSettings(activatableClassId, effectRequired, configuration) {
        if(activatableClassId is String) {
            pin := HSTRING.Create(activatableClassId)
            activatableClassId := pin.Value
        }
        activatableClassId := activatableClassId is Win32Handle ? NumGet(activatableClassId, "ptr") : activatableClassId

        result := ComCall(17, this, "ptr", activatableClassId, "int", effectRequired, "ptr", configuration, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearEffects() {
        result := ComCall(18, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IStorageFile} source 
     * @param {IStorageFile} destination 
     * @param {MediaEncodingProfile} profile_ 
     * @returns {IAsyncOperation<PrepareTranscodeResult>} 
     */
    PrepareFileTranscodeAsync(source, destination, profile_) {
        result := ComCall(19, this, "ptr", source, "ptr", destination, "ptr", profile_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PrepareTranscodeResult, operation)
    }

    /**
     * 
     * @param {IRandomAccessStream} source 
     * @param {IRandomAccessStream} destination 
     * @param {MediaEncodingProfile} profile_ 
     * @returns {IAsyncOperation<PrepareTranscodeResult>} 
     */
    PrepareStreamTranscodeAsync(source, destination, profile_) {
        result := ComCall(20, this, "ptr", source, "ptr", destination, "ptr", profile_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PrepareTranscodeResult, operation)
    }
}
