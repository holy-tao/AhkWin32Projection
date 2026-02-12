#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class IReverbEffectDefinition extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IReverbEffectDefinition
     * @type {Guid}
     */
    static IID => Guid("{4606aa89-f563-4d0a-8f6e-f0cddff35d84}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_WetDryMix", "get_WetDryMix", "put_ReflectionsDelay", "get_ReflectionsDelay", "put_ReverbDelay", "get_ReverbDelay", "put_RearDelay", "get_RearDelay", "put_PositionLeft", "get_PositionLeft", "put_PositionRight", "get_PositionRight", "put_PositionMatrixLeft", "get_PositionMatrixLeft", "put_PositionMatrixRight", "get_PositionMatrixRight", "put_EarlyDiffusion", "get_EarlyDiffusion", "put_LateDiffusion", "get_LateDiffusion", "put_LowEQGain", "get_LowEQGain", "put_LowEQCutoff", "get_LowEQCutoff", "put_HighEQGain", "get_HighEQGain", "put_HighEQCutoff", "get_HighEQCutoff", "put_RoomFilterFreq", "get_RoomFilterFreq", "put_RoomFilterMain", "get_RoomFilterMain", "put_RoomFilterHF", "get_RoomFilterHF", "put_ReflectionsGain", "get_ReflectionsGain", "put_ReverbGain", "get_ReverbGain", "put_DecayTime", "get_DecayTime", "put_Density", "get_Density", "put_RoomSize", "get_RoomSize", "put_DisableLateField", "get_DisableLateField"]

    /**
     * @type {Float} 
     */
    WetDryMix {
        get => this.get_WetDryMix()
        set => this.put_WetDryMix(value)
    }

    /**
     * @type {Integer} 
     */
    ReflectionsDelay {
        get => this.get_ReflectionsDelay()
        set => this.put_ReflectionsDelay(value)
    }

    /**
     * @type {Integer} 
     */
    ReverbDelay {
        get => this.get_ReverbDelay()
        set => this.put_ReverbDelay(value)
    }

    /**
     * @type {Integer} 
     */
    RearDelay {
        get => this.get_RearDelay()
        set => this.put_RearDelay(value)
    }

    /**
     * @type {Integer} 
     */
    PositionLeft {
        get => this.get_PositionLeft()
        set => this.put_PositionLeft(value)
    }

    /**
     * @type {Integer} 
     */
    PositionRight {
        get => this.get_PositionRight()
        set => this.put_PositionRight(value)
    }

    /**
     * @type {Integer} 
     */
    PositionMatrixLeft {
        get => this.get_PositionMatrixLeft()
        set => this.put_PositionMatrixLeft(value)
    }

    /**
     * @type {Integer} 
     */
    PositionMatrixRight {
        get => this.get_PositionMatrixRight()
        set => this.put_PositionMatrixRight(value)
    }

    /**
     * @type {Integer} 
     */
    EarlyDiffusion {
        get => this.get_EarlyDiffusion()
        set => this.put_EarlyDiffusion(value)
    }

    /**
     * @type {Integer} 
     */
    LateDiffusion {
        get => this.get_LateDiffusion()
        set => this.put_LateDiffusion(value)
    }

    /**
     * @type {Integer} 
     */
    LowEQGain {
        get => this.get_LowEQGain()
        set => this.put_LowEQGain(value)
    }

    /**
     * @type {Integer} 
     */
    LowEQCutoff {
        get => this.get_LowEQCutoff()
        set => this.put_LowEQCutoff(value)
    }

    /**
     * @type {Integer} 
     */
    HighEQGain {
        get => this.get_HighEQGain()
        set => this.put_HighEQGain(value)
    }

    /**
     * @type {Integer} 
     */
    HighEQCutoff {
        get => this.get_HighEQCutoff()
        set => this.put_HighEQCutoff(value)
    }

    /**
     * @type {Float} 
     */
    RoomFilterFreq {
        get => this.get_RoomFilterFreq()
        set => this.put_RoomFilterFreq(value)
    }

    /**
     * @type {Float} 
     */
    RoomFilterMain {
        get => this.get_RoomFilterMain()
        set => this.put_RoomFilterMain(value)
    }

    /**
     * @type {Float} 
     */
    RoomFilterHF {
        get => this.get_RoomFilterHF()
        set => this.put_RoomFilterHF(value)
    }

    /**
     * @type {Float} 
     */
    ReflectionsGain {
        get => this.get_ReflectionsGain()
        set => this.put_ReflectionsGain(value)
    }

    /**
     * @type {Float} 
     */
    ReverbGain {
        get => this.get_ReverbGain()
        set => this.put_ReverbGain(value)
    }

    /**
     * @type {Float} 
     */
    DecayTime {
        get => this.get_DecayTime()
        set => this.put_DecayTime(value)
    }

    /**
     * @type {Float} 
     */
    Density {
        get => this.get_Density()
        set => this.put_Density(value)
    }

    /**
     * @type {Float} 
     */
    RoomSize {
        get => this.get_RoomSize()
        set => this.put_RoomSize(value)
    }

    /**
     * @type {Boolean} 
     */
    DisableLateField {
        get => this.get_DisableLateField()
        set => this.put_DisableLateField(value)
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_WetDryMix(value) {
        result := ComCall(6, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_WetDryMix() {
        result := ComCall(7, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReflectionsDelay(value) {
        result := ComCall(8, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReflectionsDelay() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReverbDelay(value) {
        result := ComCall(10, this, "char", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReverbDelay() {
        result := ComCall(11, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_RearDelay(value) {
        result := ComCall(12, this, "char", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RearDelay() {
        result := ComCall(13, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PositionLeft(value) {
        result := ComCall(14, this, "char", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PositionLeft() {
        result := ComCall(15, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PositionRight(value) {
        result := ComCall(16, this, "char", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PositionRight() {
        result := ComCall(17, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PositionMatrixLeft(value) {
        result := ComCall(18, this, "char", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PositionMatrixLeft() {
        result := ComCall(19, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PositionMatrixRight(value) {
        result := ComCall(20, this, "char", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PositionMatrixRight() {
        result := ComCall(21, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_EarlyDiffusion(value) {
        result := ComCall(22, this, "char", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EarlyDiffusion() {
        result := ComCall(23, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_LateDiffusion(value) {
        result := ComCall(24, this, "char", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LateDiffusion() {
        result := ComCall(25, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_LowEQGain(value) {
        result := ComCall(26, this, "char", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LowEQGain() {
        result := ComCall(27, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_LowEQCutoff(value) {
        result := ComCall(28, this, "char", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LowEQCutoff() {
        result := ComCall(29, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HighEQGain(value) {
        result := ComCall(30, this, "char", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HighEQGain() {
        result := ComCall(31, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HighEQCutoff(value) {
        result := ComCall(32, this, "char", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HighEQCutoff() {
        result := ComCall(33, this, "char*", &value := 0, "int")
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
    put_RoomFilterFreq(value) {
        result := ComCall(34, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RoomFilterFreq() {
        result := ComCall(35, this, "double*", &value := 0, "int")
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
    put_RoomFilterMain(value) {
        result := ComCall(36, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RoomFilterMain() {
        result := ComCall(37, this, "double*", &value := 0, "int")
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
    put_RoomFilterHF(value) {
        result := ComCall(38, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RoomFilterHF() {
        result := ComCall(39, this, "double*", &value := 0, "int")
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
    put_ReflectionsGain(value) {
        result := ComCall(40, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ReflectionsGain() {
        result := ComCall(41, this, "double*", &value := 0, "int")
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
    put_ReverbGain(value) {
        result := ComCall(42, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ReverbGain() {
        result := ComCall(43, this, "double*", &value := 0, "int")
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
    put_DecayTime(value) {
        result := ComCall(44, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DecayTime() {
        result := ComCall(45, this, "double*", &value := 0, "int")
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
    put_Density(value) {
        result := ComCall(46, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Density() {
        result := ComCall(47, this, "double*", &value := 0, "int")
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
    put_RoomSize(value) {
        result := ComCall(48, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RoomSize() {
        result := ComCall(49, this, "double*", &value := 0, "int")
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
    put_DisableLateField(value) {
        result := ComCall(50, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DisableLateField() {
        result := ComCall(51, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
