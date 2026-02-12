#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandUiccAppRecordDetailsResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains details about results of a UICC application record read operation initiated with [MobileBroadbandUiccAppClass.GetRecordDetailsAsync](mobilebroadbanduiccapp_getrecorddetailsasync_306973478.md).
 * @remarks
 * Your code does not instantiate this class directly. Instead, use instances returned by the [MobileBroadbandUiccApp.GetRecordDetailsAsync](mobilebroadbanduiccapp_getrecorddetailsasync_306973478.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanduiccapprecorddetailsresult
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandUiccAppRecordDetailsResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandUiccAppRecordDetailsResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandUiccAppRecordDetailsResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status of the operation to retrieve UICC application record details. If this value is not **Success**, then other properties might not contain valid values.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanduiccapprecorddetailsresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets an enumeration value specifying what kind of record this is.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanduiccapprecorddetailsresult.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the count of this record in the list of records provided by this UICC application.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanduiccapprecorddetailsresult.recordcount
     * @type {Integer} 
     */
    RecordCount {
        get => this.get_RecordCount()
    }

    /**
     * Gets the size in bytes of this record.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanduiccapprecorddetailsresult.recordsize
     * @type {Integer} 
     */
    RecordSize {
        get => this.get_RecordSize()
    }

    /**
     * Gets a value specifying how read access to this record is determined.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanduiccapprecorddetailsresult.readaccesscondition
     * @type {Integer} 
     */
    ReadAccessCondition {
        get => this.get_ReadAccessCondition()
    }

    /**
     * Gets a value specifying how write access to this record is determined.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanduiccapprecorddetailsresult.writeaccesscondition
     * @type {Integer} 
     */
    WriteAccessCondition {
        get => this.get_WriteAccessCondition()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IMobileBroadbandUiccAppRecordDetailsResult")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandUiccAppRecordDetailsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandUiccAppRecordDetailsResult := IMobileBroadbandUiccAppRecordDetailsResult(outPtr)
        }

        return this.__IMobileBroadbandUiccAppRecordDetailsResult.get_Status()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IMobileBroadbandUiccAppRecordDetailsResult")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandUiccAppRecordDetailsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandUiccAppRecordDetailsResult := IMobileBroadbandUiccAppRecordDetailsResult(outPtr)
        }

        return this.__IMobileBroadbandUiccAppRecordDetailsResult.get_Kind()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RecordCount() {
        if (!this.HasProp("__IMobileBroadbandUiccAppRecordDetailsResult")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandUiccAppRecordDetailsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandUiccAppRecordDetailsResult := IMobileBroadbandUiccAppRecordDetailsResult(outPtr)
        }

        return this.__IMobileBroadbandUiccAppRecordDetailsResult.get_RecordCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RecordSize() {
        if (!this.HasProp("__IMobileBroadbandUiccAppRecordDetailsResult")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandUiccAppRecordDetailsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandUiccAppRecordDetailsResult := IMobileBroadbandUiccAppRecordDetailsResult(outPtr)
        }

        return this.__IMobileBroadbandUiccAppRecordDetailsResult.get_RecordSize()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReadAccessCondition() {
        if (!this.HasProp("__IMobileBroadbandUiccAppRecordDetailsResult")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandUiccAppRecordDetailsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandUiccAppRecordDetailsResult := IMobileBroadbandUiccAppRecordDetailsResult(outPtr)
        }

        return this.__IMobileBroadbandUiccAppRecordDetailsResult.get_ReadAccessCondition()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WriteAccessCondition() {
        if (!this.HasProp("__IMobileBroadbandUiccAppRecordDetailsResult")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandUiccAppRecordDetailsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandUiccAppRecordDetailsResult := IMobileBroadbandUiccAppRecordDetailsResult(outPtr)
        }

        return this.__IMobileBroadbandUiccAppRecordDetailsResult.get_WriteAccessCondition()
    }

;@endregion Instance Methods
}
