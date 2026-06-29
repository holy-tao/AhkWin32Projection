#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\GPMRSOPMode.ahk" { GPMRSOPMode }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Variant\VARIANT.ahk" { VARIANT }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\IGPMResult.ahk" { IGPMResult }
#Import ".\GPMReportType.ahk" { GPMReportType }

/**
 * The IGPMRSOP interface provides methods that support making Resultant Set of Policy (RSoP) queries in both logging and planning mode.
 * @remarks
 * For more information about security groups, see 
 * <a href="https://docs.microsoft.com/windows/desktop/AD/how-security-groups-are-used-in-access-control">How Security Groups are Used in Access Control</a> in the Active Directory Programmer's Guide.
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmrsop
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct IGPMRSOP extends IDispatch {
    /**
     * The interface identifier for IGPMRSOP
     * @type {Guid}
     */
    static IID := Guid("{49ed785a-3237-4ff2-b1f0-fdf5a8d5a1ee}")

    /**
     * The class identifier for GPMRSOP
     * @type {Guid}
     */
    static CLSID := Guid("{489b0caf-9ec2-4eb7-91f5-b6f71d43da8c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGPMRSOP interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Mode                           : IntPtr
        get_Namespace                      : IntPtr
        put_LoggingComputer                : IntPtr
        get_LoggingComputer                : IntPtr
        put_LoggingUser                    : IntPtr
        get_LoggingUser                    : IntPtr
        put_LoggingFlags                   : IntPtr
        get_LoggingFlags                   : IntPtr
        put_PlanningFlags                  : IntPtr
        get_PlanningFlags                  : IntPtr
        put_PlanningDomainController       : IntPtr
        get_PlanningDomainController       : IntPtr
        put_PlanningSiteName               : IntPtr
        get_PlanningSiteName               : IntPtr
        put_PlanningUser                   : IntPtr
        get_PlanningUser                   : IntPtr
        put_PlanningUserSOM                : IntPtr
        get_PlanningUserSOM                : IntPtr
        put_PlanningUserWMIFilters         : IntPtr
        get_PlanningUserWMIFilters         : IntPtr
        put_PlanningUserSecurityGroups     : IntPtr
        get_PlanningUserSecurityGroups     : IntPtr
        put_PlanningComputer               : IntPtr
        get_PlanningComputer               : IntPtr
        put_PlanningComputerSOM            : IntPtr
        get_PlanningComputerSOM            : IntPtr
        put_PlanningComputerWMIFilters     : IntPtr
        get_PlanningComputerWMIFilters     : IntPtr
        put_PlanningComputerSecurityGroups : IntPtr
        get_PlanningComputerSecurityGroups : IntPtr
        LoggingEnumerateUsers              : IntPtr
        CreateQueryResults                 : IntPtr
        ReleaseQueryResults                : IntPtr
        GenerateReport                     : IntPtr
        GenerateReportToFile               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGPMRSOP.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {GPMRSOPMode} 
     */
    Mode {
        get => this.get_Mode()
    }

    /**
     * @type {BSTR} 
     */
    Namespace {
        get => this.get_Namespace()
    }

    /**
     * @type {BSTR} 
     */
    LoggingComputer {
        get => this.get_LoggingComputer()
        set => this.put_LoggingComputer(value)
    }

    /**
     * @type {BSTR} 
     */
    LoggingUser {
        get => this.get_LoggingUser()
        set => this.put_LoggingUser(value)
    }

    /**
     * @type {Integer} 
     */
    LoggingFlags {
        get => this.get_LoggingFlags()
        set => this.put_LoggingFlags(value)
    }

    /**
     * @type {Integer} 
     */
    PlanningFlags {
        get => this.get_PlanningFlags()
        set => this.put_PlanningFlags(value)
    }

    /**
     * @type {BSTR} 
     */
    PlanningDomainController {
        get => this.get_PlanningDomainController()
        set => this.put_PlanningDomainController(value)
    }

    /**
     * @type {BSTR} 
     */
    PlanningSiteName {
        get => this.get_PlanningSiteName()
        set => this.put_PlanningSiteName(value)
    }

    /**
     * @type {BSTR} 
     */
    PlanningUser {
        get => this.get_PlanningUser()
        set => this.put_PlanningUser(value)
    }

    /**
     * @type {BSTR} 
     */
    PlanningUserSOM {
        get => this.get_PlanningUserSOM()
        set => this.put_PlanningUserSOM(value)
    }

    /**
     * @type {VARIANT} 
     */
    PlanningUserWMIFilters {
        get => this.get_PlanningUserWMIFilters()
        set => this.put_PlanningUserWMIFilters(value)
    }

    /**
     * @type {VARIANT} 
     */
    PlanningUserSecurityGroups {
        get => this.get_PlanningUserSecurityGroups()
        set => this.put_PlanningUserSecurityGroups(value)
    }

    /**
     * @type {BSTR} 
     */
    PlanningComputer {
        get => this.get_PlanningComputer()
        set => this.put_PlanningComputer(value)
    }

    /**
     * @type {BSTR} 
     */
    PlanningComputerSOM {
        get => this.get_PlanningComputerSOM()
        set => this.put_PlanningComputerSOM(value)
    }

    /**
     * @type {VARIANT} 
     */
    PlanningComputerWMIFilters {
        get => this.get_PlanningComputerWMIFilters()
        set => this.put_PlanningComputerWMIFilters(value)
    }

    /**
     * @type {VARIANT} 
     */
    PlanningComputerSecurityGroups {
        get => this.get_PlanningComputerSecurityGroups()
        set => this.put_PlanningComputerSecurityGroups(value)
    }

    /**
     * 
     * @returns {GPMRSOPMode} 
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
        bstrVal := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, bstrVal, "HRESULT")
        return bstrVal
    }

    /**
     * 
     * @param {BSTR} bstrVal 
     * @returns {HRESULT} 
     */
    put_LoggingComputer(bstrVal) {
        bstrVal := bstrVal is String ? BSTR.Alloc(bstrVal).Value : bstrVal

        result := ComCall(9, this, BSTR, bstrVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_LoggingComputer() {
        bstrVal := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, bstrVal, "HRESULT")
        return bstrVal
    }

    /**
     * 
     * @param {BSTR} bstrVal 
     * @returns {HRESULT} 
     */
    put_LoggingUser(bstrVal) {
        bstrVal := bstrVal is String ? BSTR.Alloc(bstrVal).Value : bstrVal

        result := ComCall(11, this, BSTR, bstrVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_LoggingUser() {
        bstrVal := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, bstrVal, "HRESULT")
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

        result := ComCall(17, this, BSTR, bstrVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PlanningDomainController() {
        bstrVal := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, bstrVal, "HRESULT")
        return bstrVal
    }

    /**
     * 
     * @param {BSTR} bstrVal 
     * @returns {HRESULT} 
     */
    put_PlanningSiteName(bstrVal) {
        bstrVal := bstrVal is String ? BSTR.Alloc(bstrVal).Value : bstrVal

        result := ComCall(19, this, BSTR, bstrVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PlanningSiteName() {
        bstrVal := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, bstrVal, "HRESULT")
        return bstrVal
    }

    /**
     * 
     * @param {BSTR} bstrVal 
     * @returns {HRESULT} 
     */
    put_PlanningUser(bstrVal) {
        bstrVal := bstrVal is String ? BSTR.Alloc(bstrVal).Value : bstrVal

        result := ComCall(21, this, BSTR, bstrVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PlanningUser() {
        bstrVal := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, bstrVal, "HRESULT")
        return bstrVal
    }

    /**
     * 
     * @param {BSTR} bstrVal 
     * @returns {HRESULT} 
     */
    put_PlanningUserSOM(bstrVal) {
        bstrVal := bstrVal is String ? BSTR.Alloc(bstrVal).Value : bstrVal

        result := ComCall(23, this, BSTR, bstrVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PlanningUserSOM() {
        bstrVal := BSTR.Owned()
        result := ComCall(24, this, BSTR.Ptr, bstrVal, "HRESULT")
        return bstrVal
    }

    /**
     * 
     * @param {VARIANT} varVal 
     * @returns {HRESULT} 
     */
    put_PlanningUserWMIFilters(varVal) {
        result := ComCall(25, this, VARIANT, varVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_PlanningUserWMIFilters() {
        varVal := VARIANT()
        result := ComCall(26, this, VARIANT.Ptr, varVal, "HRESULT")
        return varVal
    }

    /**
     * 
     * @param {VARIANT} varVal 
     * @returns {HRESULT} 
     */
    put_PlanningUserSecurityGroups(varVal) {
        result := ComCall(27, this, VARIANT, varVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_PlanningUserSecurityGroups() {
        varVal := VARIANT()
        result := ComCall(28, this, VARIANT.Ptr, varVal, "HRESULT")
        return varVal
    }

    /**
     * 
     * @param {BSTR} bstrVal 
     * @returns {HRESULT} 
     */
    put_PlanningComputer(bstrVal) {
        bstrVal := bstrVal is String ? BSTR.Alloc(bstrVal).Value : bstrVal

        result := ComCall(29, this, BSTR, bstrVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PlanningComputer() {
        bstrVal := BSTR.Owned()
        result := ComCall(30, this, BSTR.Ptr, bstrVal, "HRESULT")
        return bstrVal
    }

    /**
     * 
     * @param {BSTR} bstrVal 
     * @returns {HRESULT} 
     */
    put_PlanningComputerSOM(bstrVal) {
        bstrVal := bstrVal is String ? BSTR.Alloc(bstrVal).Value : bstrVal

        result := ComCall(31, this, BSTR, bstrVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PlanningComputerSOM() {
        bstrVal := BSTR.Owned()
        result := ComCall(32, this, BSTR.Ptr, bstrVal, "HRESULT")
        return bstrVal
    }

    /**
     * 
     * @param {VARIANT} varVal 
     * @returns {HRESULT} 
     */
    put_PlanningComputerWMIFilters(varVal) {
        result := ComCall(33, this, VARIANT, varVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_PlanningComputerWMIFilters() {
        varVal := VARIANT()
        result := ComCall(34, this, VARIANT.Ptr, varVal, "HRESULT")
        return varVal
    }

    /**
     * 
     * @param {VARIANT} varVal 
     * @returns {HRESULT} 
     */
    put_PlanningComputerSecurityGroups(varVal) {
        result := ComCall(35, this, VARIANT, varVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_PlanningComputerSecurityGroups() {
        varVal := VARIANT()
        result := ComCall(36, this, VARIANT.Ptr, varVal, "HRESULT")
        return varVal
    }

    /**
     * Enumerates all users who have logging mode data on a specific computer.
     * @returns {VARIANT} Pointer to a SAFEARRAY containing VARIANT members. Each VARIANT contains a Dispatch pointer to  the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmtrustee">IGPMTrustee</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmrsop-loggingenumerateusers
     */
    LoggingEnumerateUsers() {
        varVal := VARIANT()
        result := ComCall(37, this, VARIANT.Ptr, varVal, "HRESULT")
        return varVal
    }

    /**
     * Executes a Resultant Set of Policy (RSoP) query.
     * @remarks
     * Call the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpmrsop-releasequeryresults">IGPMRSOP::ReleaseQueryResults</a> method to release the WMI namespace created by this method.
     * 
     * In the GPMC UI, logging mode is also referred to as "Group Policy Results", and planning mode is also referred to as "Group Policy Modeling".
     * @returns {HRESULT} <h3>JScript</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * 
     * <h3>VB</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmrsop-createqueryresults
     */
    CreateQueryResults() {
        result := ComCall(38, this, "HRESULT")
        return result
    }

    /**
     * Releases the WMI namespace allocated by calls to the IGPMRSOP::CreateQueryResults method and by calls to the IGPM::GetRSOP method.
     * @returns {HRESULT} <h3>JScript</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * 
     * <h3>VB</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmrsop-releasequeryresults
     */
    ReleaseQueryResults() {
        result := ComCall(39, this, "HRESULT")
        return result
    }

    /**
     * The GenerateReport method generates a report on the RSoP data.
     * @param {GPMReportType} _gpmReportType Specifies whether the report is in XML or HTML.
     * @param {Pointer<VARIANT>} pvarGPMProgress Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasyncprogress">IGPMAsyncProgress</a> interface that allows the client to receive status notifications about the progress of report generation. If this parameter is not <b>NULL</b>, the call to <b>GenerateReport</b> is handled asynchronously. If this parameter is <b>NULL</b> the call to <b>GenerateReport</b> is handled synchronously and a pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasynccancel">IGPMAsyncCancel</a> interface is returned in <i>pvarGPMCancel</i>. This parameter must be <b>NULL</b> if the client should not receive asynchronous notifications.
     * @param {Pointer<VARIANT>} pvarGPMCancel Receives a pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasynccancel">IGPMAsyncCancel</a> interface that the client can use to cancel the report generation. This parameter is not returned when <i>pvarGPMProgress</i> is <b>NULL</b>.
     * @returns {IGPMResult} Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmresult">IGPMResult</a>. The <b>Result</b> property contains  a binary string of XML or HTML. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmstatusmessage">Status</a> property contains a reference to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmstatusmsgcollection">IGPMStatusMsgCollection</a>.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmrsop-generatereport
     */
    GenerateReport(_gpmReportType, pvarGPMProgress, pvarGPMCancel) {
        result := ComCall(40, this, GPMReportType, _gpmReportType, VARIANT.Ptr, pvarGPMProgress, VARIANT.Ptr, pvarGPMCancel, "ptr*", &ppIGPMResult := 0, "HRESULT")
        return IGPMResult(ppIGPMResult)
    }

    /**
     * The GenerateReportToFile method generates a report on the RSoP data and saves it to a file at a specified path.
     * @param {GPMReportType} _gpmReportType Specifies whether the report is in XML or HTML.
     * @param {BSTR} bstrTargetFilePath Binary string that contains the path to the file where the report is being saved. Use null-terminated string.
     * 
     * <div class="alert"><b>Note</b>  If the path to the file is not specified, then the report will be created in the "%windir%\system32\" directory.</div>
     * <div> </div>
     * @returns {IGPMResult} Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmresult">IGPMResult</a> interface. The <b>Status</b> property contains a reference to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmstatusmsgcollection">IGPMStatusMsgCollection</a>.
     * 
     * <div class="alert"><b>Note</b>  The value of the <b>Result</b> property of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmresult">IGPMResult</a> interface is indeterminate and should not be relied upon.</div>
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmrsop-generatereporttofile
     */
    GenerateReportToFile(_gpmReportType, bstrTargetFilePath) {
        bstrTargetFilePath := bstrTargetFilePath is String ? BSTR.Alloc(bstrTargetFilePath).Value : bstrTargetFilePath

        result := ComCall(41, this, GPMReportType, _gpmReportType, BSTR, bstrTargetFilePath, "ptr*", &ppIGPMResult := 0, "HRESULT")
        return IGPMResult(ppIGPMResult)
    }

    Query(iid) {
        if (IGPMRSOP.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Mode := CallbackCreate(GetMethod(implObj, "get_Mode"), flags, 2)
        this.vtbl.get_Namespace := CallbackCreate(GetMethod(implObj, "get_Namespace"), flags, 2)
        this.vtbl.put_LoggingComputer := CallbackCreate(GetMethod(implObj, "put_LoggingComputer"), flags, 2)
        this.vtbl.get_LoggingComputer := CallbackCreate(GetMethod(implObj, "get_LoggingComputer"), flags, 2)
        this.vtbl.put_LoggingUser := CallbackCreate(GetMethod(implObj, "put_LoggingUser"), flags, 2)
        this.vtbl.get_LoggingUser := CallbackCreate(GetMethod(implObj, "get_LoggingUser"), flags, 2)
        this.vtbl.put_LoggingFlags := CallbackCreate(GetMethod(implObj, "put_LoggingFlags"), flags, 2)
        this.vtbl.get_LoggingFlags := CallbackCreate(GetMethod(implObj, "get_LoggingFlags"), flags, 2)
        this.vtbl.put_PlanningFlags := CallbackCreate(GetMethod(implObj, "put_PlanningFlags"), flags, 2)
        this.vtbl.get_PlanningFlags := CallbackCreate(GetMethod(implObj, "get_PlanningFlags"), flags, 2)
        this.vtbl.put_PlanningDomainController := CallbackCreate(GetMethod(implObj, "put_PlanningDomainController"), flags, 2)
        this.vtbl.get_PlanningDomainController := CallbackCreate(GetMethod(implObj, "get_PlanningDomainController"), flags, 2)
        this.vtbl.put_PlanningSiteName := CallbackCreate(GetMethod(implObj, "put_PlanningSiteName"), flags, 2)
        this.vtbl.get_PlanningSiteName := CallbackCreate(GetMethod(implObj, "get_PlanningSiteName"), flags, 2)
        this.vtbl.put_PlanningUser := CallbackCreate(GetMethod(implObj, "put_PlanningUser"), flags, 2)
        this.vtbl.get_PlanningUser := CallbackCreate(GetMethod(implObj, "get_PlanningUser"), flags, 2)
        this.vtbl.put_PlanningUserSOM := CallbackCreate(GetMethod(implObj, "put_PlanningUserSOM"), flags, 2)
        this.vtbl.get_PlanningUserSOM := CallbackCreate(GetMethod(implObj, "get_PlanningUserSOM"), flags, 2)
        this.vtbl.put_PlanningUserWMIFilters := CallbackCreate(GetMethod(implObj, "put_PlanningUserWMIFilters"), flags, 2)
        this.vtbl.get_PlanningUserWMIFilters := CallbackCreate(GetMethod(implObj, "get_PlanningUserWMIFilters"), flags, 2)
        this.vtbl.put_PlanningUserSecurityGroups := CallbackCreate(GetMethod(implObj, "put_PlanningUserSecurityGroups"), flags, 2)
        this.vtbl.get_PlanningUserSecurityGroups := CallbackCreate(GetMethod(implObj, "get_PlanningUserSecurityGroups"), flags, 2)
        this.vtbl.put_PlanningComputer := CallbackCreate(GetMethod(implObj, "put_PlanningComputer"), flags, 2)
        this.vtbl.get_PlanningComputer := CallbackCreate(GetMethod(implObj, "get_PlanningComputer"), flags, 2)
        this.vtbl.put_PlanningComputerSOM := CallbackCreate(GetMethod(implObj, "put_PlanningComputerSOM"), flags, 2)
        this.vtbl.get_PlanningComputerSOM := CallbackCreate(GetMethod(implObj, "get_PlanningComputerSOM"), flags, 2)
        this.vtbl.put_PlanningComputerWMIFilters := CallbackCreate(GetMethod(implObj, "put_PlanningComputerWMIFilters"), flags, 2)
        this.vtbl.get_PlanningComputerWMIFilters := CallbackCreate(GetMethod(implObj, "get_PlanningComputerWMIFilters"), flags, 2)
        this.vtbl.put_PlanningComputerSecurityGroups := CallbackCreate(GetMethod(implObj, "put_PlanningComputerSecurityGroups"), flags, 2)
        this.vtbl.get_PlanningComputerSecurityGroups := CallbackCreate(GetMethod(implObj, "get_PlanningComputerSecurityGroups"), flags, 2)
        this.vtbl.LoggingEnumerateUsers := CallbackCreate(GetMethod(implObj, "LoggingEnumerateUsers"), flags, 2)
        this.vtbl.CreateQueryResults := CallbackCreate(GetMethod(implObj, "CreateQueryResults"), flags, 1)
        this.vtbl.ReleaseQueryResults := CallbackCreate(GetMethod(implObj, "ReleaseQueryResults"), flags, 1)
        this.vtbl.GenerateReport := CallbackCreate(GetMethod(implObj, "GenerateReport"), flags, 5)
        this.vtbl.GenerateReportToFile := CallbackCreate(GetMethod(implObj, "GenerateReportToFile"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Mode)
        CallbackFree(this.vtbl.get_Namespace)
        CallbackFree(this.vtbl.put_LoggingComputer)
        CallbackFree(this.vtbl.get_LoggingComputer)
        CallbackFree(this.vtbl.put_LoggingUser)
        CallbackFree(this.vtbl.get_LoggingUser)
        CallbackFree(this.vtbl.put_LoggingFlags)
        CallbackFree(this.vtbl.get_LoggingFlags)
        CallbackFree(this.vtbl.put_PlanningFlags)
        CallbackFree(this.vtbl.get_PlanningFlags)
        CallbackFree(this.vtbl.put_PlanningDomainController)
        CallbackFree(this.vtbl.get_PlanningDomainController)
        CallbackFree(this.vtbl.put_PlanningSiteName)
        CallbackFree(this.vtbl.get_PlanningSiteName)
        CallbackFree(this.vtbl.put_PlanningUser)
        CallbackFree(this.vtbl.get_PlanningUser)
        CallbackFree(this.vtbl.put_PlanningUserSOM)
        CallbackFree(this.vtbl.get_PlanningUserSOM)
        CallbackFree(this.vtbl.put_PlanningUserWMIFilters)
        CallbackFree(this.vtbl.get_PlanningUserWMIFilters)
        CallbackFree(this.vtbl.put_PlanningUserSecurityGroups)
        CallbackFree(this.vtbl.get_PlanningUserSecurityGroups)
        CallbackFree(this.vtbl.put_PlanningComputer)
        CallbackFree(this.vtbl.get_PlanningComputer)
        CallbackFree(this.vtbl.put_PlanningComputerSOM)
        CallbackFree(this.vtbl.get_PlanningComputerSOM)
        CallbackFree(this.vtbl.put_PlanningComputerWMIFilters)
        CallbackFree(this.vtbl.get_PlanningComputerWMIFilters)
        CallbackFree(this.vtbl.put_PlanningComputerSecurityGroups)
        CallbackFree(this.vtbl.get_PlanningComputerSecurityGroups)
        CallbackFree(this.vtbl.LoggingEnumerateUsers)
        CallbackFree(this.vtbl.CreateQueryResults)
        CallbackFree(this.vtbl.ReleaseQueryResults)
        CallbackFree(this.vtbl.GenerateReport)
        CallbackFree(this.vtbl.GenerateReportToFile)
    }
}
