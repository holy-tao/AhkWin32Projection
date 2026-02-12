#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\EmailRecipientResolutionResult.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\EmailMailboxCreateFolderResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class IEmailMailbox3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmailMailbox3
     * @type {Guid}
     */
    static IID => Guid("{3da5897b-458b-408a-8e37-ac8b05d8af56}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ResolveRecipientsAsync", "ValidateCertificatesAsync", "TryEmptyFolderAsync", "TryCreateFolderAsync", "TryDeleteFolderAsync"]

    /**
     * 
     * @param {IIterable<HSTRING>} recipients 
     * @returns {IAsyncOperation<IVectorView<EmailRecipientResolutionResult>>} 
     */
    ResolveRecipientsAsync(recipients) {
        result := ComCall(6, this, "ptr", recipients, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, EmailRecipientResolutionResult), result_)
    }

    /**
     * 
     * @param {IIterable<Certificate>} certificates 
     * @returns {IAsyncOperation<IVectorView<Integer>>} 
     */
    ValidateCertificatesAsync(certificates) {
        result := ComCall(7, this, "ptr", certificates, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, (ptr) => IPropertyValue(ptr).GetInt32()), result_)
    }

    /**
     * 
     * @param {HSTRING} folderId 
     * @returns {IAsyncOperation<Integer>} 
     */
    TryEmptyFolderAsync(folderId) {
        if(folderId is String) {
            pin := HSTRING.Create(folderId)
            folderId := pin.Value
        }
        folderId := folderId is Win32Handle ? NumGet(folderId, "ptr") : folderId

        result := ComCall(8, this, "ptr", folderId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }

    /**
     * 
     * @param {HSTRING} parentFolderId 
     * @param {HSTRING} name 
     * @returns {IAsyncOperation<EmailMailboxCreateFolderResult>} 
     */
    TryCreateFolderAsync(parentFolderId, name) {
        if(parentFolderId is String) {
            pin := HSTRING.Create(parentFolderId)
            parentFolderId := pin.Value
        }
        parentFolderId := parentFolderId is Win32Handle ? NumGet(parentFolderId, "ptr") : parentFolderId
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(9, this, "ptr", parentFolderId, "ptr", name, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(EmailMailboxCreateFolderResult, result_)
    }

    /**
     * 
     * @param {HSTRING} folderId 
     * @returns {IAsyncOperation<Integer>} 
     */
    TryDeleteFolderAsync(folderId) {
        if(folderId is String) {
            pin := HSTRING.Create(folderId)
            folderId := pin.Value
        }
        folderId := folderId is Win32Handle ? NumGet(folderId, "ptr") : folderId

        result := ComCall(10, this, "ptr", folderId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }
}
