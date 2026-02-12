#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\ContactAnnotation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class IContactAnnotationList extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactAnnotationList
     * @type {Guid}
     */
    static IID => Guid("{92a486aa-5c88-45b9-aad0-461888e68d8a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_ProviderPackageFamilyName", "get_UserDataAccountId", "DeleteAsync", "TrySaveAnnotationAsync", "GetAnnotationAsync", "FindAnnotationsByRemoteIdAsync", "FindAnnotationsAsync", "DeleteAnnotationAsync"]

    /**
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {HSTRING} 
     */
    ProviderPackageFamilyName {
        get => this.get_ProviderPackageFamilyName()
    }

    /**
     * @type {HSTRING} 
     */
    UserDataAccountId {
        get => this.get_UserDataAccountId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProviderPackageFamilyName() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserDataAccountId() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    DeleteAsync() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(value)
    }

    /**
     * 
     * @param {ContactAnnotation} annotation 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TrySaveAnnotationAsync(annotation) {
        result := ComCall(10, this, "ptr", annotation, "ptr*", &ppResult := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), ppResult)
    }

    /**
     * 
     * @param {HSTRING} annotationId 
     * @returns {IAsyncOperation<ContactAnnotation>} 
     */
    GetAnnotationAsync(annotationId) {
        if(annotationId is String) {
            pin := HSTRING.Create(annotationId)
            annotationId := pin.Value
        }
        annotationId := annotationId is Win32Handle ? NumGet(annotationId, "ptr") : annotationId

        result := ComCall(11, this, "ptr", annotationId, "ptr*", &annotation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ContactAnnotation, annotation)
    }

    /**
     * 
     * @param {HSTRING} remoteId 
     * @returns {IAsyncOperation<IVectorView<ContactAnnotation>>} 
     */
    FindAnnotationsByRemoteIdAsync(remoteId) {
        if(remoteId is String) {
            pin := HSTRING.Create(remoteId)
            remoteId := pin.Value
        }
        remoteId := remoteId is Win32Handle ? NumGet(remoteId, "ptr") : remoteId

        result := ComCall(12, this, "ptr", remoteId, "ptr*", &annotations := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, ContactAnnotation), annotations)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<ContactAnnotation>>} 
     */
    FindAnnotationsAsync() {
        result := ComCall(13, this, "ptr*", &annotations := 0, "int")
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
    DeleteAnnotationAsync(annotation) {
        result := ComCall(14, this, "ptr", annotation, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(value)
    }
}
