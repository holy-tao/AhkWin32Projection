#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.SpeechSynthesis
 * @version WindowsRuntime 1.4
 */
class ISpeechSynthesizerOptions2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechSynthesizerOptions2
     * @type {Guid}
     */
    static IID => Guid("{1cbef60e-119c-4bed-b118-d250c3a25793}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AudioVolume", "put_AudioVolume", "get_SpeakingRate", "put_SpeakingRate", "get_AudioPitch", "put_AudioPitch"]

    /**
     * @type {Float} 
     */
    AudioVolume {
        get => this.get_AudioVolume()
        set => this.put_AudioVolume(value)
    }

    /**
     * @type {Float} 
     */
    SpeakingRate {
        get => this.get_SpeakingRate()
        set => this.put_SpeakingRate(value)
    }

    /**
     * @type {Float} 
     */
    AudioPitch {
        get => this.get_AudioPitch()
        set => this.put_AudioPitch(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_AudioVolume() {
        result := ComCall(6, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_AudioVolume(value) {
        result := ComCall(7, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_SpeakingRate() {
        result := ComCall(8, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_SpeakingRate(value) {
        result := ComCall(9, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_AudioPitch() {
        result := ComCall(10, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_AudioPitch(value) {
        result := ComCall(11, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
