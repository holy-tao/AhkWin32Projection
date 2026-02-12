#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SearchPaneQueryLinguisticDetails.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Search
 * @version WindowsRuntime 1.4
 */
class ISearchPaneQuerySubmittedEventArgsWithLinguisticDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISearchPaneQuerySubmittedEventArgsWithLinguisticDetails
     * @type {Guid}
     */
    static IID => Guid("{460c92e5-4c32-4538-a4d4-b6b4400d140f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LinguisticDetails"]

    /**
     * @type {SearchPaneQueryLinguisticDetails} 
     */
    LinguisticDetails {
        get => this.get_LinguisticDetails()
    }

    /**
     * 
     * @returns {SearchPaneQueryLinguisticDetails} 
     */
    get_LinguisticDetails() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SearchPaneQueryLinguisticDetails(value)
    }
}
