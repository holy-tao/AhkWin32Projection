#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\DataPackage.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\DataRequestDeferral.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class IDataRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataRequest
     * @type {Guid}
     */
    static IID => Guid("{4341ae3b-fc12-4e53-8c02-ac714c415a27}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Data", "put_Data", "get_Deadline", "FailWithDisplayText", "GetDeferral"]

    /**
     * @type {DataPackage} 
     */
    Data {
        get => this.get_Data()
        set => this.put_Data(value)
    }

    /**
     * @type {DateTime} 
     */
    Deadline {
        get => this.get_Deadline()
    }

    /**
     * 
     * @returns {DataPackage} 
     */
    get_Data() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataPackage(value)
    }

    /**
     * 
     * @param {DataPackage} value 
     * @returns {HRESULT} 
     */
    put_Data(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Deadline() {
        value := DateTime()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    FailWithDisplayText(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DataRequestDeferral} 
     */
    GetDeferral() {
        result := ComCall(10, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataRequestDeferral(result_)
    }
}
