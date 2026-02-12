#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\ApplicationModel\Search\SearchQueryLinguisticDetails.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ISearchBoxQueryChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISearchBoxQueryChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{a9a70f8f-0cb0-4bd2-9998-2fb57ad5e731}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_QueryText", "get_Language", "get_LinguisticDetails"]

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
}
