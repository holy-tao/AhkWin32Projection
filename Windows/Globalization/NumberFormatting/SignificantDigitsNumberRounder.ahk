#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INumberRounder.ahk
#Include .\ISignificantDigitsNumberRounder.ahk
#Include ..\..\..\Guid.ahk

/**
 * Rounds numbers to a specified number of significant digits.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.significantdigitsnumberrounder
 * @namespace Windows.Globalization.NumberFormatting
 * @version WindowsRuntime 1.4
 */
class SignificantDigitsNumberRounder extends IInspectable {
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
     * Gets or sets the rounding strategy value for this [SignificantDigitsNumberRounder](significantdigitsnumberrounder.md) object.
     * @remarks
     * This property is initialized to a default value of [RoundingAlgorithm.RoundHalfUp](roundingalgorithm.md).
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.significantdigitsnumberrounder.roundingalgorithm
     * @type {Integer} 
     */
    RoundingAlgorithm {
        get => this.get_RoundingAlgorithm()
        set => this.put_RoundingAlgorithm(value)
    }

    /**
     * Gets or sets the number of significant digits this [SignificantDigitsNumberRounder](significantdigitsnumberrounder.md) object uses for rounding.
     * @remarks
     * This property is initialized to a default value of 1.
     * 
     * If this property is 0, no rounding is performed by the [SignificantDigitsNumberRounder](significantdigitsnumberrounder.md) object.
     * 
     * When rounding is performed, leading 0s in the input are not considered. Significant digits are counted beginning with the first non-zero digit until the number of SignificantDigits occurs, and then [RoundingAlgorithm](significantdigitsnumberrounder_roundingalgorithm.md) is used to round at that position.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.significantdigitsnumberrounder.significantdigits
     * @type {Integer} 
     */
    SignificantDigits {
        get => this.get_SignificantDigits()
        set => this.put_SignificantDigits(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a [SignificantDigitsNumberRounder](significantdigitsnumberrounder.md) object.
     * 
     * This constructor initializes [RoundingAlgorithm](significantdigitsnumberrounder_roundingalgorithm.md) to a default value of [RoundingAlgorithm](roundingalgorithm.md).**RoundHalfUp**, and [SignificantDigits](significantdigitsnumberrounder_significantdigits.md) to 0.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumberFormatting.SignificantDigitsNumberRounder")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Rounds an **Int32** number to the specified number of significant digits.
     * @remarks
     * The rounding strategy is based on the values of [SignificantDigits](significantdigitsnumberrounder_significantdigits.md) and [RoundingAlgorithm](significantdigitsnumberrounder_roundingalgorithm.md).
     * @param {Integer} value The **Int32** value to be rounded.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.significantdigitsnumberrounder.roundint32
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
     * Rounds a **UInt32** number to the specified number of significant digits.
     * @remarks
     * The rounding strategy is based on the values of [SignificantDigits](significantdigitsnumberrounder_significantdigits.md) and [RoundingAlgorithm](significantdigitsnumberrounder_roundingalgorithm.md).
     * @param {Integer} value The **UInt32** value to be rounded.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.significantdigitsnumberrounder.rounduint32
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
     * Rounds an **Int64** number to the specified number of significant digits.
     * @remarks
     * The rounding strategy is based on the values of [SignificantDigits](significantdigitsnumberrounder_significantdigits.md) and [RoundingAlgorithm](significantdigitsnumberrounder_roundingalgorithm.md).
     * @param {Integer} value The **Int64** value to be rounded.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.significantdigitsnumberrounder.roundint64
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
     * Rounds a **UInt64** number to the specified number of significant digits.
     * @remarks
     * The rounding strategy is based on the values of [SignificantDigits](significantdigitsnumberrounder_significantdigits.md) and [RoundingAlgorithm](significantdigitsnumberrounder_roundingalgorithm.md).
     * @param {Integer} value The **UInt64** value to be rounded.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.significantdigitsnumberrounder.rounduint64
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
     * Rounds a **Single** number to the specified number of significant digits.
     * @remarks
     * The rounding strategy is based on the values of [SignificantDigits](significantdigitsnumberrounder_significantdigits.md) and [RoundingAlgorithm](significantdigitsnumberrounder_roundingalgorithm.md).
     * 
     * > [!NOTE]
     * > This method is precise only within the limits of the **Single** data type, or approximately 7 digits.
     * @param {Float} value The **Single** value to be rounded.
     * @returns {Float} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.significantdigitsnumberrounder.roundsingle
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
     * Rounds a **Double** number to the specified number of significant digits.
     * @remarks
     * The rounding strategy is based on the values of [SignificantDigits](significantdigitsnumberrounder_significantdigits.md) and [RoundingAlgorithm](significantdigitsnumberrounder_roundingalgorithm.md).
     * 
     * > [!NOTE]
     * > This method is precise only within the limits of the [Double](/dotnet/api/system.double?view=dotnet-uwp-10.0&preserve-view=true) data type, or approximately 15 digits.
     * @param {Float} value The **Double** value to be rounded.
     * @returns {Float} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numberformatting.significantdigitsnumberrounder.rounddouble
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
        if (!this.HasProp("__ISignificantDigitsNumberRounder")) {
            if ((queryResult := this.QueryInterface(ISignificantDigitsNumberRounder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISignificantDigitsNumberRounder := ISignificantDigitsNumberRounder(outPtr)
        }

        return this.__ISignificantDigitsNumberRounder.get_RoundingAlgorithm()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_RoundingAlgorithm(value) {
        if (!this.HasProp("__ISignificantDigitsNumberRounder")) {
            if ((queryResult := this.QueryInterface(ISignificantDigitsNumberRounder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISignificantDigitsNumberRounder := ISignificantDigitsNumberRounder(outPtr)
        }

        return this.__ISignificantDigitsNumberRounder.put_RoundingAlgorithm(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SignificantDigits() {
        if (!this.HasProp("__ISignificantDigitsNumberRounder")) {
            if ((queryResult := this.QueryInterface(ISignificantDigitsNumberRounder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISignificantDigitsNumberRounder := ISignificantDigitsNumberRounder(outPtr)
        }

        return this.__ISignificantDigitsNumberRounder.get_SignificantDigits()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SignificantDigits(value) {
        if (!this.HasProp("__ISignificantDigitsNumberRounder")) {
            if ((queryResult := this.QueryInterface(ISignificantDigitsNumberRounder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISignificantDigitsNumberRounder := ISignificantDigitsNumberRounder(outPtr)
        }

        return this.__ISignificantDigitsNumberRounder.put_SignificantDigits(value)
    }

;@endregion Instance Methods
}
