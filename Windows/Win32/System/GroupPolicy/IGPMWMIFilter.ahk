#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMWMIFilter interface contains methods that allow you to set and retrieve security attributes and various properties for a WMI filter. WMI filter queries are specified using WMI Query Language (WQL).
 * @remarks
 * 
  * For information about importing, exporting, and copying WMI filters, see the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemclassobject-getobjecttext">IWbemClassObject::GetObjectText</a> and 
  * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-imofcompiler-compilebuffer">IMofCompiler::CompileBuffer</a> methods in the WMI SDK.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmwmifilter
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMWMIFilter extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPMWMIFilter
     * @type {Guid}
     */
    static IID => Guid("{ef2ff9b4-3c27-459a-b979-038305cec75d}")

    /**
     * The class identifier for GPMWMIFilter
     * @type {Guid}
     */
    static CLSID => Guid("{626745d8-0dea-4062-bf60-cfc5b1ca1286}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Path", "put_Name", "get_Name", "put_Description", "get_Description", "GetQueryList", "GetSecurityInfo", "SetSecurityInfo"]

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_Path(pVal) {
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     */
    put_Name(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(8, this, "ptr", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_Name(pVal) {
        result := ComCall(9, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     */
    put_Description(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(10, this, "ptr", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_Description(pVal) {
        result := ComCall(11, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pQryList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmwmifilter-getquerylist
     */
    GetQueryList(pQryList) {
        result := ComCall(12, this, "ptr", pQryList, "HRESULT")
        return result
    }

    /**
     * Retrieves a copy of the security descriptor for an object specified by a handle.
     * @param {Pointer<IGPMSecurityInfo>} ppSecurityInfo 
     * @returns {HRESULT} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in WinError.h.
     * @see https://docs.microsoft.com/windows/win32/api//aclapi/nf-aclapi-getsecurityinfo
     */
    GetSecurityInfo(ppSecurityInfo) {
        result := ComCall(13, this, "ptr*", ppSecurityInfo, "HRESULT")
        return result
    }

    /**
     * Sets specified security information in the security descriptor of a specified object. The caller identifies the object by a handle.
     * @param {IGPMSecurityInfo} pSecurityInfo 
     * @returns {HRESULT} If the function succeeds, the function returns ERROR_SUCCESS.
     * 
     * If the function fails, it returns a nonzero error code defined in WinError.h.
     * @see https://docs.microsoft.com/windows/win32/api//aclapi/nf-aclapi-setsecurityinfo
     */
    SetSecurityInfo(pSecurityInfo) {
        result := ComCall(14, this, "ptr", pSecurityInfo, "HRESULT")
        return result
    }
}
