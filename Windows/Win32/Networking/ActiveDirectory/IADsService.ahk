#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
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
     * @type {BSTR} 
     */
    HostComputer {
        get => this.get_HostComputer()
        set => this.put_HostComputer(value)
    }

    /**
     * @type {BSTR} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * @type {BSTR} 
     */
    Version {
        get => this.get_Version()
        set => this.put_Version(value)
    }

    /**
     * @type {Integer} 
     */
    ServiceType {
        get => this.get_ServiceType()
        set => this.put_ServiceType(value)
    }

    /**
     * @type {Integer} 
     */
    StartType {
        get => this.get_StartType()
        set => this.put_StartType(value)
    }

    /**
     * @type {BSTR} 
     */
    Path {
        get => this.get_Path()
        set => this.put_Path(value)
    }

    /**
     * @type {BSTR} 
     */
    StartupParameters {
        get => this.get_StartupParameters()
        set => this.put_StartupParameters(value)
    }

    /**
     * @type {Integer} 
     */
    ErrorControl {
        get => this.get_ErrorControl()
        set => this.put_ErrorControl(value)
    }

    /**
     * @type {BSTR} 
     */
    LoadOrderGroup {
        get => this.get_LoadOrderGroup()
        set => this.put_LoadOrderGroup(value)
    }

    /**
     * @type {BSTR} 
     */
    ServiceAccountName {
        get => this.get_ServiceAccountName()
        set => this.put_ServiceAccountName(value)
    }

    /**
     * @type {BSTR} 
     */
    ServiceAccountPath {
        get => this.get_ServiceAccountPath()
        set => this.put_ServiceAccountPath(value)
    }

    /**
     * @type {VARIANT} 
     */
    Dependencies {
        get => this.get_Dependencies()
        set => this.put_Dependencies(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_HostComputer() {
        retval := BSTR()
        result := ComCall(20, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {BSTR} 
     */
    get_DisplayName() {
        retval := BSTR()
        result := ComCall(22, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {BSTR} 
     */
    get_Version() {
        retval := BSTR()
        result := ComCall(24, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {Integer} 
     */
    get_ServiceType() {
        result := ComCall(26, this, "int*", &retval := 0, "HRESULT")
        return retval
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
     * @returns {Integer} 
     */
    get_StartType() {
        result := ComCall(28, this, "int*", &retval := 0, "HRESULT")
        return retval
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
     * @returns {BSTR} 
     */
    get_Path() {
        retval := BSTR()
        result := ComCall(30, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {BSTR} 
     */
    get_StartupParameters() {
        retval := BSTR()
        result := ComCall(32, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {Integer} 
     */
    get_ErrorControl() {
        result := ComCall(34, this, "int*", &retval := 0, "HRESULT")
        return retval
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
     * @returns {BSTR} 
     */
    get_LoadOrderGroup() {
        retval := BSTR()
        result := ComCall(36, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {BSTR} 
     */
    get_ServiceAccountName() {
        retval := BSTR()
        result := ComCall(38, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {BSTR} 
     */
    get_ServiceAccountPath() {
        retval := BSTR()
        result := ComCall(40, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {VARIANT} 
     */
    get_Dependencies() {
        retval := VARIANT()
        result := ComCall(42, this, "ptr", retval, "HRESULT")
        return retval
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
