#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<BSTR>} strWMIObjectPath 
     * @returns {HRESULT} 
     */
    get_WMIObjectPath(strWMIObjectPath) {
        result := ComCall(7, this, "ptr", strWMIObjectPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISWbemObject>} objWMIObject 
     * @returns {HRESULT} 
     */
    GetWMIObject(objWMIObject) {
        result := ComCall(8, this, "ptr*", objWMIObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISWbemServices>} objWMIServices 
     * @returns {HRESULT} 
     */
    GetWMIServices(objWMIServices) {
        result := ComCall(9, this, "ptr*", objWMIServices, "HRESULT")
        return result
    }
}
