#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\CompositionObject.ahk
#Include .\ICompositionConditionalValue.ahk
#Include .\ICompositionConditionalValueStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Allows conditional modification of the position and scale of a visual interaction source.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.compositionconditionalvalue
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class CompositionConditionalValue extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionConditionalValue

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionConditionalValue.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of CompositionConditionalValue.
     * @param {Compositor} compositor_ 
     * @returns {CompositionConditionalValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.compositionconditionalvalue.create
     */
    static Create(compositor_) {
        if (!CompositionConditionalValue.HasProp("__ICompositionConditionalValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.Interactions.CompositionConditionalValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositionConditionalValueStatics.IID)
            CompositionConditionalValue.__ICompositionConditionalValueStatics := ICompositionConditionalValueStatics(factoryPtr)
        }

        return CompositionConditionalValue.__ICompositionConditionalValueStatics.Create(compositor_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The condition expression that determines when to apply modifiers to the visual interaction source.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.compositionconditionalvalue.condition
     * @type {ExpressionAnimation} 
     */
    Condition {
        get => this.get_Condition()
        set => this.put_Condition(value)
    }

    /**
     * The modified input expression to be applied when the condition is true.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.compositionconditionalvalue.value
     * @type {ExpressionAnimation} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {ExpressionAnimation} 
     */
    get_Condition() {
        if (!this.HasProp("__ICompositionConditionalValue")) {
            if ((queryResult := this.QueryInterface(ICompositionConditionalValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionConditionalValue := ICompositionConditionalValue(outPtr)
        }

        return this.__ICompositionConditionalValue.get_Condition()
    }

    /**
     * 
     * @param {ExpressionAnimation} value 
     * @returns {HRESULT} 
     */
    put_Condition(value) {
        if (!this.HasProp("__ICompositionConditionalValue")) {
            if ((queryResult := this.QueryInterface(ICompositionConditionalValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionConditionalValue := ICompositionConditionalValue(outPtr)
        }

        return this.__ICompositionConditionalValue.put_Condition(value)
    }

    /**
     * 
     * @returns {ExpressionAnimation} 
     */
    get_Value() {
        if (!this.HasProp("__ICompositionConditionalValue")) {
            if ((queryResult := this.QueryInterface(ICompositionConditionalValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionConditionalValue := ICompositionConditionalValue(outPtr)
        }

        return this.__ICompositionConditionalValue.get_Value()
    }

    /**
     * 
     * @param {ExpressionAnimation} value 
     * @returns {HRESULT} 
     */
    put_Value(value) {
        if (!this.HasProp("__ICompositionConditionalValue")) {
            if ((queryResult := this.QueryInterface(ICompositionConditionalValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionConditionalValue := ICompositionConditionalValue(outPtr)
        }

        return this.__ICompositionConditionalValue.put_Value(value)
    }

;@endregion Instance Methods
}
