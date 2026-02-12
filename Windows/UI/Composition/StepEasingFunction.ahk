#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionEasingFunction.ahk
#Include .\IStepEasingFunction.ahk
#Include ..\..\..\Guid.ahk

/**
 * A step function for interpolating between animation key frames that advances animations in increments like steps which can be can be defined. Behaviors for initial and final steps can be customized.
 * @remarks
 * The step easing function gives more flexibility for animations to advance in increments. Increments are defined using [StepCount](stepeasingfunction_stepcount.md) property. Steps can be customized using [InitialStep](stepeasingfunction_initialstep.md), and [FinalStep](stepeasingfunction_finalstep.md). Behavior for initial step can be customized using [IsInitialStepSingleFrame](stepeasingfunction_isinitialstepsingleframe.md) and final step using [IsFinalStepSingleFrame](stepeasingfunction_isfinalstepsingleframe.md).
 * 
 * To create a new instance of `StepEasingFunction`, call one of these methods:
 * 
 * - [CompositionEasingFunction.CreateStepEasingFunction(owner, stepCount)](compositioneasingfunction_createstepeasingfunction_1100018177.md)
 * - [CompositionEasingFunction.CreateStepEasingFunction(owner)](compositioneasingfunction_createstepeasingfunction_1998521201.md)
 * - [Compositor.CreateStepEasingFunction(stepCount)](compositor_createstepeasingfunction_694397864.md)
 * - [Compositor.CreateStepEasingFunction()](compositor_createstepeasingfunction_1306242288.md)
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.stepeasingfunction
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class StepEasingFunction extends CompositionEasingFunction {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStepEasingFunction

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStepEasingFunction.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The step to end at.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.stepeasingfunction.finalstep
     * @type {Integer} 
     */
    FinalStep {
        get => this.get_FinalStep()
        set => this.put_FinalStep(value)
    }

    /**
     * The step to start at.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.stepeasingfunction.initialstep
     * @type {Integer} 
     */
    InitialStep {
        get => this.get_InitialStep()
        set => this.put_InitialStep(value)
    }

    /**
     * Indicates whether the final step should last the smallest possible duration.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.stepeasingfunction.isfinalstepsingleframe
     * @type {Boolean} 
     */
    IsFinalStepSingleFrame {
        get => this.get_IsFinalStepSingleFrame()
        set => this.put_IsFinalStepSingleFrame(value)
    }

    /**
     * Indicates whether the initial step should last the smallest possible duration.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.stepeasingfunction.isinitialstepsingleframe
     * @type {Boolean} 
     */
    IsInitialStepSingleFrame {
        get => this.get_IsInitialStepSingleFrame()
        set => this.put_IsInitialStepSingleFrame(value)
    }

    /**
     * The number of steps between the starting value and the end value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.stepeasingfunction.stepcount
     * @type {Integer} 
     */
    StepCount {
        get => this.get_StepCount()
        set => this.put_StepCount(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FinalStep() {
        if (!this.HasProp("__IStepEasingFunction")) {
            if ((queryResult := this.QueryInterface(IStepEasingFunction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStepEasingFunction := IStepEasingFunction(outPtr)
        }

        return this.__IStepEasingFunction.get_FinalStep()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FinalStep(value) {
        if (!this.HasProp("__IStepEasingFunction")) {
            if ((queryResult := this.QueryInterface(IStepEasingFunction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStepEasingFunction := IStepEasingFunction(outPtr)
        }

        return this.__IStepEasingFunction.put_FinalStep(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InitialStep() {
        if (!this.HasProp("__IStepEasingFunction")) {
            if ((queryResult := this.QueryInterface(IStepEasingFunction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStepEasingFunction := IStepEasingFunction(outPtr)
        }

        return this.__IStepEasingFunction.get_InitialStep()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_InitialStep(value) {
        if (!this.HasProp("__IStepEasingFunction")) {
            if ((queryResult := this.QueryInterface(IStepEasingFunction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStepEasingFunction := IStepEasingFunction(outPtr)
        }

        return this.__IStepEasingFunction.put_InitialStep(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFinalStepSingleFrame() {
        if (!this.HasProp("__IStepEasingFunction")) {
            if ((queryResult := this.QueryInterface(IStepEasingFunction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStepEasingFunction := IStepEasingFunction(outPtr)
        }

        return this.__IStepEasingFunction.get_IsFinalStepSingleFrame()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsFinalStepSingleFrame(value) {
        if (!this.HasProp("__IStepEasingFunction")) {
            if ((queryResult := this.QueryInterface(IStepEasingFunction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStepEasingFunction := IStepEasingFunction(outPtr)
        }

        return this.__IStepEasingFunction.put_IsFinalStepSingleFrame(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInitialStepSingleFrame() {
        if (!this.HasProp("__IStepEasingFunction")) {
            if ((queryResult := this.QueryInterface(IStepEasingFunction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStepEasingFunction := IStepEasingFunction(outPtr)
        }

        return this.__IStepEasingFunction.get_IsInitialStepSingleFrame()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsInitialStepSingleFrame(value) {
        if (!this.HasProp("__IStepEasingFunction")) {
            if ((queryResult := this.QueryInterface(IStepEasingFunction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStepEasingFunction := IStepEasingFunction(outPtr)
        }

        return this.__IStepEasingFunction.put_IsInitialStepSingleFrame(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StepCount() {
        if (!this.HasProp("__IStepEasingFunction")) {
            if ((queryResult := this.QueryInterface(IStepEasingFunction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStepEasingFunction := IStepEasingFunction(outPtr)
        }

        return this.__IStepEasingFunction.get_StepCount()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_StepCount(value) {
        if (!this.HasProp("__IStepEasingFunction")) {
            if ((queryResult := this.QueryInterface(IStepEasingFunction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStepEasingFunction := IStepEasingFunction(outPtr)
        }

        return this.__IStepEasingFunction.put_StepCount(value)
    }

;@endregion Instance Methods
}
