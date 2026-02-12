#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INumberRounder.ahk
#Include .\IIncrementNumberRounder.ahk
#Include ..\..\..\Guid.ahk

/**
 * Rounds numbers to a specified increment.
  * 
  * For example, this class can be used to round a number to the nearest 0.01.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.incrementnumberrounder
 * @namespace Windows.Globalization.NumberFormatting
 * @version WindowsRuntime 1.4
 */
class IncrementNumberRounder extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INumberRounder

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INumberRounder.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the rounding algorithm used when incrementing.
     * @remarks
     * This property is initialized to a default value of [RoundingAlgorithm.RoundHalfUp](roundingalgorithm.md).
     * 
     * > [!NOTE]
     * > [RoundingAlgorithm.None](roundingalgorithm.md) is not a valid value.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.incrementnumberrounder.roundingalgorithm
     * @type {Integer} 
     */
    RoundingAlgorithm {
        get => this.get_RoundingAlgorithm()
        set => this.put_RoundingAlgorithm(value)
    }

    /**
     * Gets or sets the increment this [IncrementNumberRounder](incrementnumberrounder.md) object uses for rounding.
     * @remarks
     * This property can be one of the following:
     * 
     * + An integer greater than 0.
     * + A fraction of the form 1/n, where n is an integer between 2 and 10000000000, inclusive.
     * + 1.0e-11, 1.0e-12, 1.0e-13, 1.0e-14, 1.0e-15, 1.0e-16, 1.0e-17, 1.0e-18, 1.0e-19, or 1.0e-20.
     * 
     * 
     * This property is initialized to a default value of 1.
     * 
     * When rounding is performed, the result is produced in this manner:
     * 1. Divide the input by the Increment.
     * 1. Round the result to an integer using the rounding strategy of [RoundingAlgorithm](incrementnumberrounder_roundingalgorithm.md).
     * 1. Multiply the result by the Increment.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.incrementnumberrounder.increment
     * @type {Float} 
     */
    Increment {
        get => this.get_Increment()
        set => this.put_Increment(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an [IncrementNumberRounder](incrementnumberrounder.md) object.
     * 
     * This constructor initializes [RoundingAlgorithm](incrementnumberrounder_roundingalgorithm.md) to a default value of [RoundingAlgorithm.RoundHalfUp](roundingalgorithm.md), and [Increment](incrementnumberrounder_increment.md) to 1.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumberFormatting.IncrementNumberRounder")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Rounds an **Int32** number to the specified increment.
     * @remarks
     * The rounding strategy is based on the values of [Increment](incrementnumberrounder_increment.md) and [RoundingAlgorithm](incrementnumberrounder_roundingalgorithm.md).
     * @param {Integer} value The **Int32** value to be rounded.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.incrementnumberrounder.roundint32
     */
    RoundInt32(value) {
        if (!this.HasProp("__INumberRounder")) {
            if ((queryResult := this.QueryInterface(INumberRounder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumberRounder := INumberRounder(outPtr)
        }

        return this.__INumberRounder.RoundInt32(value)
    }

    /**
     * Rounds a **UInt32** number to the specified increment.
     * @remarks
     * The rounding strategy is based on the values of [Increment](incrementnumberrounder_increment.md) and [RoundingAlgorithm](incrementnumberrounder_roundingalgorithm.md).
     * @param {Integer} value The **UInt32** value to be rounded.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.incrementnumberrounder.rounduint32
     */
    RoundUInt32(value) {
        if (!this.HasProp("__INumberRounder")) {
            if ((queryResult := this.QueryInterface(INumberRounder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumberRounder := INumberRounder(outPtr)
        }

        return this.__INumberRounder.RoundUInt32(value)
    }

    /**
     * Rounds an **Int64** number to the specified increment.
     * @remarks
     * The rounding strategy is based on the values of [Increment](incrementnumberrounder_increment.md) and [RoundingAlgorithm](incrementnumberrounder_roundingalgorithm.md).
     * @param {Integer} value The **Int64** value to be rounded.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.incrementnumberrounder.roundint64
     */
    RoundInt64(value) {
        if (!this.HasProp("__INumberRounder")) {
            if ((queryResult := this.QueryInterface(INumberRounder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumberRounder := INumberRounder(outPtr)
        }

        return this.__INumberRounder.RoundInt64(value)
    }

    /**
     * Rounds a **UInt64** number to the specified increment.
     * @remarks
     * The rounding strategy is based on the values of [Increment](incrementnumberrounder_increment.md) and [RoundingAlgorithm](incrementnumberrounder_roundingalgorithm.md).
     * @param {Integer} value The **UInt64** value to be rounded.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.incrementnumberrounder.rounduint64
     */
    RoundUInt64(value) {
        if (!this.HasProp("__INumberRounder")) {
            if ((queryResult := this.QueryInterface(INumberRounder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumberRounder := INumberRounder(outPtr)
        }

        return this.__INumberRounder.RoundUInt64(value)
    }

    /**
     * Rounds a **Single** number to the specified increment.
     * @remarks
     * The rounding strategy is based on the values of [Increment](incrementnumberrounder_increment.md) and [RoundingAlgorithm](incrementnumberrounder_roundingalgorithm.md).
     * 
     * > [!NOTE]
     * > This method is precise only within the limits of the **Single** data type, or approximately 7 digits.
     * @param {Float} value The **Single** value to be rounded.
     * @returns {Float} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.incrementnumberrounder.roundsingle
     */
    RoundSingle(value) {
        if (!this.HasProp("__INumberRounder")) {
            if ((queryResult := this.QueryInterface(INumberRounder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumberRounder := INumberRounder(outPtr)
        }

        return this.__INumberRounder.RoundSingle(value)
    }

    /**
     * Rounds a **Double** number to the specified increment.
     * @remarks
     * The rounding strategy is based on the values of [Increment](incrementnumberrounder_increment.md) and [RoundingAlgorithm](incrementnumberrounder_roundingalgorithm.md).
     * 
     * > [!NOTE]
     * > This method is precise only within the limits of the [Double](/dotnet/api/system.double?view=dotnet-uwp-10.0&preserve-view=true) data type, or approximately 15 digits.
     * @param {Float} value The **Double** value to be rounded.
     * @returns {Float} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.incrementnumberrounder.rounddouble
     */
    RoundDouble(value) {
        if (!this.HasProp("__INumberRounder")) {
            if ((queryResult := this.QueryInterface(INumberRounder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INumberRounder := INumberRounder(outPtr)
        }

        return this.__INumberRounder.RoundDouble(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RoundingAlgorithm() {
        if (!this.HasProp("__IIncrementNumberRounder")) {
            if ((queryResult := this.QueryInterface(IIncrementNumberRounder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIncrementNumberRounder := IIncrementNumberRounder(outPtr)
        }

        return this.__IIncrementNumberRounder.get_RoundingAlgorithm()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_RoundingAlgorithm(value) {
        if (!this.HasProp("__IIncrementNumberRounder")) {
            if ((queryResult := this.QueryInterface(IIncrementNumberRounder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIncrementNumberRounder := IIncrementNumberRounder(outPtr)
        }

        return this.__IIncrementNumberRounder.put_RoundingAlgorithm(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Increment() {
        if (!this.HasProp("__IIncrementNumberRounder")) {
            if ((queryResult := this.QueryInterface(IIncrementNumberRounder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIncrementNumberRounder := IIncrementNumberRounder(outPtr)
        }

        return this.__IIncrementNumberRounder.get_Increment()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Increment(value) {
        if (!this.HasProp("__IIncrementNumberRounder")) {
            if ((queryResult := this.QueryInterface(IIncrementNumberRounder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIncrementNumberRounder := IIncrementNumberRounder(outPtr)
        }

        return this.__IIncrementNumberRounder.put_Increment(value)
    }

;@endregion Instance Methods
}
