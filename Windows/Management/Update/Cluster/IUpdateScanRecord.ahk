#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class IUpdateScanRecord extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateScanRecord
     * @type {Guid}
     */
    static IID => Guid("{c54af4fb-d316-5480-954f-d1eb51961de5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UpdateId", "get_UpdateTitle", "get_UpdateDescription", "get_IsRebootRequired", "get_PluginSpecificData"]

    /**
     * @type {HSTRING} 
     */
    UpdateId {
        get => this.get_UpdateId()
    }

    /**
     * @type {HSTRING} 
     */
    UpdateTitle {
        get => this.get_UpdateTitle()
    }

    /**
     * @type {HSTRING} 
     */
    UpdateDescription {
        get => this.get_UpdateDescription()
    }

    /**
     * @type {Boolean} 
     */
    IsRebootRequired {
        get => this.get_IsRebootRequired()
    }

    /**
     * @type {HSTRING} 
     */
    PluginSpecificData {
        get => this.get_PluginSpecificData()
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
     * @returns {HSTRING} 
     */
    get_UpdateTitle() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UpdateDescription() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRebootRequired() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PluginSpecificData() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
