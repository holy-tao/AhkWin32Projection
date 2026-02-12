#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\ContactAnnotation.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class IContactAnnotationStore2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactAnnotationStore2
     * @type {Guid}
     */
    static IID => Guid("{7ede23fd-61e7-4967-8ec5-bdf280a24063}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindAnnotationsForContactListAsync"]

    /**
     * 
     * @param {HSTRING} contactListId 
     * @returns {IAsyncOperation<IVectorView<ContactAnnotation>>} 
     */
    FindAnnotationsForContactListAsync(contactListId) {
        if(contactListId is String) {
            pin := HSTRING.Create(contactListId)
            contactListId := pin.Value
        }
        contactListId := contactListId is Win32Handle ? NumGet(contactListId, "ptr") : contactListId

        result := ComCall(6, this, "ptr", contactListId, "ptr*", &annotations := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, ContactAnnotation), annotations)
    }
}
