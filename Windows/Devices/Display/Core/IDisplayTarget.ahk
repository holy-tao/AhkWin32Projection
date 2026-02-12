#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DisplayAdapter.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DisplayMonitor.ahk
#Include ..\..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class IDisplayTarget extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayTarget
     * @type {Guid}
     */
    static IID => Guid("{aec57c6f-47b4-546b-987c-e73fa791fe3a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Adapter", "get_DeviceInterfacePath", "get_AdapterRelativeId", "get_IsConnected", "get_IsVirtualModeEnabled", "get_IsVirtualTopologyEnabled", "get_UsageKind", "get_MonitorPersistence", "get_StableMonitorId", "TryGetMonitor", "get_Properties", "get_IsStale", "IsSame", "IsEqual"]

    /**
     * @type {DisplayAdapter} 
     */
    Adapter {
        get => this.get_Adapter()
    }

    /**
     * @type {HSTRING} 
     */
    DeviceInterfacePath {
        get => this.get_DeviceInterfacePath()
    }

    /**
     * @type {Integer} 
     */
    AdapterRelativeId {
        get => this.get_AdapterRelativeId()
    }

    /**
     * @type {Boolean} 
     */
    IsConnected {
        get => this.get_IsConnected()
    }

    /**
     * @type {Boolean} 
     */
    IsVirtualModeEnabled {
        get => this.get_IsVirtualModeEnabled()
    }

    /**
     * @type {Boolean} 
     */
    IsVirtualTopologyEnabled {
        get => this.get_IsVirtualTopologyEnabled()
    }

    /**
     * @type {Integer} 
     */
    UsageKind {
        get => this.get_UsageKind()
    }

    /**
     * @type {Integer} 
     */
    MonitorPersistence {
        get => this.get_MonitorPersistence()
    }

    /**
     * @type {HSTRING} 
     */
    StableMonitorId {
        get => this.get_StableMonitorId()
    }

    /**
     * @type {IMapView<Guid, IInspectable>} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * @type {Boolean} 
     */
    IsStale {
        get => this.get_IsStale()
    }

    /**
     * 
     * @returns {DisplayAdapter} 
     */
    get_Adapter() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DisplayAdapter(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceInterfacePath() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AdapterRelativeId() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsConnected() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVirtualModeEnabled() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVirtualTopologyEnabled() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UsageKind() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MonitorPersistence() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_StableMonitorId() {
        value := HSTRING()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DisplayMonitor} 
     */
    TryGetMonitor() {
        result := ComCall(15, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DisplayMonitor(result_)
    }

    /**
     * 
     * @returns {IMapView<Guid, IInspectable>} 
     */
    get_Properties() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMapView((ptr) => IPropertyValue(ptr).GetGuid(), IInspectable, value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStale() {
        result := ComCall(17, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {DisplayTarget} otherTarget 
     * @returns {Boolean} 
     */
    IsSame(otherTarget) {
        result := ComCall(18, this, "ptr", otherTarget, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Evaluates to a Boolean value that indicates whether two CLSIDs are equal.
     * @param {DisplayTarget} otherTarget 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/api//content/guiddef/nf-guiddef-isequalclsid
     */
    IsEqual(otherTarget) {
        result := ComCall(19, this, "ptr", otherTarget, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
