#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\DownloadOperation.ahk
#Include .\UploadOperation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class IBackgroundTransferCompletionGroupTriggerDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundTransferCompletionGroupTriggerDetails
     * @type {Guid}
     */
    static IID => Guid("{7b6be286-6e47-5136-7fcb-fa4389f46f5b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Downloads", "get_Uploads"]

    /**
     * @type {IVectorView<DownloadOperation>} 
     */
    Downloads {
        get => this.get_Downloads()
    }

    /**
     * @type {IVectorView<UploadOperation>} 
     */
    Uploads {
        get => this.get_Uploads()
    }

    /**
     * 
     * @returns {IVectorView<DownloadOperation>} 
     */
    get_Downloads() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(DownloadOperation, value)
    }

    /**
     * 
     * @returns {IVectorView<UploadOperation>} 
     */
    get_Uploads() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(UploadOperation, value)
    }
}
