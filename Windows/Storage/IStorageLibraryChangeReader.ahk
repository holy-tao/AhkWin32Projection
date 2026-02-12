#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include ..\Foundation\Collections\IVectorView.ahk
#Include .\StorageLibraryChange.ahk
#Include ..\Foundation\IAsyncAction.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class IStorageLibraryChangeReader extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageLibraryChangeReader
     * @type {Guid}
     */
    static IID => Guid("{f205bc83-fca2-41f9-8954-ee2e991eb96f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReadBatchAsync", "AcceptChangesAsync"]

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<StorageLibraryChange>>} 
     */
    ReadBatchAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, StorageLibraryChange), operation)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    AcceptChangesAsync() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
