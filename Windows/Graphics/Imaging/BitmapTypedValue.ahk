#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBitmapTypedValue.ahk
#Include .\IBitmapTypedValueFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * A value along with an enumeration specifying its data type.
 * @remarks
 * BitmapTypedValue is immutable. In order to alter a value or data type, you must create a new object.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmaptypedvalue
 * @namespace Windows.Graphics.Imaging
 * @version WindowsRuntime 1.4
 */
class BitmapTypedValue extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBitmapTypedValue

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBitmapTypedValue.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [BitmapTypedValue](bitmaptypedvalue.md) object.
     * @param {IInspectable} value The value to store.
     * @param {Integer} type The type of the *value* parameter.
     * @returns {BitmapTypedValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmaptypedvalue.#ctor
     */
    static Create(value, type) {
        if (!BitmapTypedValue.HasProp("__IBitmapTypedValueFactory")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Imaging.BitmapTypedValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBitmapTypedValueFactory.IID)
            BitmapTypedValue.__IBitmapTypedValueFactory := IBitmapTypedValueFactory(factoryPtr)
        }

        return BitmapTypedValue.__IBitmapTypedValueFactory.Create(value, type)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the stored value.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmaptypedvalue.value
     * @type {IInspectable} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * Gets the [PropertyType](../windows.foundation/propertytype.md) of the stored value.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmaptypedvalue.type
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Value() {
        if (!this.HasProp("__IBitmapTypedValue")) {
            if ((queryResult := this.QueryInterface(IBitmapTypedValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapTypedValue := IBitmapTypedValue(outPtr)
        }

        return this.__IBitmapTypedValue.get_Value()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        if (!this.HasProp("__IBitmapTypedValue")) {
            if ((queryResult := this.QueryInterface(IBitmapTypedValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapTypedValue := IBitmapTypedValue(outPtr)
        }

        return this.__IBitmapTypedValue.get_Type()
    }

;@endregion Instance Methods
}
