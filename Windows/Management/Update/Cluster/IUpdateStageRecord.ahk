#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class IUpdateStageRecord extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateStageRecord
     * @type {Guid}
     */
    static IID => Guid("{60d8edf9-eb18-59d1-badb-5d862f9352e9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UpdateId", "get_Status", "get_FailureMessage", "get_UpdatedPluginSpecificData"]

    /**
     * @type {HSTRING} 
     */
    UpdateId {
        get => this.get_UpdateId()
    }

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {HSTRING} 
     */
    FailureMessage {
        get => this.get_FailureMessage()
    }

    /**
     * @type {HSTRING} 
     */
    UpdatedPluginSpecificData {
        get => this.get_UpdatedPluginSpecificData()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UpdateId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FailureMessage() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UpdatedPluginSpecificData() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
