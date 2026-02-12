#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IIppTextWithLanguage.ahk
#Include .\IIppTextWithLanguageFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents information about a `textWithLanguage` attribute as defined by the [Internet Printing Protocol (IPP) specification](https://tools.ietf.org/html/rfc8011).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ipptextwithlanguage
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class IppTextWithLanguage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IIppTextWithLanguage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IIppTextWithLanguage.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new instance of the [IppTextWithLanguage](ipptextwithlanguage.md) class with the specified values. This object represents information about a `textWithLanguage` attribute as defined by the Internet Printing Protocol (IPP).
     * @param {HSTRING} language_ The code that specifies the language of the `textWithLanguage` attribute, as defined by the [RFC 5646 specification](https://tools.ietf.org/html/rfc5646).
     * @param {HSTRING} text The text value of the `textWithLanguage` attribute.
     * @returns {IppTextWithLanguage} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ipptextwithlanguage.#ctor
     */
    static CreateInstance(language_, text) {
        if (!IppTextWithLanguage.HasProp("__IIppTextWithLanguageFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.IppTextWithLanguage")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIppTextWithLanguageFactory.IID)
            IppTextWithLanguage.__IIppTextWithLanguageFactory := IIppTextWithLanguageFactory(factoryPtr)
        }

        return IppTextWithLanguage.__IIppTextWithLanguageFactory.CreateInstance(language_, text)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the code that specifies the language of the `textWithLanguage` attribute (as defined by the Internet Printing Protocol (IPP)) that is represented by the current [IppTextWithLanguage](ipptextwithlanguage.md) object. The language code is defined by the [RFC 5646 specification](https://tools.ietf.org/html/rfc5646).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ipptextwithlanguage.language
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
    }

    /**
     * Gets the text value of the `textWithLanguage` attribute (as defined by the Internet Printing Protocol (IPP)) that is represented by the current [IppTextWithLanguage](ipptextwithlanguage.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.ipptextwithlanguage.value
     * @type {HSTRING} 
     */
    Value {
        get => this.get_Value()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Language() {
        if (!this.HasProp("__IIppTextWithLanguage")) {
            if ((queryResult := this.QueryInterface(IIppTextWithLanguage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppTextWithLanguage := IIppTextWithLanguage(outPtr)
        }

        return this.__IIppTextWithLanguage.get_Language()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Value() {
        if (!this.HasProp("__IIppTextWithLanguage")) {
            if ((queryResult := this.QueryInterface(IIppTextWithLanguage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIppTextWithLanguage := IIppTextWithLanguage(outPtr)
        }

        return this.__IIppTextWithLanguage.get_Value()
    }

;@endregion Instance Methods
}
