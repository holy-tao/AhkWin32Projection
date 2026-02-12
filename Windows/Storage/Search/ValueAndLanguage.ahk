#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IValueAndLanguage.ahk
#Include ..\..\..\Guid.ahk

/**
 * Specifies the language of a property, as a BCP-47 language code.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.search.valueandlanguage
 * @namespace Windows.Storage.Search
 * @version WindowsRuntime 1.4
 */
class ValueAndLanguage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IValueAndLanguage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IValueAndLanguage.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the language of the property value, specified as a BCP-47 language code.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.valueandlanguage.language
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
        set => this.put_Language(value)
    }

    /**
     * Gets or sets the property value for the current [ValueAndLanguage](valueandlanguage.md).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.valueandlanguage.value
     * @type {IInspectable} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ValueAndLanguage](valueandlanguage.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Storage.Search.ValueAndLanguage")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Language() {
        if (!this.HasProp("__IValueAndLanguage")) {
            if ((queryResult := this.QueryInterface(IValueAndLanguage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IValueAndLanguage := IValueAndLanguage(outPtr)
        }

        return this.__IValueAndLanguage.get_Language()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Language(value) {
        if (!this.HasProp("__IValueAndLanguage")) {
            if ((queryResult := this.QueryInterface(IValueAndLanguage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IValueAndLanguage := IValueAndLanguage(outPtr)
        }

        return this.__IValueAndLanguage.put_Language(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Value() {
        if (!this.HasProp("__IValueAndLanguage")) {
            if ((queryResult := this.QueryInterface(IValueAndLanguage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IValueAndLanguage := IValueAndLanguage(outPtr)
        }

        return this.__IValueAndLanguage.get_Value()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Value(value) {
        if (!this.HasProp("__IValueAndLanguage")) {
            if ((queryResult := this.QueryInterface(IValueAndLanguage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IValueAndLanguage := IValueAndLanguage(outPtr)
        }

        return this.__IValueAndLanguage.put_Value(value)
    }

;@endregion Instance Methods
}
