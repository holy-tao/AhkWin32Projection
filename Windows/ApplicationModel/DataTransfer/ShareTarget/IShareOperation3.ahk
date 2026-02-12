#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Contacts\Contact.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.DataTransfer.ShareTarget
 * @version WindowsRuntime 1.4
 */
class IShareOperation3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShareOperation3
     * @type {Guid}
     */
    static IID => Guid("{5ef6b382-b7a7-4571-a2a6-994a034988b2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Contacts"]

    /**
     * @type {IVectorView<Contact>} 
     */
    Contacts {
        get => this.get_Contacts()
    }

    /**
     * 
     * @returns {IVectorView<Contact>} 
     */
    get_Contacts() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(Contact, value)
    }
}
