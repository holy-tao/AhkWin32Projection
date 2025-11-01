#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IADs.ahk

/**
 * The IADsService interface is a dual interface that inherits from IADs.
 * @remarks
 * 
  * The system services are published in the underlying directory. Some may be running, others may not. To verify the status or to operate on any of the services, use the properties and methods of the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsserviceoperations">IADsServiceOperations</a> interface.
  * 
  * File service is a special case of the system service. The  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsfileservice">IADsFileService</a> and  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsfileserviceoperations">IADsFileServiceOperations</a> interfaces support additional features unique to file services.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadsservice
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsService extends IADs{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsService
     * @type {Guid}
     */
    static IID => Guid("{68af66e0-31ca-11cf-a98a-00aa006bc149}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HostComputer", "put_HostComputer", "get_DisplayName", "put_DisplayName", "get_Version", "put_Version", "get_ServiceType", "put_ServiceType", "get_StartType", "put_StartType", "get_Path", "put_Path", "get_StartupParameters", "put_StartupParameters", "get_ErrorControl", "put_ErrorControl", "get_LoadOrderGroup", "put_LoadOrderGroup", "get_ServiceAccountName", "put_ServiceAccountName", "get_ServiceAccountPath", "put_ServiceAccountPath", "get_Dependencies", "put_Dependencies"]

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_HostComputer(retval) {
        result := ComCall(20, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrHostComputer 
     * @returns {HRESULT} 
     */
    put_HostComputer(bstrHostComputer) {
        bstrHostComputer := bstrHostComputer is String ? BSTR.Alloc(bstrHostComputer).Value : bstrHostComputer

        result := ComCall(21, this, "ptr", bstrHostComputer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_DisplayName(retval) {
        result := ComCall(22, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrDisplayName 
     * @returns {HRESULT} 
     */
    put_DisplayName(bstrDisplayName) {
        bstrDisplayName := bstrDisplayName is String ? BSTR.Alloc(bstrDisplayName).Value : bstrDisplayName

        result := ComCall(23, this, "ptr", bstrDisplayName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_Version(retval) {
        result := ComCall(24, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrVersion 
     * @returns {HRESULT} 
     */
    put_Version(bstrVersion) {
        bstrVersion := bstrVersion is String ? BSTR.Alloc(bstrVersion).Value : bstrVersion

        result := ComCall(25, this, "ptr", bstrVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_ServiceType(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(26, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lnServiceType 
     * @returns {HRESULT} 
     */
    put_ServiceType(lnServiceType) {
        result := ComCall(27, this, "int", lnServiceType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_StartType(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(28, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lnStartType 
     * @returns {HRESULT} 
     */
    put_StartType(lnStartType) {
        result := ComCall(29, this, "int", lnStartType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_Path(retval) {
        result := ComCall(30, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPath 
     * @returns {HRESULT} 
     */
    put_Path(bstrPath) {
        bstrPath := bstrPath is String ? BSTR.Alloc(bstrPath).Value : bstrPath

        result := ComCall(31, this, "ptr", bstrPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_StartupParameters(retval) {
        result := ComCall(32, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrStartupParameters 
     * @returns {HRESULT} 
     */
    put_StartupParameters(bstrStartupParameters) {
        bstrStartupParameters := bstrStartupParameters is String ? BSTR.Alloc(bstrStartupParameters).Value : bstrStartupParameters

        result := ComCall(33, this, "ptr", bstrStartupParameters, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_ErrorControl(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(34, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lnErrorControl 
     * @returns {HRESULT} 
     */
    put_ErrorControl(lnErrorControl) {
        result := ComCall(35, this, "int", lnErrorControl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_LoadOrderGroup(retval) {
        result := ComCall(36, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrLoadOrderGroup 
     * @returns {HRESULT} 
     */
    put_LoadOrderGroup(bstrLoadOrderGroup) {
        bstrLoadOrderGroup := bstrLoadOrderGroup is String ? BSTR.Alloc(bstrLoadOrderGroup).Value : bstrLoadOrderGroup

        result := ComCall(37, this, "ptr", bstrLoadOrderGroup, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_ServiceAccountName(retval) {
        result := ComCall(38, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrServiceAccountName 
     * @returns {HRESULT} 
     */
    put_ServiceAccountName(bstrServiceAccountName) {
        bstrServiceAccountName := bstrServiceAccountName is String ? BSTR.Alloc(bstrServiceAccountName).Value : bstrServiceAccountName

        result := ComCall(39, this, "ptr", bstrServiceAccountName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_ServiceAccountPath(retval) {
        result := ComCall(40, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrServiceAccountPath 
     * @returns {HRESULT} 
     */
    put_ServiceAccountPath(bstrServiceAccountPath) {
        bstrServiceAccountPath := bstrServiceAccountPath is String ? BSTR.Alloc(bstrServiceAccountPath).Value : bstrServiceAccountPath

        result := ComCall(41, this, "ptr", bstrServiceAccountPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} retval 
     * @returns {HRESULT} 
     */
    get_Dependencies(retval) {
        result := ComCall(42, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} vDependencies 
     * @returns {HRESULT} 
     */
    put_Dependencies(vDependencies) {
        result := ComCall(43, this, "ptr", vDependencies, "HRESULT")
        return result
    }
}
