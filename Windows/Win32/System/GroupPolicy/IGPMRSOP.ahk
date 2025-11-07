#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Variant\VARIANT.ahk
#Include .\IGPMResult.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMRSOP interface provides methods that support making Resultant Set of Policy (RSoP) queries in both logging and planning mode.
 * @remarks
 * 
 * For more information about security groups, see 
 * <a href="https://docs.microsoft.com/windows/desktop/AD/how-security-groups-are-used-in-access-control">How Security Groups are Used in Access Control</a> in the Active Directory Programmer's Guide.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmrsop
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMRSOP extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPMRSOP
     * @type {Guid}
     */
    static IID => Guid("{49ed785a-3237-4ff2-b1f0-fdf5a8d5a1ee}")

    /**
     * The class identifier for GPMRSOP
     * @type {Guid}
     */
    static CLSID => Guid("{489b0caf-9ec2-4eb7-91f5-b6f71d43da8c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Mode", "get_Namespace", "put_LoggingComputer", "get_LoggingComputer", "put_LoggingUser", "get_LoggingUser", "put_LoggingFlags", "get_LoggingFlags", "put_PlanningFlags", "get_PlanningFlags", "put_PlanningDomainController", "get_PlanningDomainController", "put_PlanningSiteName", "get_PlanningSiteName", "put_PlanningUser", "get_PlanningUser", "put_PlanningUserSOM", "get_PlanningUserSOM", "put_PlanningUserWMIFilters", "get_PlanningUserWMIFilters", "put_PlanningUserSecurityGroups", "get_PlanningUserSecurityGroups", "put_PlanningComputer", "get_PlanningComputer", "put_PlanningComputerSOM", "get_PlanningComputerSOM", "put_PlanningComputerWMIFilters", "get_PlanningComputerWMIFilters", "put_PlanningComputerSecurityGroups", "get_PlanningComputerSecurityGroups", "LoggingEnumerateUsers", "CreateQueryResults", "ReleaseQueryResults", "GenerateReport", "GenerateReportToFile"]

    /**
     * 
     * @returns {Integer} 
     */
    get_Mode() {
        result := ComCall(7, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Namespace() {
        bstrVal := BSTR()
        result := ComCall(8, this, "ptr", bstrVal, "HRESULT")
        return bstrVal
    }

    /**
     * 
     * @param {BSTR} bstrVal 
     * @returns {HRESULT} 
     */
    put_LoggingComputer(bstrVal) {
        bstrVal := bstrVal is String ? BSTR.Alloc(bstrVal).Value : bstrVal

        result := ComCall(9, this, "ptr", bstrVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_LoggingComputer() {
        bstrVal := BSTR()
        result := ComCall(10, this, "ptr", bstrVal, "HRESULT")
        return bstrVal
    }

    /**
     * 
     * @param {BSTR} bstrVal 
     * @returns {HRESULT} 
     */
    put_LoggingUser(bstrVal) {
        bstrVal := bstrVal is String ? BSTR.Alloc(bstrVal).Value : bstrVal

        result := ComCall(11, this, "ptr", bstrVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_LoggingUser() {
        bstrVal := BSTR()
        result := ComCall(12, this, "ptr", bstrVal, "HRESULT")
        return bstrVal
    }

    /**
     * 
     * @param {Integer} lVal 
     * @returns {HRESULT} 
     */
    put_LoggingFlags(lVal) {
        result := ComCall(13, this, "int", lVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LoggingFlags() {
        result := ComCall(14, this, "int*", &lVal := 0, "HRESULT")
        return lVal
    }

    /**
     * 
     * @param {Integer} lVal 
     * @returns {HRESULT} 
     */
    put_PlanningFlags(lVal) {
        result := ComCall(15, this, "int", lVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PlanningFlags() {
        result := ComCall(16, this, "int*", &lVal := 0, "HRESULT")
        return lVal
    }

    /**
     * 
     * @param {BSTR} bstrVal 
     * @returns {HRESULT} 
     */
    put_PlanningDomainController(bstrVal) {
        bstrVal := bstrVal is String ? BSTR.Alloc(bstrVal).Value : bstrVal

        result := ComCall(17, this, "ptr", bstrVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PlanningDomainController() {
        bstrVal := BSTR()
        result := ComCall(18, this, "ptr", bstrVal, "HRESULT")
        return bstrVal
    }

    /**
     * 
     * @param {BSTR} bstrVal 
     * @returns {HRESULT} 
     */
    put_PlanningSiteName(bstrVal) {
        bstrVal := bstrVal is String ? BSTR.Alloc(bstrVal).Value : bstrVal

        result := ComCall(19, this, "ptr", bstrVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PlanningSiteName() {
        bstrVal := BSTR()
        result := ComCall(20, this, "ptr", bstrVal, "HRESULT")
        return bstrVal
    }

    /**
     * 
     * @param {BSTR} bstrVal 
     * @returns {HRESULT} 
     */
    put_PlanningUser(bstrVal) {
        bstrVal := bstrVal is String ? BSTR.Alloc(bstrVal).Value : bstrVal

        result := ComCall(21, this, "ptr", bstrVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PlanningUser() {
        bstrVal := BSTR()
        result := ComCall(22, this, "ptr", bstrVal, "HRESULT")
        return bstrVal
    }

    /**
     * 
     * @param {BSTR} bstrVal 
     * @returns {HRESULT} 
     */
    put_PlanningUserSOM(bstrVal) {
        bstrVal := bstrVal is String ? BSTR.Alloc(bstrVal).Value : bstrVal

        result := ComCall(23, this, "ptr", bstrVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PlanningUserSOM() {
        bstrVal := BSTR()
        result := ComCall(24, this, "ptr", bstrVal, "HRESULT")
        return bstrVal
    }

    /**
     * 
     * @param {VARIANT} varVal 
     * @returns {HRESULT} 
     */
    put_PlanningUserWMIFilters(varVal) {
        result := ComCall(25, this, "ptr", varVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_PlanningUserWMIFilters() {
        varVal := VARIANT()
        result := ComCall(26, this, "ptr", varVal, "HRESULT")
        return varVal
    }

    /**
     * 
     * @param {VARIANT} varVal 
     * @returns {HRESULT} 
     */
    put_PlanningUserSecurityGroups(varVal) {
        result := ComCall(27, this, "ptr", varVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_PlanningUserSecurityGroups() {
        varVal := VARIANT()
        result := ComCall(28, this, "ptr", varVal, "HRESULT")
        return varVal
    }

    /**
     * 
     * @param {BSTR} bstrVal 
     * @returns {HRESULT} 
     */
    put_PlanningComputer(bstrVal) {
        bstrVal := bstrVal is String ? BSTR.Alloc(bstrVal).Value : bstrVal

        result := ComCall(29, this, "ptr", bstrVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PlanningComputer() {
        bstrVal := BSTR()
        result := ComCall(30, this, "ptr", bstrVal, "HRESULT")
        return bstrVal
    }

    /**
     * 
     * @param {BSTR} bstrVal 
     * @returns {HRESULT} 
     */
    put_PlanningComputerSOM(bstrVal) {
        bstrVal := bstrVal is String ? BSTR.Alloc(bstrVal).Value : bstrVal

        result := ComCall(31, this, "ptr", bstrVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PlanningComputerSOM() {
        bstrVal := BSTR()
        result := ComCall(32, this, "ptr", bstrVal, "HRESULT")
        return bstrVal
    }

    /**
     * 
     * @param {VARIANT} varVal 
     * @returns {HRESULT} 
     */
    put_PlanningComputerWMIFilters(varVal) {
        result := ComCall(33, this, "ptr", varVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_PlanningComputerWMIFilters() {
        varVal := VARIANT()
        result := ComCall(34, this, "ptr", varVal, "HRESULT")
        return varVal
    }

    /**
     * 
     * @param {VARIANT} varVal 
     * @returns {HRESULT} 
     */
    put_PlanningComputerSecurityGroups(varVal) {
        result := ComCall(35, this, "ptr", varVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_PlanningComputerSecurityGroups() {
        varVal := VARIANT()
        result := ComCall(36, this, "ptr", varVal, "HRESULT")
        return varVal
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmrsop-loggingenumerateusers
     */
    LoggingEnumerateUsers() {
        varVal := VARIANT()
        result := ComCall(37, this, "ptr", varVal, "HRESULT")
        return varVal
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmrsop-createqueryresults
     */
    CreateQueryResults() {
        result := ComCall(38, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmrsop-releasequeryresults
     */
    ReleaseQueryResults() {
        result := ComCall(39, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} gpmReportType 
     * @param {Pointer<VARIANT>} pvarGPMProgress 
     * @param {Pointer<VARIANT>} pvarGPMCancel 
     * @returns {IGPMResult} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmrsop-generatereport
     */
    GenerateReport(gpmReportType, pvarGPMProgress, pvarGPMCancel) {
        result := ComCall(40, this, "int", gpmReportType, "ptr", pvarGPMProgress, "ptr", pvarGPMCancel, "ptr*", &ppIGPMResult := 0, "HRESULT")
        return IGPMResult(ppIGPMResult)
    }

    /**
     * 
     * @param {Integer} gpmReportType 
     * @param {BSTR} bstrTargetFilePath 
     * @returns {IGPMResult} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmrsop-generatereporttofile
     */
    GenerateReportToFile(gpmReportType, bstrTargetFilePath) {
        bstrTargetFilePath := bstrTargetFilePath is String ? BSTR.Alloc(bstrTargetFilePath).Value : bstrTargetFilePath

        result := ComCall(41, this, "int", gpmReportType, "ptr", bstrTargetFilePath, "ptr*", &ppIGPMResult := 0, "HRESULT")
        return IGPMResult(ppIGPMResult)
    }
}
