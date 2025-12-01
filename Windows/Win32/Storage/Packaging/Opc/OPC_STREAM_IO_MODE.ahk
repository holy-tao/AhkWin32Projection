#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Describes the read/write status of a stream.
 * @remarks
 * <div class="alert"><b>Important</b>  <p class="note">Reading and writing to the same package is not recommended and may result in undefined behavior.
 * 
 * </div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/msopc/ne-msopc-opc_stream_io_mode
 * @namespace Windows.Win32.Storage.Packaging.Opc
 * @version v4.0.30319
 */
class OPC_STREAM_IO_MODE extends Win32Enum{

    /**
     * Creates a read-only stream for loading an existing package.
     * @type {Integer (Int32)}
     */
    static OPC_STREAM_IO_READ => 1

    /**
     * Creates a write-only stream for saving a new package.
     * @type {Integer (Int32)}
     */
    static OPC_STREAM_IO_WRITE => 2
}
