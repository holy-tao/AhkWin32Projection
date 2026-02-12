#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include Streams\IRandomAccessStream.ahk
#Include ..\Foundation\IAsyncAction.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class IStorageStreamTransaction extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageStreamTransaction
     * @type {Guid}
     */
    static IID => Guid("{f67cf363-a53d-4d94-ae2c-67232d93acdd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Stream", "CommitAsync"]

    /**
     * @type {IRandomAccessStream} 
     */
    Stream {
        get => this.get_Stream()
    }

    /**
     * 
     * @returns {IRandomAccessStream} 
     */
    get_Stream() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRandomAccessStream(value)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    CommitAsync() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
