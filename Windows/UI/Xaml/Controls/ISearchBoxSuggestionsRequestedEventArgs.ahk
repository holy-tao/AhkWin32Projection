#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\ApplicationModel\Search\SearchQueryLinguisticDetails.ahk
#Include ..\..\..\ApplicationModel\Search\SearchSuggestionsRequest.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ISearchBoxSuggestionsRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISearchBoxSuggestionsRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{da15170e-e566-48cb-bd11-fe4b0f30a44d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_QueryText", "get_Language", "get_LinguisticDetails", "get_Request"]

    /**
     * @type {HSTRING} 
     */
    QueryText {
        get => this.get_QueryText()
    }

    /**
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
    }

    /**
     * @type {SearchQueryLinguisticDetails} 
     */
    LinguisticDetails {
        get => this.get_LinguisticDetails()
    }

    /**
     * @type {SearchSuggestionsRequest} 
     */
    Request {
        get => this.get_Request()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_QueryText() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Language() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SearchQueryLinguisticDetails} 
     */
    get_LinguisticDetails() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SearchQueryLinguisticDetails(value)
    }

    /**
     * 
     * @returns {SearchSuggestionsRequest} 
     */
    get_Request() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SearchSuggestionsRequest(value)
    }
}
