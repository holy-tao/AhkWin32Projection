#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a sequential-access output stream that indicates a request for the data stream of a [StorageFile](storagefile.md) that was created by calling [CreateStreamedFileAsync](storagefile_createstreamedfileasync_1143300277.md) or [ReplaceWithStreamedFileAsync](storagefile_replacewithstreamedfileasync_1583738949.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.istreamedfiledatarequest
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class IStreamedFileDataRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamedFileDataRequest
     * @type {Guid}
     */
    static IID => Guid("{1673fcce-dabd-4d50-beee-180b8a8191b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FailAndClose"]

    /**
     * Indicates that the data can't be streamed and releases system resources that are exposed by the current stream indicating that the data request is complete.
     * @param {Integer} failureMode The enum value that indicates why the data stream can't be accessed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istreamedfiledatarequest.failandclose
     */
    FailAndClose(failureMode) {
        result := ComCall(6, this, "int", failureMode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
