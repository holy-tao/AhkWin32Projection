#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SearchSuggestionCollection.ahk
#Include .\SearchPaneSuggestionsRequestDeferral.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Search
 * @version WindowsRuntime 1.4
 */
class ISearchPaneSuggestionsRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISearchPaneSuggestionsRequest
     * @type {Guid}
     */
    static IID => Guid("{81b10b1c-e561-4093-9b4d-2ad482794a53}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsCanceled", "get_SearchSuggestionCollection", "GetDeferral"]

    /**
     * @type {Boolean} 
     */
    IsCanceled {
        get => this.get_IsCanceled()
    }

    /**
     * @type {SearchSuggestionCollection} 
     */
    SearchSuggestionCollection {
        get => this.get_SearchSuggestionCollection()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCanceled() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SearchSuggestionCollection} 
     */
    get_SearchSuggestionCollection() {
        result := ComCall(7, this, "ptr*", &collection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SearchSuggestionCollection(collection)
    }

    /**
     * 
     * @returns {SearchPaneSuggestionsRequestDeferral} 
     */
    GetDeferral() {
        result := ComCall(8, this, "ptr*", &deferral_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SearchPaneSuggestionsRequestDeferral(deferral_)
    }
}
