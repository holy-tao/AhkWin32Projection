#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Search
 * @version WindowsRuntime 1.4
 */
class IContentIndexer extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContentIndexer
     * @type {Guid}
     */
    static IID => Guid("{b1767f8d-f698-4982-b05f-3a6e8cab01a2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddAsync", "UpdateAsync", "DeleteAsync", "DeleteMultipleAsync", "DeleteAllAsync", "RetrievePropertiesAsync", "get_Revision"]

    /**
     * @type {Integer} 
     */
    Revision {
        get => this.get_Revision()
    }

    /**
     * 
     * @param {IIndexableContent} indexableContent_ 
     * @returns {IAsyncAction} 
     */
    AddAsync(indexableContent_) {
        result := ComCall(6, this, "ptr", indexableContent_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {IIndexableContent} indexableContent_ 
     * @returns {IAsyncAction} 
     */
    UpdateAsync(indexableContent_) {
        result := ComCall(7, this, "ptr", indexableContent_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {HSTRING} contentId 
     * @returns {IAsyncAction} 
     */
    DeleteAsync(contentId) {
        if(contentId is String) {
            pin := HSTRING.Create(contentId)
            contentId := pin.Value
        }
        contentId := contentId is Win32Handle ? NumGet(contentId, "ptr") : contentId

        result := ComCall(8, this, "ptr", contentId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} contentIds 
     * @returns {IAsyncAction} 
     */
    DeleteMultipleAsync(contentIds) {
        result := ComCall(9, this, "ptr", contentIds, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    DeleteAllAsync() {
        result := ComCall(10, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {HSTRING} contentId 
     * @param {IIterable<HSTRING>} propertiesToRetrieve 
     * @returns {IAsyncOperation<IMapView<HSTRING, IInspectable>>} 
     */
    RetrievePropertiesAsync(contentId, propertiesToRetrieve) {
        if(contentId is String) {
            pin := HSTRING.Create(contentId)
            contentId := pin.Value
        }
        contentId := contentId is Win32Handle ? NumGet(contentId, "ptr") : contentId

        result := ComCall(11, this, "ptr", contentId, "ptr", propertiesToRetrieve, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IMapView.Call.Bind(IMapView, (ptr) => HSTRING({ Value: ptr }), IInspectable), operation)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Revision() {
        result := ComCall(12, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
