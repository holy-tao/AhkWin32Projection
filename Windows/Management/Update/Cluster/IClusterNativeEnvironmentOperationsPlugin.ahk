#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\UpdatePluginVersionInfo.ahk
#Include ..\..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\IClusterNativeEnvironmentOperations.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class IClusterNativeEnvironmentOperationsPlugin extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IClusterNativeEnvironmentOperationsPlugin
     * @type {Guid}
     */
    static IID => Guid("{534b9984-3201-5a90-a42b-42d9c98c961a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_FriendlyName", "get_Description", "get_Version", "get_DefaultOptions", "CreateEnvironmentOperations"]

    /**
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {HSTRING} 
     */
    FriendlyName {
        get => this.get_FriendlyName()
    }

    /**
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * @type {UpdatePluginVersionInfo} 
     */
    Version {
        get => this.get_Version()
    }

    /**
     * @type {IMapView<HSTRING, HSTRING>} 
     */
    DefaultOptions {
        get => this.get_DefaultOptions()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
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
    get_FriendlyName() {
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
    get_Description() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {UpdatePluginVersionInfo} 
     */
    get_Version() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UpdatePluginVersionInfo(value)
    }

    /**
     * 
     * @returns {IMapView<HSTRING, HSTRING>} 
     */
    get_DefaultOptions() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMapView((ptr) => HSTRING({ Value: ptr }), (ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @param {HSTRING} clusterName 
     * @param {HSTRING} runId 
     * @param {IMap<HSTRING, HSTRING>} options 
     * @param {ClusterUpdateServices} updateServices 
     * @returns {IClusterNativeEnvironmentOperations} 
     */
    CreateEnvironmentOperations(clusterName, runId, options, updateServices) {
        if(clusterName is String) {
            pin := HSTRING.Create(clusterName)
            clusterName := pin.Value
        }
        clusterName := clusterName is Win32Handle ? NumGet(clusterName, "ptr") : clusterName
        if(runId is String) {
            pin := HSTRING.Create(runId)
            runId := pin.Value
        }
        runId := runId is Win32Handle ? NumGet(runId, "ptr") : runId

        result := ComCall(11, this, "ptr", clusterName, "ptr", runId, "ptr", options, "ptr", updateServices, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IClusterNativeEnvironmentOperations(result_)
    }
}
