#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\IRandomAccessStreamWithContentType.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Enables a Windows Runtime component to provide access to an encapsulated stream.
 * @remarks
 * Implement the IRandomAccessStreamReference interface when your Windows Runtime component exposes a random access stream to callers. For a sequential read-only stream, implement the [IInputStreamReference](iinputstreamreference.md) interface.
 * 
 * For example, a [StorageFile](../windows.storage/storagefile.md) provides an [IRandomAccessStream](irandomaccessstream.md) for the contents of a file, so it implements the IRandomAccessStreamReference interface. Usually, providing a stream requires accessing the hard disk, so stream operations are asynchronous. Components that consume file content receive an IRandomAccessStreamReference instead of a [StorageFile](../windows.storage/storagefile.md) reference, because this interface is the more minimal requirement for the input parameter.
 * 
 * > [!IMPORTANT]
 * > Not all sources can provide random access streams efficiently. If a component requires only sequential read access, consider implementing the [IInputStreamReference](iinputstreamreference.md) interface instead of the IRandomAccessStreamReference interface.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.irandomaccessstreamreference
 * @namespace Windows.Storage.Streams
 * @version WindowsRuntime 1.4
 */
class IRandomAccessStreamReference extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRandomAccessStreamReference
     * @type {Guid}
     */
    static IID => Guid("{33ee3134-1dd6-4e3a-8067-d1c162e8642b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OpenReadAsync"]

    /**
     * Opens a stream for random access.
     * @returns {IAsyncOperation<IRandomAccessStreamWithContentType>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.irandomaccessstreamreference.openreadasync
     */
    OpenReadAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IRandomAccessStreamWithContentType, operation)
    }
}
