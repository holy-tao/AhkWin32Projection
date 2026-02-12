#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\MobileBroadbandUiccAppRecordDetailsResult.ahk
#Include .\MobileBroadbandUiccAppReadRecordResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IMobileBroadbandUiccApp extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMobileBroadbandUiccApp
     * @type {Guid}
     */
    static IID => Guid("{4d170556-98a1-43dd-b2ec-50c90cf248df}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_Kind", "GetRecordDetailsAsync", "ReadRecordAsync"]

    /**
     * @type {IBuffer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Id() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {IIterable<Integer>} uiccFilePath 
     * @returns {IAsyncOperation<MobileBroadbandUiccAppRecordDetailsResult>} 
     */
    GetRecordDetailsAsync(uiccFilePath) {
        result := ComCall(8, this, "ptr", uiccFilePath, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MobileBroadbandUiccAppRecordDetailsResult, asyncInfo)
    }

    /**
     * 
     * @param {IIterable<Integer>} uiccFilePath 
     * @param {Integer} recordIndex 
     * @returns {IAsyncOperation<MobileBroadbandUiccAppReadRecordResult>} 
     */
    ReadRecordAsync(uiccFilePath, recordIndex) {
        result := ComCall(9, this, "ptr", uiccFilePath, "int", recordIndex, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MobileBroadbandUiccAppReadRecordResult, asyncInfo)
    }
}
