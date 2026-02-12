#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\Com\IUnknown.ahk

/**
 * Represents the method that will stream data into a [StorageFile](storagefile.md) when that file is first accessed.
 * @remarks
 * The instance of the delegate that you create will produce the data stream for the [StorageFile](storagefile.md) that was returned by the [CreateStreamedFileAsync](storagefile_createstreamedfileasync_1143300277.md) or [ReplaceWithStreamedFileAsync](storagefile_replacewithstreamedfileasync_1583738949.md) method.
 * 
 * When you use the [CreateStreamedFileAsync](storagefile_createstreamedfileasync_1143300277.md) or [ReplaceWithStreamedFileAsync](storagefile_replacewithstreamedfileasync_1583738949.md) method together with an instance of StreamedFileDataRequestedHandler, you can provide the data for a file on demand instead of writing the contents of a file when you create it. That is, you can defer expensive operations to produce the data for the file until the file is first accessed.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.streamedfiledatarequestedhandler
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class StreamedFileDataRequestedHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for StreamedFileDataRequestedHandler
     * @type {Guid}
     */
    static IID => Guid("{fef6a824-2fe1-4d07-a35b-b77c50b5f4cc}")

    /**
     * The class identifier for StreamedFileDataRequestedHandler
     * @type {Guid}
     */
    static CLSID => Guid("{fef6a824-2fe1-4d07-a35b-b77c50b5f4cc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {StreamedFileDataRequest} stream 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(stream) {
        result := ComCall(3, this, "ptr", stream, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
