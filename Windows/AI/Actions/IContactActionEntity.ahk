#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\ApplicationModel\Contacts\Contact.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class IContactActionEntity extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactActionEntity
     * @type {Guid}
     */
    static IID => Guid("{458c3e07-5892-5485-bd9b-8f7a540c9501}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Contact"]

    /**
     * @type {Contact} 
     */
    Contact {
        get => this.get_Contact()
    }

    /**
     * 
     * @returns {Contact} 
     */
    get_Contact() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Contact(value)
    }
}
