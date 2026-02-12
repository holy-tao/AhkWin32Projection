#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGeographicRegion.ahk
#Include .\IGeographicRegionFactory.ahk
#Include .\IGeographicRegionStatics.ahk
#Include ..\..\Guid.ahk

/**
 * Describes a region. This is usually a country, but may be a macroregion.
 * @remarks
 * For a list of standard country/region codes used by Microsoft, see the [Official Country/Region List](/windows/uwp/publish/supported-languages).
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.geographicregion
 * @namespace Windows.Globalization
 * @version WindowsRuntime 1.4
 */
class GeographicRegion extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGeographicRegion

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGeographicRegion.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [GeographicRegion](geographicregion.md) object.
     * @param {HSTRING} geographicRegionCode One of the ISO 3166-1 two-letter or three-letter codes that identify the country, or one of the three-digit UN-M49 codes that identify the geographical region.
     * @returns {GeographicRegion} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.geographicregion.#ctor
     */
    static CreateGeographicRegion(geographicRegionCode) {
        if (!GeographicRegion.HasProp("__IGeographicRegionFactory")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.GeographicRegion")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGeographicRegionFactory.IID)
            GeographicRegion.__IGeographicRegionFactory := IGeographicRegionFactory(factoryPtr)
        }

        return GeographicRegion.__IGeographicRegionFactory.CreateGeographicRegion(geographicRegionCode)
    }

    /**
     * Determines whether a geographic region identifier is supported.
     * @param {HSTRING} geographicRegionCode One of the ISO 3166-1 two-letter or three-letter codes that identify the country, or one of the three-digit UN-M49 codes that identify the geographical region.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.geographicregion.issupported
     */
    static IsSupported(geographicRegionCode) {
        if (!GeographicRegion.HasProp("__IGeographicRegionStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.GeographicRegion")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGeographicRegionStatics.IID)
            GeographicRegion.__IGeographicRegionStatics := IGeographicRegionStatics(factoryPtr)
        }

        return GeographicRegion.__IGeographicRegionStatics.IsSupported(geographicRegionCode)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the string that contains the best available identifier that represents the region.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.geographicregion.code
     * @type {HSTRING} 
     */
    Code {
        get => this.get_Code()
    }

    /**
     * Gets the two-letter identifier for this region.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.geographicregion.codetwoletter
     * @type {HSTRING} 
     */
    CodeTwoLetter {
        get => this.get_CodeTwoLetter()
    }

    /**
     * Gets the three-letter identifier for this region.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.geographicregion.codethreeletter
     * @type {HSTRING} 
     */
    CodeThreeLetter {
        get => this.get_CodeThreeLetter()
    }

    /**
     * Gets the three-digit identifier for this region, as a string.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.geographicregion.codethreedigit
     * @type {HSTRING} 
     */
    CodeThreeDigit {
        get => this.get_CodeThreeDigit()
    }

    /**
     * Gets a localized string that is suitable for display to the user for identifying the region.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.geographicregion.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Gets the name of the region in the primary language spoken in this region.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.geographicregion.nativename
     * @type {HSTRING} 
     */
    NativeName {
        get => this.get_NativeName()
    }

    /**
     * Gets the set of currencies in use in this region.
     * @remarks
     * If the region is a country, there is typically one currency, although some countries do have more than one currency in use. If the region is larger, the returned set includes the currencies in use in each of the contained regions/countries.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.geographicregion.currenciesinuse
     * @type {IVectorView<HSTRING>} 
     */
    CurrenciesInUse {
        get => this.get_CurrenciesInUse()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a [GeographicRegion](geographicregion.md) object that defaults to the user's home region.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Globalization.GeographicRegion")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Code() {
        if (!this.HasProp("__IGeographicRegion")) {
            if ((queryResult := this.QueryInterface(IGeographicRegion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeographicRegion := IGeographicRegion(outPtr)
        }

        return this.__IGeographicRegion.get_Code()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CodeTwoLetter() {
        if (!this.HasProp("__IGeographicRegion")) {
            if ((queryResult := this.QueryInterface(IGeographicRegion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeographicRegion := IGeographicRegion(outPtr)
        }

        return this.__IGeographicRegion.get_CodeTwoLetter()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CodeThreeLetter() {
        if (!this.HasProp("__IGeographicRegion")) {
            if ((queryResult := this.QueryInterface(IGeographicRegion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeographicRegion := IGeographicRegion(outPtr)
        }

        return this.__IGeographicRegion.get_CodeThreeLetter()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CodeThreeDigit() {
        if (!this.HasProp("__IGeographicRegion")) {
            if ((queryResult := this.QueryInterface(IGeographicRegion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeographicRegion := IGeographicRegion(outPtr)
        }

        return this.__IGeographicRegion.get_CodeThreeDigit()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IGeographicRegion")) {
            if ((queryResult := this.QueryInterface(IGeographicRegion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeographicRegion := IGeographicRegion(outPtr)
        }

        return this.__IGeographicRegion.get_DisplayName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NativeName() {
        if (!this.HasProp("__IGeographicRegion")) {
            if ((queryResult := this.QueryInterface(IGeographicRegion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeographicRegion := IGeographicRegion(outPtr)
        }

        return this.__IGeographicRegion.get_NativeName()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_CurrenciesInUse() {
        if (!this.HasProp("__IGeographicRegion")) {
            if ((queryResult := this.QueryInterface(IGeographicRegion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeographicRegion := IGeographicRegion(outPtr)
        }

        return this.__IGeographicRegion.get_CurrenciesInUse()
    }

;@endregion Instance Methods
}
