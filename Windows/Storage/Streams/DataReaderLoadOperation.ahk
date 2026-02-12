#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IAsyncInfo.ahk
#Include ..\..\..\Guid.ahk

/**
 * Loads data from an input stream.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datareaderloadoperation
 * @namespace Windows.Storage.Streams
 * @version WindowsRuntime 1.4
 */
class DataReaderLoadOperation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAsyncOperation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAsyncOperation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the handler to call when the data load operation is complete.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datareaderloadoperation.completed
     * @type {AsyncOperationCompletedHandler<Generic>} 
     */
    Completed {
        get => this.get_Completed()
        set => this.put_Completed(value)
    }

    /**
     * Gets a unique identifier that represents the data load operation.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datareaderloadoperation.id
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the current status of the data load operation.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datareaderloadoperation.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the error code for the data load operation if it fails.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datareaderloadoperation.errorcode
     * @type {HRESULT} 
     */
    ErrorCode {
        get => this.get_ErrorCode()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @param {AsyncOperationCompletedHandler<Generic>} handler 
     * @returns {HRESULT} 
     */
    put_Completed(handler) {
        if (!this.HasProp("__IAsyncOperation")) {
            piid := Guid("{ef60385f-be78-584b-aaef-7829ada2b0de}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsyncOperation := IAsyncOperation((ptr) => IPropertyValue(ptr).GetUInt32(), outPtr)
        }

        return this.__IAsyncOperation.put_Completed(handler)
    }

    /**
     * 
     * @returns {AsyncOperationCompletedHandler<Generic>} 
     */
    get_Completed() {
        if (!this.HasProp("__IAsyncOperation")) {
            piid := Guid("{ef60385f-be78-584b-aaef-7829ada2b0de}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsyncOperation := IAsyncOperation((ptr) => IPropertyValue(ptr).GetUInt32(), outPtr)
        }

        return this.__IAsyncOperation.get_Completed()
    }

    /**
     * Returns the result of the data load operation.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datareaderloadoperation.getresults
     */
    GetResults() {
        if (!this.HasProp("__IAsyncOperation")) {
            piid := Guid("{ef60385f-be78-584b-aaef-7829ada2b0de}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsyncOperation := IAsyncOperation((ptr) => IPropertyValue(ptr).GetUInt32(), outPtr)
        }

        return this.__IAsyncOperation.GetResults()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Id() {
        if (!this.HasProp("__IAsyncInfo")) {
            if ((queryResult := this.QueryInterface(IAsyncInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsyncInfo := IAsyncInfo(outPtr)
        }

        return this.__IAsyncInfo.get_Id()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IAsyncInfo")) {
            if ((queryResult := this.QueryInterface(IAsyncInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsyncInfo := IAsyncInfo(outPtr)
        }

        return this.__IAsyncInfo.get_Status()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ErrorCode() {
        if (!this.HasProp("__IAsyncInfo")) {
            if ((queryResult := this.QueryInterface(IAsyncInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsyncInfo := IAsyncInfo(outPtr)
        }

        return this.__IAsyncInfo.get_ErrorCode()
    }

    /**
     * Requests the cancellation of the data load operation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datareaderloadoperation.cancel
     */
    Cancel() {
        if (!this.HasProp("__IAsyncInfo")) {
            if ((queryResult := this.QueryInterface(IAsyncInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsyncInfo := IAsyncInfo(outPtr)
        }

        return this.__IAsyncInfo.Cancel()
    }

    /**
     * Requests that work associated with the data load operation should stop.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.datareaderloadoperation.close
     */
    Close() {
        if (!this.HasProp("__IAsyncInfo")) {
            if ((queryResult := this.QueryInterface(IAsyncInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsyncInfo := IAsyncInfo(outPtr)
        }

        return this.__IAsyncInfo.Close()
    }

;@endregion Instance Methods
}
