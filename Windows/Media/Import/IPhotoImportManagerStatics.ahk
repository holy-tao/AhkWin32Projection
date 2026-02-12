#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\PhotoImportSource.ahk
#Include .\PhotoImportOperation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Import
 * @version WindowsRuntime 1.4
 */
class IPhotoImportManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhotoImportManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{2771903d-a046-4f06-9b9c-bfd662e83287}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsSupportedAsync", "FindAllSourcesAsync", "GetPendingOperations"]

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    IsSupportedAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<PhotoImportSource>>} 
     */
    FindAllSourcesAsync() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, PhotoImportSource), operation)
    }

    /**
     * 
     * @returns {IVectorView<PhotoImportOperation>} 
     */
    GetPendingOperations() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(PhotoImportOperation, result_)
    }
}
