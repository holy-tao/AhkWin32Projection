#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandUiccAppReadRecordResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Encapsulates the results of a UICC application record read operation.
 * @remarks
 * Your code does not instantiate this class directly. Instead, use the instance returned when you call the [MobileBroadbandUiccApp.ReadRecordAsync](mobilebroadbanduiccapp_readrecordasync_1910963636.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanduiccappreadrecordresult
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandUiccAppReadRecordResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandUiccAppReadRecordResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandUiccAppReadRecordResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value which indicates whether the record read completed successfully.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanduiccappreadrecordresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the data returned by the application record read operation. Note that if *Status* is not **Success**, this value may be invalid or empty.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanduiccappreadrecordresult.data
     * @type {IBuffer} 
     */
    Data {
        get => this.get_Data()
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
        if (!this.HasProp("__IMobileBroadbandUiccAppReadRecordResult")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandUiccAppReadRecordResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandUiccAppReadRecordResult := IMobileBroadbandUiccAppReadRecordResult(outPtr)
        }

        return this.__IMobileBroadbandUiccAppReadRecordResult.get_Status()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Data() {
        if (!this.HasProp("__IMobileBroadbandUiccAppReadRecordResult")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandUiccAppReadRecordResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandUiccAppReadRecordResult := IMobileBroadbandUiccAppReadRecordResult(outPtr)
        }

        return this.__IMobileBroadbandUiccAppReadRecordResult.get_Data()
    }

;@endregion Instance Methods
}
