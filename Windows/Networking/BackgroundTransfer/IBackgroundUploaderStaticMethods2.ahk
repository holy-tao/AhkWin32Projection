#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\UploadOperation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class IBackgroundUploaderStaticMethods2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundUploaderStaticMethods2
     * @type {Guid}
     */
    static IID => Guid("{e919ac62-ea08-42f0-a2ac-07e467549080}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrentUploadsForTransferGroupAsync"]

    /**
     * 
     * @param {BackgroundTransferGroup} group 
     * @returns {IAsyncOperation<IVectorView<UploadOperation>>} 
     */
    GetCurrentUploadsForTransferGroupAsync(group) {
        result := ComCall(6, this, "ptr", group, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, UploadOperation), operation)
    }
}
