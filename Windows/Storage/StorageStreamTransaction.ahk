#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageStreamTransaction.ahk
#Include ..\Foundation\IClosable.ahk
#Include ..\..\Guid.ahk

/**
 * Represents a write transaction for a random-access stream.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.storagestreamtransaction
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class StorageStreamTransaction extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorageStreamTransaction

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorageStreamTransaction.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the random-access stream used in the transaction.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagestreamtransaction.stream
     * @type {IRandomAccessStream} 
     */
    Stream {
        get => this.get_Stream()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {IRandomAccessStream} 
     */
    get_Stream() {
        if (!this.HasProp("__IStorageStreamTransaction")) {
            if ((queryResult := this.QueryInterface(IStorageStreamTransaction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageStreamTransaction := IStorageStreamTransaction(outPtr)
        }

        return this.__IStorageStreamTransaction.get_Stream()
    }

    /**
     * Save the stream to the underlying file.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagestreamtransaction.commitasync
     */
    CommitAsync() {
        if (!this.HasProp("__IStorageStreamTransaction")) {
            if ((queryResult := this.QueryInterface(IStorageStreamTransaction.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageStreamTransaction := IStorageStreamTransaction(outPtr)
        }

        return this.__IStorageStreamTransaction.CommitAsync()
    }

    /**
     * Releases system resources that are exposed by the stream, indicating that the data request is complete.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagestreamtransaction.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
