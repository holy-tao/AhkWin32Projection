#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\IChatItem.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class IChatSearchReader extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IChatSearchReader
     * @type {Guid}
     */
    static IID => Guid("{4665fe49-9020-4752-980d-39612325f589}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReadBatchAsync", "ReadBatchWithCountAsync"]

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<IChatItem>>} 
     */
    ReadBatchAsync() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, IChatItem), result_)
    }

    /**
     * 
     * @param {Integer} count 
     * @returns {IAsyncOperation<IVectorView<IChatItem>>} 
     */
    ReadBatchWithCountAsync(count) {
        result := ComCall(7, this, "int", count, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, IChatItem), result_)
    }
}
