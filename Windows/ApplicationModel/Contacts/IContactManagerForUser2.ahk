#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class IContactManagerForUser2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactManagerForUser2
     * @type {Guid}
     */
    static IID => Guid("{4d469c2e-3b75-4a73-bb30-736645472256}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShowFullContactCard"]

    /**
     * 
     * @param {Contact} contact_ 
     * @param {FullContactCardOptions} fullContactCardOptions_ 
     * @returns {HRESULT} 
     */
    ShowFullContactCard(contact_, fullContactCardOptions_) {
        result := ComCall(6, this, "ptr", contact_, "ptr", fullContactCardOptions_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
