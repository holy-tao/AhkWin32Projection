#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Search\SearchPaneQueryLinguisticDetails.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides information about the activated event that fires when an app is used to query text.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.isearchactivatedeventargswithlinguisticdetails
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class ISearchActivatedEventArgsWithLinguisticDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISearchActivatedEventArgsWithLinguisticDetails
     * @type {Guid}
     */
    static IID => Guid("{c09f33da-08ab-4931-9b7c-451025f21f81}")

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
     * Gets a [SearchPaneQueryLinguisticDetails](../windows.applicationmodel.search/searchpanequerylinguisticdetails.md) object that provides info about query text that the user enters through an Input Method Editor (IME).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.isearchactivatedeventargswithlinguisticdetails.linguisticdetails
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
