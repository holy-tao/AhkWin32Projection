#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISWbemObject.ahk
#Include .\ISWbemServices.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWMIExtension extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMIExtension
     * @type {Guid}
     */
    static IID => Guid("{adc1f06e-5c7e-11d2-8b74-00104b2afb41}")

    /**
     * The class identifier for WMIExtension
     * @type {Guid}
     */
    static CLSID => Guid("{f0975afe-5c7f-11d2-8b74-00104b2afb41}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_WMIObjectPath", "GetWMIObject", "GetWMIServices"]

    /**
     * @type {BSTR} 
     */
    WMIObjectPath {
        get => this.get_WMIObjectPath()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_WMIObjectPath() {
        strWMIObjectPath := BSTR()
        result := ComCall(7, this, "ptr", strWMIObjectPath, "HRESULT")
        return strWMIObjectPath
    }

    /**
     * 
     * @returns {ISWbemObject} 
     */
    GetWMIObject() {
        result := ComCall(8, this, "ptr*", &objWMIObject := 0, "HRESULT")
        return ISWbemObject(objWMIObject)
    }

    /**
     * 
     * @returns {ISWbemServices} 
     */
    GetWMIServices() {
        result := ComCall(9, this, "ptr*", &objWMIServices := 0, "HRESULT")
        return ISWbemServices(objWMIServices)
    }
}
