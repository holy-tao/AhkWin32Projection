#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\WebAccountClientView.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Web.Provider
 * @version WindowsRuntime 1.4
 */
class IWebAccountClientViewFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebAccountClientViewFactory
     * @type {Guid}
     */
    static IID => Guid("{616d16a4-de22-4855-a326-06cebf2a3f23}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "CreateWithPairwiseId"]

    /**
     * Create Extended Stored Procedures
     * @param {Integer} viewType 
     * @param {Uri} applicationCallbackUri 
     * @returns {WebAccountClientView} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(viewType, applicationCallbackUri) {
        result := ComCall(6, this, "int", viewType, "ptr", applicationCallbackUri, "ptr*", &view_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebAccountClientView(view_)
    }

    /**
     * 
     * @param {Integer} viewType 
     * @param {Uri} applicationCallbackUri 
     * @param {HSTRING} accountPairwiseId 
     * @returns {WebAccountClientView} 
     */
    CreateWithPairwiseId(viewType, applicationCallbackUri, accountPairwiseId) {
        if(accountPairwiseId is String) {
            pin := HSTRING.Create(accountPairwiseId)
            accountPairwiseId := pin.Value
        }
        accountPairwiseId := accountPairwiseId is Win32Handle ? NumGet(accountPairwiseId, "ptr") : accountPairwiseId

        result := ComCall(7, this, "int", viewType, "ptr", applicationCallbackUri, "ptr", accountPairwiseId, "ptr*", &view_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebAccountClientView(view_)
    }
}
