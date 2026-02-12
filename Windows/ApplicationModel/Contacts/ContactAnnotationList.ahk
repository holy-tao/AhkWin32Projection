#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactAnnotationList.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a list of [ContactAnnotation](contactannotation.md) objects.
 * @remarks
 * Call one of the following methods to create or get an existing ContactAnnotationList:
 * 
 * 
 * + [CreateAnnotationListAsync](contactannotationstore_createannotationlistasync_777171367.md)
 * + [CreateAnnotationListAsync(String)](contactannotationstore_createannotationlistasync_2010335367.md)
 * + [GetAnnotationListAsync](contactannotationstore_getannotationlistasync_1462689163.md)
 * + [FindAnnotationListsAsync](contactannotationstore_findannotationlistsasync_660284737.md)
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactannotationlist
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactAnnotationList extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactAnnotationList

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactAnnotationList.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the ID for this [ContactAnnotationList](contactannotationlist.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactannotationlist.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the unique identifier for the app package that created the [ContactAnnotationList](contactannotationlist.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactannotationlist.providerpackagefamilyname
     * @type {HSTRING} 
     */
    ProviderPackageFamilyName {
        get => this.get_ProviderPackageFamilyName()
    }

    /**
     * Gets the ID for the [UserDataAccount](../windows.applicationmodel.userdataaccounts/userdataaccount.md) used by the app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactannotationlist.userdataaccountid
     * @type {HSTRING} 
     */
    UserDataAccountId {
        get => this.get_UserDataAccountId()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IContactAnnotationList")) {
            if ((queryResult := this.QueryInterface(IContactAnnotationList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAnnotationList := IContactAnnotationList(outPtr)
        }

        return this.__IContactAnnotationList.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProviderPackageFamilyName() {
        if (!this.HasProp("__IContactAnnotationList")) {
            if ((queryResult := this.QueryInterface(IContactAnnotationList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAnnotationList := IContactAnnotationList(outPtr)
        }

        return this.__IContactAnnotationList.get_ProviderPackageFamilyName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserDataAccountId() {
        if (!this.HasProp("__IContactAnnotationList")) {
            if ((queryResult := this.QueryInterface(IContactAnnotationList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAnnotationList := IContactAnnotationList(outPtr)
        }

        return this.__IContactAnnotationList.get_UserDataAccountId()
    }

    /**
     * Asynchronously deletes this [ContactAnnotationList](contactannotationlist.md) from the [ContactAnnotationStore](contactannotationstore.md).
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactannotationlist.deleteasync
     */
    DeleteAsync() {
        if (!this.HasProp("__IContactAnnotationList")) {
            if ((queryResult := this.QueryInterface(IContactAnnotationList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAnnotationList := IContactAnnotationList(outPtr)
        }

        return this.__IContactAnnotationList.DeleteAsync()
    }

    /**
     * Asynchronously attempts to save the [ContactAnnotation](contactannotation.md) to the [ContactAnnotationList](contactannotationlist.md).
     * @param {ContactAnnotation} annotation The annotation to save to the list.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactannotationlist.trysaveannotationasync
     */
    TrySaveAnnotationAsync(annotation) {
        if (!this.HasProp("__IContactAnnotationList")) {
            if ((queryResult := this.QueryInterface(IContactAnnotationList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAnnotationList := IContactAnnotationList(outPtr)
        }

        return this.__IContactAnnotationList.TrySaveAnnotationAsync(annotation)
    }

    /**
     * Gets the [ContactAnnotation](contactannotation.md) with the specified [Id](contactannotation_id.md).
     * @param {HSTRING} annotationId The [ContactAnnotation.Id](contactannotation_id.md) used to identify the [ContactAnnotation](contactannotation.md).
     * @returns {IAsyncOperation<ContactAnnotation>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactannotationlist.getannotationasync
     */
    GetAnnotationAsync(annotationId) {
        if (!this.HasProp("__IContactAnnotationList")) {
            if ((queryResult := this.QueryInterface(IContactAnnotationList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAnnotationList := IContactAnnotationList(outPtr)
        }

        return this.__IContactAnnotationList.GetAnnotationAsync(annotationId)
    }

    /**
     * Gets the list of [ContactAnnotation](contactannotation.md) objects containing the specified remote ID property.
     * @param {HSTRING} remoteId The remote ID used to find the [ContactAnnotation](contactannotation.md) objects.
     * @returns {IAsyncOperation<IVectorView<ContactAnnotation>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactannotationlist.findannotationsbyremoteidasync
     */
    FindAnnotationsByRemoteIdAsync(remoteId) {
        if (!this.HasProp("__IContactAnnotationList")) {
            if ((queryResult := this.QueryInterface(IContactAnnotationList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAnnotationList := IContactAnnotationList(outPtr)
        }

        return this.__IContactAnnotationList.FindAnnotationsByRemoteIdAsync(remoteId)
    }

    /**
     * Asynchronously gets the list of [ContactAnnotation](contactannotation.md) objects.
     * @returns {IAsyncOperation<IVectorView<ContactAnnotation>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactannotationlist.findannotationsasync
     */
    FindAnnotationsAsync() {
        if (!this.HasProp("__IContactAnnotationList")) {
            if ((queryResult := this.QueryInterface(IContactAnnotationList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAnnotationList := IContactAnnotationList(outPtr)
        }

        return this.__IContactAnnotationList.FindAnnotationsAsync()
    }

    /**
     * Asynchronously deletes the specified [ContactAnnotation](contactannotation.md) from the list.
     * @param {ContactAnnotation} annotation The annotation to delete from the list.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactannotationlist.deleteannotationasync
     */
    DeleteAnnotationAsync(annotation) {
        if (!this.HasProp("__IContactAnnotationList")) {
            if ((queryResult := this.QueryInterface(IContactAnnotationList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAnnotationList := IContactAnnotationList(outPtr)
        }

        return this.__IContactAnnotationList.DeleteAnnotationAsync(annotation)
    }

;@endregion Instance Methods
}
