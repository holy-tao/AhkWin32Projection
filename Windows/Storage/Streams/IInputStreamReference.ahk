#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\IInputStream.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Enables a Windows Runtime component to provide sequential read access to an encapsulated stream.
 * @remarks
 * Implement the IInputStreamReference interface when your Windows Runtime component exposes a sequential read-only stream to callers. For a random access stream, implement the [IRandomAccessStreamReference](irandomaccessstreamreference.md) interface. For info on implementing the IInputStreamReference interface, see the Remarks at [IRandomAccessStreamReference](irandomaccessstreamreference.md).
 * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.iinputstreamreference
 * @namespace Windows.Storage.Streams
 * @version WindowsRuntime 1.4
 */
class IInputStreamReference extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInputStreamReference
     * @type {Guid}
     */
    static IID => Guid("{43929d18-5ec9-4b5a-919c-4205b0c804b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OpenSequentialReadAsync"]

    /**
     * Opens a stream for sequential read access.
     * @returns {IAsyncOperation<IInputStream>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.iinputstreamreference.opensequentialreadasync
     */
    OpenSequentialReadAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IInputStream, operation)
    }
}
