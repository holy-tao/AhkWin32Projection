#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmartCardCryptogramPlacementStep.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains instructions for placing a cryptogram in an outgoing message.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramplacementstep
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardCryptogramPlacementStep extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmartCardCryptogramPlacementStep

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmartCardCryptogramPlacementStep.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets an optional placement step that will use this placement step's output as an input to the next specified placement step.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramplacementstep.algorithm
     * @type {Integer} 
     */
    Algorithm {
        get => this.get_Algorithm()
        set => this.put_Algorithm(value)
    }

    /**
     * Gets or sets the data that will be encrypted in this step of chaining cryptograms.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramplacementstep.sourcedata
     * @type {IBuffer} 
     */
    SourceData {
        get => this.get_SourceData()
        set => this.put_SourceData(value)
    }

    /**
     * Gets or sets the cryptogram material package name that contains the material specified.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramplacementstep.cryptogrammaterialpackagename
     * @type {HSTRING} 
     */
    CryptogramMaterialPackageName {
        get => this.get_CryptogramMaterialPackageName()
        set => this.put_CryptogramMaterialPackageName(value)
    }

    /**
     * Gets or sets the cryptogram material name to use when executing this step.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramplacementstep.cryptogrammaterialname
     * @type {HSTRING} 
     */
    CryptogramMaterialName {
        get => this.get_CryptogramMaterialName()
        set => this.put_CryptogramMaterialName(value)
    }

    /**
     * Gets or sets the offset into the target output buffer at which the generated cryptogram will be placed. Units may be either bytes or nibbles, based on the UnitsAreInNibbles flag of the [CryptogramPlacementOptions](smartcardcryptogramplacementstep_cryptogramplacementoptions.md) field.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramplacementstep.templateoffset
     * @type {Integer} 
     */
    TemplateOffset {
        get => this.get_TemplateOffset()
        set => this.put_TemplateOffset(value)
    }

    /**
     * Gets or sets the data that will be used to generate the cryptogram to be placed in the outgoing message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramplacementstep.cryptogramoffset
     * @type {Integer} 
     */
    CryptogramOffset {
        get => this.get_CryptogramOffset()
        set => this.put_CryptogramOffset(value)
    }

    /**
     * Gets or sets the length of the output to take from the offset.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramplacementstep.cryptogramlength
     * @type {Integer} 
     */
    CryptogramLength {
        get => this.get_CryptogramLength()
        set => this.put_CryptogramLength(value)
    }

    /**
     * Gets or sets the cryptogram placement options.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramplacementstep.cryptogramplacementoptions
     * @type {Integer} 
     */
    CryptogramPlacementOptions {
        get => this.get_CryptogramPlacementOptions()
        set => this.put_CryptogramPlacementOptions(value)
    }

    /**
     * Gets or sets the output of this chained step.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramplacementstep.chainedoutputstep
     * @type {SmartCardCryptogramPlacementStep} 
     */
    ChainedOutputStep {
        get => this.get_ChainedOutputStep()
        set => this.put_ChainedOutputStep(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Constructs a new [SmartCardCryptogramPlacementStep](smartcardcryptogramplacementstep.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.SmartCards.SmartCardCryptogramPlacementStep")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Algorithm() {
        if (!this.HasProp("__ISmartCardCryptogramPlacementStep")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramPlacementStep.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramPlacementStep := ISmartCardCryptogramPlacementStep(outPtr)
        }

        return this.__ISmartCardCryptogramPlacementStep.get_Algorithm()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Algorithm(value) {
        if (!this.HasProp("__ISmartCardCryptogramPlacementStep")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramPlacementStep.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramPlacementStep := ISmartCardCryptogramPlacementStep(outPtr)
        }

        return this.__ISmartCardCryptogramPlacementStep.put_Algorithm(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_SourceData() {
        if (!this.HasProp("__ISmartCardCryptogramPlacementStep")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramPlacementStep.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramPlacementStep := ISmartCardCryptogramPlacementStep(outPtr)
        }

        return this.__ISmartCardCryptogramPlacementStep.get_SourceData()
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_SourceData(value) {
        if (!this.HasProp("__ISmartCardCryptogramPlacementStep")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramPlacementStep.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramPlacementStep := ISmartCardCryptogramPlacementStep(outPtr)
        }

        return this.__ISmartCardCryptogramPlacementStep.put_SourceData(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CryptogramMaterialPackageName() {
        if (!this.HasProp("__ISmartCardCryptogramPlacementStep")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramPlacementStep.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramPlacementStep := ISmartCardCryptogramPlacementStep(outPtr)
        }

        return this.__ISmartCardCryptogramPlacementStep.get_CryptogramMaterialPackageName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CryptogramMaterialPackageName(value) {
        if (!this.HasProp("__ISmartCardCryptogramPlacementStep")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramPlacementStep.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramPlacementStep := ISmartCardCryptogramPlacementStep(outPtr)
        }

        return this.__ISmartCardCryptogramPlacementStep.put_CryptogramMaterialPackageName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CryptogramMaterialName() {
        if (!this.HasProp("__ISmartCardCryptogramPlacementStep")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramPlacementStep.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramPlacementStep := ISmartCardCryptogramPlacementStep(outPtr)
        }

        return this.__ISmartCardCryptogramPlacementStep.get_CryptogramMaterialName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CryptogramMaterialName(value) {
        if (!this.HasProp("__ISmartCardCryptogramPlacementStep")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramPlacementStep.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramPlacementStep := ISmartCardCryptogramPlacementStep(outPtr)
        }

        return this.__ISmartCardCryptogramPlacementStep.put_CryptogramMaterialName(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TemplateOffset() {
        if (!this.HasProp("__ISmartCardCryptogramPlacementStep")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramPlacementStep.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramPlacementStep := ISmartCardCryptogramPlacementStep(outPtr)
        }

        return this.__ISmartCardCryptogramPlacementStep.get_TemplateOffset()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TemplateOffset(value) {
        if (!this.HasProp("__ISmartCardCryptogramPlacementStep")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramPlacementStep.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramPlacementStep := ISmartCardCryptogramPlacementStep(outPtr)
        }

        return this.__ISmartCardCryptogramPlacementStep.put_TemplateOffset(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CryptogramOffset() {
        if (!this.HasProp("__ISmartCardCryptogramPlacementStep")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramPlacementStep.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramPlacementStep := ISmartCardCryptogramPlacementStep(outPtr)
        }

        return this.__ISmartCardCryptogramPlacementStep.get_CryptogramOffset()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CryptogramOffset(value) {
        if (!this.HasProp("__ISmartCardCryptogramPlacementStep")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramPlacementStep.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramPlacementStep := ISmartCardCryptogramPlacementStep(outPtr)
        }

        return this.__ISmartCardCryptogramPlacementStep.put_CryptogramOffset(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CryptogramLength() {
        if (!this.HasProp("__ISmartCardCryptogramPlacementStep")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramPlacementStep.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramPlacementStep := ISmartCardCryptogramPlacementStep(outPtr)
        }

        return this.__ISmartCardCryptogramPlacementStep.get_CryptogramLength()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CryptogramLength(value) {
        if (!this.HasProp("__ISmartCardCryptogramPlacementStep")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramPlacementStep.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramPlacementStep := ISmartCardCryptogramPlacementStep(outPtr)
        }

        return this.__ISmartCardCryptogramPlacementStep.put_CryptogramLength(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CryptogramPlacementOptions() {
        if (!this.HasProp("__ISmartCardCryptogramPlacementStep")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramPlacementStep.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramPlacementStep := ISmartCardCryptogramPlacementStep(outPtr)
        }

        return this.__ISmartCardCryptogramPlacementStep.get_CryptogramPlacementOptions()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CryptogramPlacementOptions(value) {
        if (!this.HasProp("__ISmartCardCryptogramPlacementStep")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramPlacementStep.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramPlacementStep := ISmartCardCryptogramPlacementStep(outPtr)
        }

        return this.__ISmartCardCryptogramPlacementStep.put_CryptogramPlacementOptions(value)
    }

    /**
     * 
     * @returns {SmartCardCryptogramPlacementStep} 
     */
    get_ChainedOutputStep() {
        if (!this.HasProp("__ISmartCardCryptogramPlacementStep")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramPlacementStep.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramPlacementStep := ISmartCardCryptogramPlacementStep(outPtr)
        }

        return this.__ISmartCardCryptogramPlacementStep.get_ChainedOutputStep()
    }

    /**
     * 
     * @param {SmartCardCryptogramPlacementStep} value 
     * @returns {HRESULT} 
     */
    put_ChainedOutputStep(value) {
        if (!this.HasProp("__ISmartCardCryptogramPlacementStep")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramPlacementStep.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramPlacementStep := ISmartCardCryptogramPlacementStep(outPtr)
        }

        return this.__ISmartCardCryptogramPlacementStep.put_ChainedOutputStep(value)
    }

;@endregion Instance Methods
}
