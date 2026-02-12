#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class IWindowsUpdateManagerScanOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsUpdateManagerScanOptions
     * @type {Guid}
     */
    static IID => Guid("{b7c30113-5e4b-59d8-99ad-f58d67b2aefc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsUserInitiated", "put_IsUserInitiated", "get_AllowBypassThrottling", "put_AllowBypassThrottling", "get_PerformUpdateActions", "put_PerformUpdateActions"]

    /**
     * @type {Boolean} 
     */
    IsUserInitiated {
        get => this.get_IsUserInitiated()
        set => this.put_IsUserInitiated(value)
    }

    /**
     * @type {Boolean} 
     */
    AllowBypassThrottling {
        get => this.get_AllowBypassThrottling()
        set => this.put_AllowBypassThrottling(value)
    }

    /**
     * @type {Boolean} 
     */
    PerformUpdateActions {
        get => this.get_PerformUpdateActions()
        set => this.put_PerformUpdateActions(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsUserInitiated() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsUserInitiated(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowBypassThrottling() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowBypassThrottling(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_PerformUpdateActions() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_PerformUpdateActions(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
