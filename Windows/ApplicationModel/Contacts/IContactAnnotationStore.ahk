#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ContactAnnotation.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include .\ContactAnnotationList.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class IContactAnnotationStore extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactAnnotationStore
     * @type {Guid}
     */
    static IID => Guid("{23acf4aa-7a77-457d-8203-987f4b31af09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindContactIdsByEmailAsync", "FindContactIdsByPhoneNumberAsync", "FindAnnotationsForContactAsync", "DisableAnnotationAsync", "CreateAnnotationListAsync", "CreateAnnotationListInAccountAsync", "GetAnnotationListAsync", "FindAnnotationListsAsync"]

    /**
     * 
     * @param {HSTRING} emailAddress 
     * @returns {IAsyncOperation<IVectorView<HSTRING>>} 
     */
    FindContactIdsByEmailAsync(emailAddress) {
        if(emailAddress is String) {
            pin := HSTRING.Create(emailAddress)
            emailAddress := pin.Value
        }
        emailAddress := emailAddress is Win32Handle ? NumGet(emailAddress, "ptr") : emailAddress

        result := ComCall(6, this, "ptr", emailAddress, "ptr*", &contactIds := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, (ptr) => HSTRING({ Value: ptr })), contactIds)
    }

    /**
     * 
     * @param {HSTRING} phoneNumber 
     * @returns {IAsyncOperation<IVectorView<HSTRING>>} 
     */
    FindContactIdsByPhoneNumberAsync(phoneNumber) {
        if(phoneNumber is String) {
            pin := HSTRING.Create(phoneNumber)
            phoneNumber := pin.Value
        }
        phoneNumber := phoneNumber is Win32Handle ? NumGet(phoneNumber, "ptr") : phoneNumber

        result := ComCall(7, this, "ptr", phoneNumber, "ptr*", &contactIds := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, (ptr) => HSTRING({ Value: ptr })), contactIds)
    }

    /**
     * 
     * @param {Contact} contact_ 
     * @returns {IAsyncOperation<IVectorView<ContactAnnotation>>} 
     */
    FindAnnotationsForContactAsync(contact_) {
        result := ComCall(8, this, "ptr", contact_, "ptr*", &annotations := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, ContactAnnotation), annotations)
    }

    /**
     * 
     * @param {ContactAnnotation} annotation 
     * @returns {IAsyncAction} 
     */
    DisableAnnotationAsync(annotation) {
        result := ComCall(9, this, "ptr", annotation, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(value)
    }

    /**
     * 
     * @returns {IAsyncOperation<ContactAnnotationList>} 
     */
    CreateAnnotationListAsync() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ContactAnnotationList, value)
    }

    /**
     * 
     * @param {HSTRING} userDataAccountId 
     * @returns {IAsyncOperation<ContactAnnotationList>} 
     */
    CreateAnnotationListInAccountAsync(userDataAccountId) {
        if(userDataAccountId is String) {
            pin := HSTRING.Create(userDataAccountId)
            userDataAccountId := pin.Value
        }
        userDataAccountId := userDataAccountId is Win32Handle ? NumGet(userDataAccountId, "ptr") : userDataAccountId

        result := ComCall(11, this, "ptr", userDataAccountId, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ContactAnnotationList, value)
    }

    /**
     * 
     * @param {HSTRING} annotationListId 
     * @returns {IAsyncOperation<ContactAnnotationList>} 
     */
    GetAnnotationListAsync(annotationListId) {
        if(annotationListId is String) {
            pin := HSTRING.Create(annotationListId)
            annotationListId := pin.Value
        }
        annotationListId := annotationListId is Win32Handle ? NumGet(annotationListId, "ptr") : annotationListId

        result := ComCall(12, this, "ptr", annotationListId, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ContactAnnotationList, value)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<ContactAnnotationList>>} 
     */
    FindAnnotationListsAsync() {
        result := ComCall(13, this, "ptr*", &lists := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, ContactAnnotationList), lists)
    }
}
