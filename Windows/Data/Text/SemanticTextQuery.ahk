#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISemanticTextQuery.ahk
#Include .\ISemanticTextQueryFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Permits apps to perform text queries using Advanced Query Syntax (AQS) strings, with the option of providing a language tag to be employed in the query.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.data.text.semantictextquery
 * @namespace Windows.Data.Text
 * @version WindowsRuntime 1.4
 */
class SemanticTextQuery extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISemanticTextQuery

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISemanticTextQuery.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [SemanticTextQuery](semantictextquery.md) from an Advanced Query Syntax (AQS) query string.
     * @param {HSTRING} aqsFilter An Advanced Query Syntax (AQS) string that contains the desired query. Learn more about AQS in [Advanced Query Syntax (AQS)](/windows/desktop/lwef/-search-2x-wds-aqsreference).
     * @returns {SemanticTextQuery} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.semantictextquery.#ctor
     */
    static Create(aqsFilter) {
        if (!SemanticTextQuery.HasProp("__ISemanticTextQueryFactory")) {
            activatableClassId := HSTRING.Create("Windows.Data.Text.SemanticTextQuery")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISemanticTextQueryFactory.IID)
            SemanticTextQuery.__ISemanticTextQueryFactory := ISemanticTextQueryFactory(factoryPtr)
        }

        return SemanticTextQuery.__ISemanticTextQueryFactory.Create(aqsFilter)
    }

    /**
     * Creates a [SemanticTextQuery](semantictextquery.md) from an Advanced Query Syntax (AQS) query string and a language tag.
     * @remarks
     * *filterLanguage* permits queries to work with language differences. For example, if *aqsFilter* is "19,5" and *filterLanguage* is "pl" (Polish), a call to [Find](semantictextquery_find_1750099982.md) against text that includes "19.5" returns a text segment because it is understood that the comma is the decimal separator in Polish.
     * @param {HSTRING} aqsFilter An Advanced Query Syntax (AQS) string that contains the desired query. Learn more in [Advanced Query Syntax](/windows/win32/lwef/-search-2x-wds-aqsreference).
     * @param {HSTRING} filterLanguage The [BCP-47](https://tools.ietf.org/html/bcp47) language tag to be employed in the query.
     * 
     * To see a list of the language tags specifically supported by the Microsoft Store, see [Choosing your languages](/windows/uwp/publish/supported-languages).
     * @returns {SemanticTextQuery} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.semantictextquery.#ctor
     */
    static CreateWithLanguage(aqsFilter, filterLanguage) {
        if (!SemanticTextQuery.HasProp("__ISemanticTextQueryFactory")) {
            activatableClassId := HSTRING.Create("Windows.Data.Text.SemanticTextQuery")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISemanticTextQueryFactory.IID)
            SemanticTextQuery.__ISemanticTextQueryFactory := ISemanticTextQueryFactory(factoryPtr)
        }

        return SemanticTextQuery.__ISemanticTextQueryFactory.CreateWithLanguage(aqsFilter, filterLanguage)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Returns segments of a source string that match the [SemanticTextQuery](semantictextquery.md) object's query.
     * @param {HSTRING} content A source string to be queried.
     * @returns {IVectorView<TextSegment>} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.semantictextquery.find
     */
    Find(content) {
        if (!this.HasProp("__ISemanticTextQuery")) {
            if ((queryResult := this.QueryInterface(ISemanticTextQuery.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticTextQuery := ISemanticTextQuery(outPtr)
        }

        return this.__ISemanticTextQuery.Find(content)
    }

    /**
     * Returns segments of a source string that match the [SemanticTextQuery](semantictextquery.md) object's query over properties.
     * @param {HSTRING} propertyContent A source string to be queried.
     * @param {HSTRING} propertyName The name of the property.
     * @returns {IVectorView<TextSegment>} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.text.semantictextquery.findinproperty
     */
    FindInProperty(propertyContent, propertyName) {
        if (!this.HasProp("__ISemanticTextQuery")) {
            if ((queryResult := this.QueryInterface(ISemanticTextQuery.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticTextQuery := ISemanticTextQuery(outPtr)
        }

        return this.__ISemanticTextQuery.FindInProperty(propertyContent, propertyName)
    }

;@endregion Instance Methods
}
