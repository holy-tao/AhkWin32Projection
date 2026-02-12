#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IManipulationPivot.ahk
#Include .\IManipulationPivotFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Specifies how a rotation occurs with one point of user input.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationpivot
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class ManipulationPivot extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IManipulationPivot

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IManipulationPivot.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [ManipulationPivot](manipulationpivot.md) class with the specified center and radius values.
     * @param {POINT} center The center point of the pivot.
     * @param {Float} radius The pivot radius.
     * @returns {ManipulationPivot} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationpivot.#ctor
     */
    static CreateInstanceWithCenterAndRadius(center, radius) {
        if (!ManipulationPivot.HasProp("__IManipulationPivotFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.ManipulationPivot")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IManipulationPivotFactory.IID)
            ManipulationPivot.__IManipulationPivotFactory := IManipulationPivotFactory(factoryPtr)
        }

        return ManipulationPivot.__IManipulationPivotFactory.CreateInstanceWithCenterAndRadius(center, radius)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the center point for rotation manipulations.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationpivot.center
     * @type {POINT} 
     */
    Center {
        get => this.get_Center()
        set => this.put_Center(value)
    }

    /**
     * Gets or sets the effective radius of rotation for rotation manipulations.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationpivot.radius
     * @type {Float} 
     */
    Radius {
        get => this.get_Radius()
        set => this.put_Radius(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ManipulationPivot](manipulationpivot.md) class with no initial values.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.ManipulationPivot")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Center() {
        if (!this.HasProp("__IManipulationPivot")) {
            if ((queryResult := this.QueryInterface(IManipulationPivot.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationPivot := IManipulationPivot(outPtr)
        }

        return this.__IManipulationPivot.get_Center()
    }

    /**
     * 
     * @param {POINT} value 
     * @returns {HRESULT} 
     */
    put_Center(value) {
        if (!this.HasProp("__IManipulationPivot")) {
            if ((queryResult := this.QueryInterface(IManipulationPivot.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationPivot := IManipulationPivot(outPtr)
        }

        return this.__IManipulationPivot.put_Center(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Radius() {
        if (!this.HasProp("__IManipulationPivot")) {
            if ((queryResult := this.QueryInterface(IManipulationPivot.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationPivot := IManipulationPivot(outPtr)
        }

        return this.__IManipulationPivot.get_Radius()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Radius(value) {
        if (!this.HasProp("__IManipulationPivot")) {
            if ((queryResult := this.QueryInterface(IManipulationPivot.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationPivot := IManipulationPivot(outPtr)
        }

        return this.__IManipulationPivot.put_Radius(value)
    }

;@endregion Instance Methods
}
