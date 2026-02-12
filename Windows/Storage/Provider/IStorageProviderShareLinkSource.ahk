#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class IStorageProviderShareLinkSource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageProviderShareLinkSource
     * @type {Guid}
     */
    static IID => Guid("{4c6055e2-029c-5539-8e51-a1afc838b5cb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateLinkAsync", "GetDefaultAccessControlStringAsync", "GetState"]

    /**
     * 
     * @param {IVectorView<IStorageItem>} storageItemList 
     * @returns {IAsyncOperation<Uri>} 
     */
    CreateLinkAsync(storageItemList) {
        result := ComCall(6, this, "ptr", storageItemList, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(Uri, operation)
    }

    /**
     * 
     * @param {IVectorView<IStorageItem>} storageItemList 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    GetDefaultAccessControlStringAsync(storageItemList) {
        result := ComCall(7, this, "ptr", storageItemList, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), operation)
    }

    /**
     * Gets current Interaction Context state and the time when the context will return to idle state.
     * @remarks
     * After interaction ends, the interaction context might still be busy reporting inertia, or expecting second tap in a double tap gesture (in general, if multi-stroke gesture is possible). This function allows the caller to find out when it is safe to treat the Interaction Context object as idle. The main purpose of this function is management of pools of interaction contexts.
     * @param {IVectorView<IStorageItem>} storageItemList 
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api//content/interactioncontext/nf-interactioncontext-getstateinteractioncontext
     */
    GetState(storageItemList) {
        result := ComCall(8, this, "ptr", storageItemList, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }
}
