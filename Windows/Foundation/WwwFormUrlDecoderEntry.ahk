#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWwwFormUrlDecoderEntry.ahk
#Include ..\..\Guid.ahk

/**
 * Represents a name-value pair in a URL query string. Use the [IWwwFormUrlDecoderEntry](iwwwformurldecoderentry.md) interface instead; see Remarks.
 * @remarks
 * The [WwwFormUrlDecoder](wwwformurldecoder.md) class represents a Uniform Resource Identifier (URI) query string as a sequence of name-value pairs. Each name-value pair is represented by a WwwFormUrlDecoderEntry object. The collection type of [WwwFormUrlDecoder](wwwformurldecoder.md) is [IWwwFormUrlDecoderEntry](iwwwformurldecoderentry.md), and WwwFormUrlDecoderEntry provides the practical implementation (as an implementation detail).
 * 
 * Use [IWwwFormUrlDecoderEntry](iwwwformurldecoderentry.md) the interface rather than [WwwFormUrlDecoder](wwwformurldecoder.md) the class when possible. The WwwFormUrlDecoderEntry class isn't present as a runtime class for all languages or for all platforms. C# and Visual Basic code can use the [WwwFormUrlDecoder](wwwformurldecoder.md) class, but can't use WwwFormUrlDecoderEntry. Windows Phone for all languages, all versions can't use WwwFormUrlDecoderEntry. In all Windows Runtime APIs that reference the entries, they are passed as objects implementing the [IWwwFormUrlDecoderEntry](iwwwformurldecoderentry.md) interface, so you shouldn't need to recast to WwwFormUrlDecoderEntry for any scenario.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.wwwformurldecoderentry
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class WwwFormUrlDecoderEntry extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWwwFormUrlDecoderEntry

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWwwFormUrlDecoderEntry.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Represents the name of a parameter in a URL query string. Use the [IWwwFormUrlDecoderEntry](iwwwformurldecoderentry.md) interface version ([IWwwFormUrlDecoderEntry.Name](iwwwformurldecoderentry_name.md)) instead; see Remarks.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.wwwformurldecoderentry.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Represents a named value in a URL query string. Use the [IWwwFormUrlDecoderEntry](iwwwformurldecoderentry.md) interface version ([IWwwFormUrlDecoderEntry.Value](iwwwformurldecoderentry_value.md)) instead; see Remarks.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.wwwformurldecoderentry.value
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
    get_Name() {
        if (!this.HasProp("__IWwwFormUrlDecoderEntry")) {
            if ((queryResult := this.QueryInterface(IWwwFormUrlDecoderEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWwwFormUrlDecoderEntry := IWwwFormUrlDecoderEntry(outPtr)
        }

        return this.__IWwwFormUrlDecoderEntry.get_Name()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Value() {
        if (!this.HasProp("__IWwwFormUrlDecoderEntry")) {
            if ((queryResult := this.QueryInterface(IWwwFormUrlDecoderEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWwwFormUrlDecoderEntry := IWwwFormUrlDecoderEntry(outPtr)
        }

        return this.__IWwwFormUrlDecoderEntry.get_Value()
    }

;@endregion Instance Methods
}
