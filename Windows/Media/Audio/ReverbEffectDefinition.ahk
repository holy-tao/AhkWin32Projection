#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IReverbEffectDefinition.ahk
#Include ..\Effects\IAudioEffectDefinition.ahk
#Include .\IReverbEffectDefinitionFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a reverberation effect definition supported by the audio graph.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.reverbeffectdefinition
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class ReverbEffectDefinition extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IReverbEffectDefinition

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IReverbEffectDefinition.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [ReverbffectDefinition](reverbeffectdefinition.md) class.
     * @param {AudioGraph} audioGraph_ The [AudioGraph](audiograph.md) with which the effect will be used. Using effects outside of the audio graph it was created with is not supported.
     * @returns {ReverbEffectDefinition} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.reverbeffectdefinition.#ctor
     */
    static Create(audioGraph_) {
        if (!ReverbEffectDefinition.HasProp("__IReverbEffectDefinitionFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Audio.ReverbEffectDefinition")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IReverbEffectDefinitionFactory.IID)
            ReverbEffectDefinition.__IReverbEffectDefinitionFactory := IReverbEffectDefinitionFactory(factoryPtr)
        }

        return ReverbEffectDefinition.__IReverbEffectDefinitionFactory.Create(audioGraph_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the wet-dry audio voice mix for the reverberation effect definition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.reverbeffectdefinition.wetdrymix
     * @type {Float} 
     */
    WetDryMix {
        get => this.get_WetDryMix()
        set => this.put_WetDryMix(value)
    }

    /**
     * Gets or sets the reflections delay included in the reverberation effect definition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.reverbeffectdefinition.reflectionsdelay
     * @type {Integer} 
     */
    ReflectionsDelay {
        get => this.get_ReflectionsDelay()
        set => this.put_ReflectionsDelay(value)
    }

    /**
     * Gets or sets the reverberation delay included in the reverberation effect definition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.reverbeffectdefinition.reverbdelay
     * @type {Integer} 
     */
    ReverbDelay {
        get => this.get_ReverbDelay()
        set => this.put_ReverbDelay(value)
    }

    /**
     * Gets or sets the rear delay included in the reverberation effect definition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.reverbeffectdefinition.reardelay
     * @type {Integer} 
     */
    RearDelay {
        get => this.get_RearDelay()
        set => this.put_RearDelay(value)
    }

    /**
     * Gets or sets the position left included in the reverberation effect definition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.reverbeffectdefinition.positionleft
     * @type {Integer} 
     */
    PositionLeft {
        get => this.get_PositionLeft()
        set => this.put_PositionLeft(value)
    }

    /**
     * Gets or sets the position right included in the reverberation effect definition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.reverbeffectdefinition.positionright
     * @type {Integer} 
     */
    PositionRight {
        get => this.get_PositionRight()
        set => this.put_PositionRight(value)
    }

    /**
     * Gets or sets the matrix position left included in the reverberation effect definition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.reverbeffectdefinition.positionmatrixleft
     * @type {Integer} 
     */
    PositionMatrixLeft {
        get => this.get_PositionMatrixLeft()
        set => this.put_PositionMatrixLeft(value)
    }

    /**
     * Gets or sets the matrix position right included in the reverberation effect definition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.reverbeffectdefinition.positionmatrixright
     * @type {Integer} 
     */
    PositionMatrixRight {
        get => this.get_PositionMatrixRight()
        set => this.put_PositionMatrixRight(value)
    }

    /**
     * Gets or sets the early diffusion value for the reverberation effect definition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.reverbeffectdefinition.earlydiffusion
     * @type {Integer} 
     */
    EarlyDiffusion {
        get => this.get_EarlyDiffusion()
        set => this.put_EarlyDiffusion(value)
    }

    /**
     * Gets or sets the late diffusion included in the reverberation effect definition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.reverbeffectdefinition.latediffusion
     * @type {Integer} 
     */
    LateDiffusion {
        get => this.get_LateDiffusion()
        set => this.put_LateDiffusion(value)
    }

    /**
     * Gets or sets the low equalization gain included in the reverberation effect definition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.reverbeffectdefinition.loweqgain
     * @type {Integer} 
     */
    LowEQGain {
        get => this.get_LowEQGain()
        set => this.put_LowEQGain(value)
    }

    /**
     * Gets or sets the low equalization cutoff included in the reverberation effect definition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.reverbeffectdefinition.loweqcutoff
     * @type {Integer} 
     */
    LowEQCutoff {
        get => this.get_LowEQCutoff()
        set => this.put_LowEQCutoff(value)
    }

    /**
     * Gets or sets the high equalization gain included in the reverberation effect definition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.reverbeffectdefinition.higheqgain
     * @type {Integer} 
     */
    HighEQGain {
        get => this.get_HighEQGain()
        set => this.put_HighEQGain(value)
    }

    /**
     * Gets or sets the high equalization cutoff included in the reverberation effect definition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.reverbeffectdefinition.higheqcutoff
     * @type {Integer} 
     */
    HighEQCutoff {
        get => this.get_HighEQCutoff()
        set => this.put_HighEQCutoff(value)
    }

    /**
     * Gets or sets the room filter frequency included in the reverberation effect definition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.reverbeffectdefinition.roomfilterfreq
     * @type {Float} 
     */
    RoomFilterFreq {
        get => this.get_RoomFilterFreq()
        set => this.put_RoomFilterFreq(value)
    }

    /**
     * Gets or sets the main room filter included in the reverberation effect definition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.reverbeffectdefinition.roomfiltermain
     * @type {Float} 
     */
    RoomFilterMain {
        get => this.get_RoomFilterMain()
        set => this.put_RoomFilterMain(value)
    }

    /**
     * Gets or sets the room filter high frequency included in the reverberation effect definition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.reverbeffectdefinition.roomfilterhf
     * @type {Float} 
     */
    RoomFilterHF {
        get => this.get_RoomFilterHF()
        set => this.put_RoomFilterHF(value)
    }

    /**
     * Gets or sets the reflections gain included in the reverberation effect definition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.reverbeffectdefinition.reflectionsgain
     * @type {Float} 
     */
    ReflectionsGain {
        get => this.get_ReflectionsGain()
        set => this.put_ReflectionsGain(value)
    }

    /**
     * Gets or sets the reverberation gain included in the reverberation effect definition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.reverbeffectdefinition.reverbgain
     * @type {Float} 
     */
    ReverbGain {
        get => this.get_ReverbGain()
        set => this.put_ReverbGain(value)
    }

    /**
     * Gets or sets the decay time supported by the reverberation effect definition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.reverbeffectdefinition.decaytime
     * @type {Float} 
     */
    DecayTime {
        get => this.get_DecayTime()
        set => this.put_DecayTime(value)
    }

    /**
     * Gets or sets the density included in the reverberation effect definition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.reverbeffectdefinition.density
     * @type {Float} 
     */
    Density {
        get => this.get_Density()
        set => this.put_Density(value)
    }

    /**
     * Gets or sets the room size included in the reverberation effect definition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.reverbeffectdefinition.roomsize
     * @type {Float} 
     */
    RoomSize {
        get => this.get_RoomSize()
        set => this.put_RoomSize(value)
    }

    /**
     * Gets or sets a value indicating if the reverberation effect disables late fields.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.reverbeffectdefinition.disablelatefield
     * @type {Boolean} 
     */
    DisableLateField {
        get => this.get_DisableLateField()
        set => this.put_DisableLateField(value)
    }

    /**
     * Gets the activatable class ID for the reverberation effect definition object.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.reverbeffectdefinition.activatableclassid
     * @type {HSTRING} 
     */
    ActivatableClassId {
        get => this.get_ActivatableClassId()
    }

    /**
     * Gets the properties supported by the reverberation effect definition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.reverbeffectdefinition.properties
     * @type {IPropertySet} 
     */
    Properties {
        get => this.get_Properties()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_WetDryMix(value) {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.put_WetDryMix(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_WetDryMix() {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.get_WetDryMix()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReflectionsDelay(value) {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.put_ReflectionsDelay(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReflectionsDelay() {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.get_ReflectionsDelay()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReverbDelay(value) {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.put_ReverbDelay(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReverbDelay() {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.get_ReverbDelay()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_RearDelay(value) {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.put_RearDelay(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RearDelay() {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.get_RearDelay()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PositionLeft(value) {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.put_PositionLeft(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PositionLeft() {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.get_PositionLeft()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PositionRight(value) {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.put_PositionRight(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PositionRight() {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.get_PositionRight()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PositionMatrixLeft(value) {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.put_PositionMatrixLeft(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PositionMatrixLeft() {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.get_PositionMatrixLeft()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PositionMatrixRight(value) {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.put_PositionMatrixRight(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PositionMatrixRight() {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.get_PositionMatrixRight()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_EarlyDiffusion(value) {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.put_EarlyDiffusion(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EarlyDiffusion() {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.get_EarlyDiffusion()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_LateDiffusion(value) {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.put_LateDiffusion(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LateDiffusion() {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.get_LateDiffusion()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_LowEQGain(value) {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.put_LowEQGain(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LowEQGain() {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.get_LowEQGain()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_LowEQCutoff(value) {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.put_LowEQCutoff(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LowEQCutoff() {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.get_LowEQCutoff()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HighEQGain(value) {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.put_HighEQGain(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HighEQGain() {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.get_HighEQGain()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HighEQCutoff(value) {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.put_HighEQCutoff(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HighEQCutoff() {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.get_HighEQCutoff()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RoomFilterFreq(value) {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.put_RoomFilterFreq(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RoomFilterFreq() {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.get_RoomFilterFreq()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RoomFilterMain(value) {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.put_RoomFilterMain(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RoomFilterMain() {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.get_RoomFilterMain()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RoomFilterHF(value) {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.put_RoomFilterHF(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RoomFilterHF() {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.get_RoomFilterHF()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ReflectionsGain(value) {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.put_ReflectionsGain(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ReflectionsGain() {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.get_ReflectionsGain()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ReverbGain(value) {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.put_ReverbGain(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ReverbGain() {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.get_ReverbGain()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_DecayTime(value) {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.put_DecayTime(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DecayTime() {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.get_DecayTime()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Density(value) {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.put_Density(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Density() {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.get_Density()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RoomSize(value) {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.put_RoomSize(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RoomSize() {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.get_RoomSize()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_DisableLateField(value) {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.put_DisableLateField(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DisableLateField() {
        if (!this.HasProp("__IReverbEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IReverbEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IReverbEffectDefinition := IReverbEffectDefinition(outPtr)
        }

        return this.__IReverbEffectDefinition.get_DisableLateField()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ActivatableClassId() {
        if (!this.HasProp("__IAudioEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IAudioEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioEffectDefinition := IAudioEffectDefinition(outPtr)
        }

        return this.__IAudioEffectDefinition.get_ActivatableClassId()
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_Properties() {
        if (!this.HasProp("__IAudioEffectDefinition")) {
            if ((queryResult := this.QueryInterface(IAudioEffectDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioEffectDefinition := IAudioEffectDefinition(outPtr)
        }

        return this.__IAudioEffectDefinition.get_Properties()
    }

;@endregion Instance Methods
}
