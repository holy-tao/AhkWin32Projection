#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperationWithProgress.ahk
#Include .\ServiceDocument.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Storage\Streams\IInputStream.ahk
#Include ..\Syndication\SyndicationItem.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncActionWithProgress.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.AtomPub
 * @version WindowsRuntime 1.4
 */
class IAtomPubClient extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAtomPubClient
     * @type {Guid}
     */
    static IID => Guid("{35392c38-cded-4d4c-9637-05f15c1c9406}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RetrieveServiceDocumentAsync", "RetrieveMediaResourceAsync", "RetrieveResourceAsync", "CreateResourceAsync", "CreateMediaResourceAsync", "UpdateMediaResourceAsync", "UpdateResourceAsync", "UpdateResourceItemAsync", "DeleteResourceAsync", "DeleteResourceItemAsync", "CancelAsyncOperations"]

    /**
     * 
     * @param {Uri} uri_ 
     * @returns {IAsyncOperationWithProgress<ServiceDocument, RetrievalProgress>} 
     */
    RetrieveServiceDocumentAsync(uri_) {
        result := ComCall(6, this, "ptr", uri_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(ServiceDocument, (ptr) => IPropertyValue(ptr).GetRetrievalProgress(), operation)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @returns {IAsyncOperationWithProgress<IInputStream, RetrievalProgress>} 
     */
    RetrieveMediaResourceAsync(uri_) {
        result := ComCall(7, this, "ptr", uri_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(IInputStream, (ptr) => IPropertyValue(ptr).GetRetrievalProgress(), operation)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @returns {IAsyncOperationWithProgress<SyndicationItem, RetrievalProgress>} 
     */
    RetrieveResourceAsync(uri_) {
        result := ComCall(8, this, "ptr", uri_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(SyndicationItem, (ptr) => IPropertyValue(ptr).GetRetrievalProgress(), operation)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @param {HSTRING} description 
     * @param {SyndicationItem} item 
     * @returns {IAsyncOperationWithProgress<SyndicationItem, TransferProgress>} 
     */
    CreateResourceAsync(uri_, description, item) {
        if(description is String) {
            pin := HSTRING.Create(description)
            description := pin.Value
        }
        description := description is Win32Handle ? NumGet(description, "ptr") : description

        result := ComCall(9, this, "ptr", uri_, "ptr", description, "ptr", item, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(SyndicationItem, (ptr) => IPropertyValue(ptr).GetTransferProgress(), operation)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @param {HSTRING} mediaType_ 
     * @param {HSTRING} description 
     * @param {IInputStream} mediaStream 
     * @returns {IAsyncOperationWithProgress<SyndicationItem, TransferProgress>} 
     */
    CreateMediaResourceAsync(uri_, mediaType_, description, mediaStream) {
        if(mediaType_ is String) {
            pin := HSTRING.Create(mediaType_)
            mediaType_ := pin.Value
        }
        mediaType_ := mediaType_ is Win32Handle ? NumGet(mediaType_, "ptr") : mediaType_
        if(description is String) {
            pin := HSTRING.Create(description)
            description := pin.Value
        }
        description := description is Win32Handle ? NumGet(description, "ptr") : description

        result := ComCall(10, this, "ptr", uri_, "ptr", mediaType_, "ptr", description, "ptr", mediaStream, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(SyndicationItem, (ptr) => IPropertyValue(ptr).GetTransferProgress(), operation)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @param {HSTRING} mediaType_ 
     * @param {IInputStream} mediaStream 
     * @returns {IAsyncActionWithProgress<TransferProgress>} 
     */
    UpdateMediaResourceAsync(uri_, mediaType_, mediaStream) {
        if(mediaType_ is String) {
            pin := HSTRING.Create(mediaType_)
            mediaType_ := pin.Value
        }
        mediaType_ := mediaType_ is Win32Handle ? NumGet(mediaType_, "ptr") : mediaType_

        result := ComCall(11, this, "ptr", uri_, "ptr", mediaType_, "ptr", mediaStream, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncActionWithProgress((ptr) => IPropertyValue(ptr).GetTransferProgress(), operation)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @param {SyndicationItem} item 
     * @returns {IAsyncActionWithProgress<TransferProgress>} 
     */
    UpdateResourceAsync(uri_, item) {
        result := ComCall(12, this, "ptr", uri_, "ptr", item, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncActionWithProgress((ptr) => IPropertyValue(ptr).GetTransferProgress(), operation)
    }

    /**
     * 
     * @param {SyndicationItem} item 
     * @returns {IAsyncActionWithProgress<TransferProgress>} 
     */
    UpdateResourceItemAsync(item) {
        result := ComCall(13, this, "ptr", item, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncActionWithProgress((ptr) => IPropertyValue(ptr).GetTransferProgress(), operation)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @returns {IAsyncActionWithProgress<TransferProgress>} 
     */
    DeleteResourceAsync(uri_) {
        result := ComCall(14, this, "ptr", uri_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncActionWithProgress((ptr) => IPropertyValue(ptr).GetTransferProgress(), operation)
    }

    /**
     * 
     * @param {SyndicationItem} item 
     * @returns {IAsyncActionWithProgress<TransferProgress>} 
     */
    DeleteResourceItemAsync(item) {
        result := ComCall(15, this, "ptr", item, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncActionWithProgress((ptr) => IPropertyValue(ptr).GetTransferProgress(), operation)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CancelAsyncOperations() {
        result := ComCall(16, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
