#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include .\DataProviderDeferral.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class IDataProviderRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataProviderRequest
     * @type {Guid}
     */
    static IID => Guid("{ebbc7157-d3c8-47da-acde-f82388d5f716}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FormatId", "get_Deadline", "GetDeferral", "SetData"]

    /**
     * @type {HSTRING} 
     */
    FormatId {
        get => this.get_FormatId()
    }

    /**
     * @type {DateTime} 
     */
    Deadline {
        get => this.get_Deadline()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FormatId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Deadline() {
        value := DateTime()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DataProviderDeferral} 
     */
    GetDeferral() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataProviderDeferral(value)
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    SetData(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
