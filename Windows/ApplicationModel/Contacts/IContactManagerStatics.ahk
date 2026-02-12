#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ContactCardDelayedDataLoader.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class IContactManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{81f21ac0-f661-4708-ba4f-d386bd0d622e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShowContactCard", "ShowContactCardWithPlacement", "ShowDelayLoadedContactCard"]

    /**
     * 
     * @param {Contact} contact_ 
     * @param {RECT} selection 
     * @returns {HRESULT} 
     */
    ShowContactCard(contact_, selection) {
        result := ComCall(6, this, "ptr", contact_, "ptr", selection, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Contact} contact_ 
     * @param {RECT} selection 
     * @param {Integer} preferredPlacement 
     * @returns {HRESULT} 
     */
    ShowContactCardWithPlacement(contact_, selection, preferredPlacement) {
        result := ComCall(7, this, "ptr", contact_, "ptr", selection, "int", preferredPlacement, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Contact} contact_ 
     * @param {RECT} selection 
     * @param {Integer} preferredPlacement 
     * @returns {ContactCardDelayedDataLoader} 
     */
    ShowDelayLoadedContactCard(contact_, selection, preferredPlacement) {
        result := ComCall(8, this, "ptr", contact_, "ptr", selection, "int", preferredPlacement, "ptr*", &dataLoader := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContactCardDelayedDataLoader(dataLoader)
    }
}
