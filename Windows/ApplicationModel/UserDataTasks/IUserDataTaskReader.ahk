#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\UserDataTaskBatch.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.UserDataTasks
 * @version WindowsRuntime 1.4
 */
class IUserDataTaskReader extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserDataTaskReader
     * @type {Guid}
     */
    static IID => Guid("{03e688b1-4ccf-4500-883b-e76290cfed63}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReadBatchAsync"]

    /**
     * 
     * @returns {IAsyncOperation<UserDataTaskBatch>} 
     */
    ReadBatchAsync() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(UserDataTaskBatch, result_)
    }
}
