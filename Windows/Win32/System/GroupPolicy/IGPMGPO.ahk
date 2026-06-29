#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IGPMSecurityInfo.ahk" { IGPMSecurityInfo }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IGPMBackup.ahk" { IGPMBackup }
#Import "..\Variant\VARIANT.ahk" { VARIANT }
#Import ".\IGPMWMIFilter.ahk" { IGPMWMIFilter }
#Import ".\IGPMDomain.ahk" { IGPMDomain }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\GPMReportType.ahk" { GPMReportType }
#Import ".\IGPMResult.ahk" { IGPMResult }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The IGPMGPO interface supports methods that enable you to manage Group Policy Objects (GPOs) in the directory service.
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmgpo
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct IGPMGPO extends IDispatch {
    /**
     * The interface identifier for IGPMGPO
     * @type {Guid}
     */
    static IID := Guid("{58cc4352-1ca3-48e5-9864-1da4d6e0d60f}")

    /**
     * The class identifier for GPMGPO
     * @type {Guid}
     */
    static CLSID := Guid("{d2ce2994-59b5-4064-b581-4d68486a16c4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGPMGPO interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_DisplayName                 : IntPtr
        put_DisplayName                 : IntPtr
        get_Path                        : IntPtr
        get_ID                          : IntPtr
        get_DomainName                  : IntPtr
        get_CreationTime                : IntPtr
        get_ModificationTime            : IntPtr
        get_UserDSVersionNumber         : IntPtr
        get_ComputerDSVersionNumber     : IntPtr
        get_UserSysvolVersionNumber     : IntPtr
        get_ComputerSysvolVersionNumber : IntPtr
        GetWMIFilter                    : IntPtr
        SetWMIFilter                    : IntPtr
        SetUserEnabled                  : IntPtr
        SetComputerEnabled              : IntPtr
        IsUserEnabled                   : IntPtr
        IsComputerEnabled               : IntPtr
        GetSecurityInfo                 : IntPtr
        SetSecurityInfo                 : IntPtr
        Delete                          : IntPtr
        Backup                          : IntPtr
        Import                          : IntPtr
        GenerateReport                  : IntPtr
        GenerateReportToFile            : IntPtr
        CopyTo                          : IntPtr
        SetSecurityDescriptor           : IntPtr
        GetSecurityDescriptor           : IntPtr
        IsACLConsistent                 : IntPtr
        MakeACLConsistent               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGPMGPO.Vtbl()
        }
        super.__New(implObj, flags)
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
    Path {
        get => this.get_Path()
    }

    /**
     * @type {BSTR} 
     */
    ID {
        get => this.get_ID()
    }

    /**
     * @type {BSTR} 
     */
    DomainName {
        get => this.get_DomainName()
    }

    /**
     * @type {Float} 
     */
    CreationTime {
        get => this.get_CreationTime()
    }

    /**
     * @type {Float} 
     */
    ModificationTime {
        get => this.get_ModificationTime()
    }

    /**
     * @type {Integer} 
     */
    UserDSVersionNumber {
        get => this.get_UserDSVersionNumber()
    }

    /**
     * @type {Integer} 
     */
    ComputerDSVersionNumber {
        get => this.get_ComputerDSVersionNumber()
    }

    /**
     * @type {Integer} 
     */
    UserSysvolVersionNumber {
        get => this.get_UserSysvolVersionNumber()
    }

    /**
     * @type {Integer} 
     */
    ComputerSysvolVersionNumber {
        get => this.get_ComputerSysvolVersionNumber()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DisplayName() {
        pVal := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     */
    put_DisplayName(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(8, this, BSTR, newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Path() {
        pVal := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ID() {
        pVal := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DomainName() {
        pVal := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CreationTime() {
        result := ComCall(12, this, "double*", &pDate := 0, "HRESULT")
        return pDate
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ModificationTime() {
        result := ComCall(13, this, "double*", &pDate := 0, "HRESULT")
        return pDate
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UserDSVersionNumber() {
        result := ComCall(14, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ComputerDSVersionNumber() {
        result := ComCall(15, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UserSysvolVersionNumber() {
        result := ComCall(16, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ComputerSysvolVersionNumber() {
        result := ComCall(17, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the GPMWMIFilter object linked to the Group Policy object (GPO).
     * @returns {IGPMWMIFilter} Address of a pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmwmifilter">IGPMWMIFilter</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmgpo-getwmifilter
     */
    GetWMIFilter() {
        result := ComCall(18, this, "ptr*", &ppIGPMWMIFilter := 0, "HRESULT")
        return IGPMWMIFilter(ppIGPMWMIFilter)
    }

    /**
     * Links the GPMWMIFilter object to the current Group Policy object (GPO). This method can also be used to unlink existing WMI filters from the GPO.
     * @param {IGPMWMIFilter} pIGPMWMIFilter Pointer to the WMI filter to associate with the current GPO. Passing <b>NULL</b> in this parameter unlinks any existing WMI filters.
     * @returns {HRESULT} <h3>JScript</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * 
     * <h3>VB</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmgpo-setwmifilter
     */
    SetWMIFilter(pIGPMWMIFilter) {
        result := ComCall(19, this, "ptr", pIGPMWMIFilter, "HRESULT")
        return result
    }

    /**
     * Enables or disables the user settings in the GPO.
     * @param {VARIANT_BOOL} vbEnabled Specifies whether to enable the user settings in the GPO.
     * 
     * <b>C++:  </b>If <b>VARIANT_TRUE</b>, the method enables the settings; otherwise, the method disables them.
     * 
     * <b>Scripting:  </b>If true, the method enables the settings; otherwise, the method disables them.
     * @returns {HRESULT} <h3>JScript</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * 
     * <h3>VB</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmgpo-setuserenabled
     */
    SetUserEnabled(vbEnabled) {
        result := ComCall(20, this, VARIANT_BOOL, vbEnabled, "HRESULT")
        return result
    }

    /**
     * Enables or disables the computer settings in the GPO.
     * @param {VARIANT_BOOL} vbEnabled Specifies whether to enable the computer settings in the GPO.
     * 
     * <b>C++:  </b>If <b>VARIANT_TRUE</b>, the method enables the settings; otherwise the method disables them.
     * 
     * <b>Scripting:  </b>If true, the method enables the settings; otherwise the method disables them.
     * @returns {HRESULT} <h3>JScript</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * 
     * <h3>VB</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmgpo-setcomputerenabled
     */
    SetComputerEnabled(vbEnabled) {
        result := ComCall(21, this, VARIANT_BOOL, vbEnabled, "HRESULT")
        return result
    }

    /**
     * Checks whether the user policies in the GPO are enabled.
     * @returns {VARIANT_BOOL} Value that indicates whether the user policies in the GPO are enabled. If <b>VARIANT_TRUE</b>, they are enabled.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmgpo-isuserenabled
     */
    IsUserEnabled() {
        result := ComCall(22, this, VARIANT_BOOL.Ptr, &pvbEnabled := 0, "HRESULT")
        return pvbEnabled
    }

    /**
     * Checks whether the computer policies in the GPO are enabled.
     * @returns {VARIANT_BOOL} Value that indicates whether the computer policies in the GPO are enabled. If <b>VARIANT_TRUE</b>, they are enabled.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmgpo-iscomputerenabled
     */
    IsComputerEnabled() {
        result := ComCall(23, this, VARIANT_BOOL.Ptr, &pvbEnabled := 0, "HRESULT")
        return pvbEnabled
    }

    /**
     * Retrieves the set of permissions for the GPO, such as who is granted permission to edit it.
     * @remarks
     * For more information about policy-related permissions, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpm-createpermission">IGPM::CreatePermission</a>.
     * @returns {IGPMSecurityInfo} Address of a pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmsecurityinfo">IGPMSecurityInfo</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmgpo-getsecurityinfo
     */
    GetSecurityInfo() {
        result := ComCall(24, this, "ptr*", &ppSecurityInfo := 0, "HRESULT")
        return IGPMSecurityInfo(ppSecurityInfo)
    }

    /**
     * Sets the list of permissions for the group policy object (GPO), such as who is granted permission to edit it. The method replaces the existing list of permissions.
     * @remarks
     * For more information about policy-related permissions, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpm-createpermission">IGPM::CreatePermission</a>.
     * @param {IGPMSecurityInfo} pSecurityInfo Pointer to the security information to apply to the GPO.
     * @returns {HRESULT} <h3>JScript</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * 
     * <h3>VB</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmgpo-setsecurityinfo
     */
    SetSecurityInfo(pSecurityInfo) {
        result := ComCall(25, this, "ptr", pSecurityInfo, "HRESULT")
        return result
    }

    /**
     * Deletes a Group Policy object (GPO) from the directory service and from the system volume folder (SYSVOL).
     * @remarks
     * This method does not delete GPO links. To delete GPO links, call the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpmgpolink-delete">IGPMGPOLink::Delete</a> method.
     * @returns {HRESULT} <h3>JScript</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * 
     * <h3>VB</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmgpo-delete
     */
    Delete() {
        result := ComCall(26, this, "HRESULT")
        return result
    }

    /**
     * Backs up a Group Policy object (GPO) to the specified directory.
     * @remarks
     * A GPO that has been backed-up (also called exported) can be restored to the Active Directory by calling the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpmdomain-restoregpo">IGPMDomain::RestoreGPO</a> method or imported into another existing GPO using the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpmgpo-import">IGPMGPO::Import</a> method, depending on the required result.
     * 
     * You must check the code that is returned by the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpmresult-overallstatus">IGPMResult::OverallStatus</a> method as well as the one that is returned by this method to determine whether the operation succeeded. 
     * <b>OverallStatus</b> returns an overall status code for the operation. If no error occurred during the operation, it returns a success code. Otherwise, it returns a failure code.
     * @param {BSTR} bstrBackupDir Name of the file system directory in which the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmbackup">GPMBackup</a> object should be stored. The directory must already exist.
     * @param {BSTR} bstrComment Comment to associate with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmbackup">GPMBackup</a> object.
     * @param {Pointer<VARIANT>} pvarGPMProgress Specifies a pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasyncprogress">IGPMAsyncProgress</a> interface that allows the client to receive status notifications about the progress of the backup operation. The method runs synchronously if this parameter is <b>NULL</b>. The method runs asynchronously if this parameter is not <b>NULL</b>. This parameter must be <b>NULL</b> if the client should not receive asynchronous notifications.
     * @param {Pointer<VARIANT>} pvarGPMCancel Receives a pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasynccancel">IGPMAsyncCancel</a> interface that the client can use to cancel the backup operation. This parameter is not returned if <i>pvarGPMProgress</i> is <b>NULL</b>.
     * @returns {IGPMResult} Address of a pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmresult">IGPMResult</a> interface that represents the result of the backup operation. That interface contains pointers to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmbackup">IGPMBackup</a> interface and to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmstatusmsgcollection">IGPMStatusMsgCollection</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmgpo-backup
     */
    Backup(bstrBackupDir, bstrComment, pvarGPMProgress, pvarGPMCancel) {
        bstrBackupDir := bstrBackupDir is String ? BSTR.Alloc(bstrBackupDir).Value : bstrBackupDir
        bstrComment := bstrComment is String ? BSTR.Alloc(bstrComment).Value : bstrComment

        result := ComCall(27, this, BSTR, bstrBackupDir, BSTR, bstrComment, VARIANT.Ptr, pvarGPMProgress, VARIANT.Ptr, pvarGPMCancel, "ptr*", &ppIGPMResult := 0, "HRESULT")
        return IGPMResult(ppIGPMResult)
    }

    /**
     * Imports the policy settings from the specified GPMBackup object.
     * @remarks
     * An import operation only transfers policy settings. It erases any existing settings in the GPO. An import does not modify the GPO ID or the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-lists">ACLs</a> on the destination GPO, nor does it modify any links that point to the destination GPO or to an associated WMI filter.
     * 
     * <div class="alert"><b>Note</b>  An import operation is similar but different than a copy operation. For an import operation, the source GPO must be in the file system and the destination must be an existing GPO in Active Directory. For a copy operation, the source GPO must be in the Active Directory  and the copy creates a new destination GPO. For more information about copying GPOs, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpmgpo-copyto">IGPMGPO::CopyTo</a>.</div>
     * <div> </div>
     * Note that you must check the code returned by the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpmresult-overallstatus">IGPMResult::OverallStatus</a> method as well as the one returned by this method to determine whether or not the operation succeeded. 
     * <b>OverallStatus</b> returns an overall status code for the operation. If no error occurred during the operation, it returns a success code; otherwise it returns a failure code.
     * 
     * For more information about security groups, see 
     * <a href="https://docs.microsoft.com/windows/desktop/AD/how-security-groups-are-used-in-access-control">How Security Groups are Used in Access Control</a> in the Active Directory Programmer's Guide.
     * @param {Integer} lFlags Specifies the options to use for security principal and path mapping. The following options are defined. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/gpmc/copying-and-importing-gpos-across-domains">Copying and Importing GPOs Across Domains</a>.
     * @param {IGPMBackup} pIGPMBackup Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmbackup">GPMBackup</a> object from which settings should be imported.
     * @param {Pointer<VARIANT>} pvarMigrationTable Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmmigrationtable">IGPMMigrationTable</a> to use for mapping.  This parameter can be <b>NULL</b>.
     * @param {Pointer<VARIANT>} pvarGPMProgress Specifies a pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasyncprogress">IGPMAsyncProgress</a> interface that allows the client to receive status notifications about the progress of the import operation. This parameter must be <b>NULL</b> if the client should not receive asynchronous notifications.
     * @param {Pointer<VARIANT>} pvarGPMCancel Receives a pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasynccancel">IGPMAsyncCancel</a> interface that the client can use to cancel the import operation. This parameter is not returned if <i>pvarGPMProgress</i> is <b>NULL</b>.
     * @returns {IGPMResult} Address of a pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmresult">IGPMResult</a> interface representing the result of the import operation. That interface contains a pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmstatusmsgcollection">IGPMStatusMsgCollection</a> interface and an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmgpo">IGPMGPO</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmgpo-import
     */
    Import(lFlags, pIGPMBackup, pvarMigrationTable, pvarGPMProgress, pvarGPMCancel) {
        result := ComCall(28, this, "int", lFlags, "ptr", pIGPMBackup, VARIANT.Ptr, pvarMigrationTable, VARIANT.Ptr, pvarGPMProgress, VARIANT.Ptr, pvarGPMCancel, "ptr*", &ppIGPMResult := 0, "HRESULT")
        return IGPMResult(ppIGPMResult)
    }

    /**
     * Gets the report for a GPO.
     * @param {GPMReportType} _gpmReportType Specifies whether the report is in XML or HTML.
     * @param {Pointer<VARIANT>} pvarGPMProgress Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasyncprogress">IGPMAsyncProgress</a> interface that allows the client to receive status notifications about the progress of the copy operation. If not <b>NULL</b>, the call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpmbackup-generatereport">GenerateReport</a> is handled asynchronously and <i>pvarGPMCancel</i> receives a pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasynccancel">IGPMAsyncCancel</a> interface.   If this parameter is <b>NULL</b> the call to <b>GenerateReport</b> is handled synchronously. The <i>pvarGPMProgress</i> parameter must be <b>NULL</b> if the client should not receive asynchronous notifications.
     * @param {Pointer<VARIANT>} pvarGPMCancel Receives a pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasynccancel">IGPMAsyncCancel</a> interface that the client can use to cancel the copy operation. This parameter is not returned if <i>pvarGPMProgress</i> is <b>NULL</b>.
     * @returns {IGPMResult} Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmresult">IGPMResult</a> interface. The <b>Result</b> property contains  a binary string of XML or HTML. The <b>Status</b> property contains a reference to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmstatusmsgcollection">IGPMStatusMsgCollection</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmgpo-generatereport
     */
    GenerateReport(_gpmReportType, pvarGPMProgress, pvarGPMCancel) {
        result := ComCall(29, this, GPMReportType, _gpmReportType, VARIANT.Ptr, pvarGPMProgress, VARIANT.Ptr, pvarGPMCancel, "ptr*", &ppIGPMResult := 0, "HRESULT")
        return IGPMResult(ppIGPMResult)
    }

    /**
     * Gets the report for a GPO and then saves the report to a file in a specified path.
     * @param {GPMReportType} _gpmReportType Specifies whether the report is in XML or HTML.
     * @param {BSTR} bstrTargetFilePath Binary string that contains the path of the file in which the report is being saved. Use a null-terminated string.
     * @returns {IGPMResult} Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmresult">IGPMResult</a> interface. The <b>Status</b> property contains a reference to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmstatusmsgcollection">IGPMStatusMsgCollection</a>.
     * 
     * <div class="alert"><b>Note</b>  The value of the <b>Result</b> property of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmresult">IGPMResult</a> interface is indeterminate and should not be relied upon.</div>
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmgpo-generatereporttofile
     */
    GenerateReportToFile(_gpmReportType, bstrTargetFilePath) {
        bstrTargetFilePath := bstrTargetFilePath is String ? BSTR.Alloc(bstrTargetFilePath).Value : bstrTargetFilePath

        result := ComCall(30, this, GPMReportType, _gpmReportType, BSTR, bstrTargetFilePath, "ptr*", &ppIGPMResult := 0, "HRESULT")
        return IGPMResult(ppIGPMResult)
    }

    /**
     * Copies the current Group Policy object (GPO) to the specified domain and then returns a pointer to the copy of the GPO.
     * @remarks
     * The new GPO that is created by using this method is unlinked because a copy operation does not transfer links.
     * 
     * You must check the code that is returned by the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpmresult-overallstatus">IGPMResult::OverallStatus</a> method as well as the one returned by this method to determine whether the operation succeeded. 
     * <b>OverallStatus</b> returns an overall status code for the operation. If no error occurred during the operation, it returns a success code. Otherwise, it returns a failure code.
     * 
     * An import operation is similar to a copy operation, except that in an import operation, the source GPO must be in the file system and the destination must be an existing GPO in Active Directory. In contrast, for a copy operation, the source GPO must be in Active Directory. A copy operation creates a new destination GPO. An import operation transfers only policy settings. An import operation does not modify the GPO ID or the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-lists">ACLs</a> on the destination GPO. And, an import operation does not modify any links that point to the destination GPO or to an associated Windows Management Instrumentation (WMI) filter. For more information about importing GPOs, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpmgpo-import">IGPMGPO::Import</a>.
     * 
     * For more information about security groups, see 
     * <a href="https://docs.microsoft.com/windows/desktop/AD/how-security-groups-are-used-in-access-control">How Security Groups are Used in Access Control</a> in the Active Directory Programmer's Guide.
     * @param {Integer} lFlags Specifies the options to use for security principal and path mapping. For more information, see 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/gpmc/copying-and-importing-gpos-across-domains">Copying and Importing GPOs Across Domains</a>. 
     *       The following options are defined.
     * @param {IGPMDomain} pIGPMDomain Domain to which the GPO is copied.
     * @param {Pointer<VARIANT>} pvarNewDisplayName Display name for the copied GPO. A display name is assigned if the <b>VARIANT</b> structure does not contain a <b>BSTR</b> or if the <i>pvarNewDisplayName</i> parameter is <b>NULL</b>.
     * @param {Pointer<VARIANT>} pvarMigrationTable Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmmigrationtable">IGPMMigrationTable</a> interface to use for mapping. This parameter can be <b>NULL</b>.
     * @param {Pointer<VARIANT>} pvarGPMProgress Specifies a pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasyncprogress">IGPMAsyncProgress</a> interface. This interface allows the client to receive status notifications about the progress of the copy operation. This parameter must be <b>NULL</b> if the client does not receive asynchronous notifications.
     * @param {Pointer<VARIANT>} pvarGPMCancel Receives a pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasynccancel">IGPMAsyncCancel</a> interface that the client can use to cancel the copy operation. This parameter is not returned if <i>pvarGPMProgress</i> is <b>NULL</b>.
     * @returns {IGPMResult} Address of a pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmresult">IGPMResult</a> interface that represents the result of the copy operation. That interface contains pointers to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmgpo">IGPMGPO</a> interface and to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmstatusmsgcollection">IGPMStatusMsgCollection</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmgpo-copyto
     */
    CopyTo(lFlags, pIGPMDomain, pvarNewDisplayName, pvarMigrationTable, pvarGPMProgress, pvarGPMCancel) {
        result := ComCall(31, this, "int", lFlags, "ptr", pIGPMDomain, VARIANT.Ptr, pvarNewDisplayName, VARIANT.Ptr, pvarMigrationTable, VARIANT.Ptr, pvarGPMProgress, VARIANT.Ptr, pvarGPMCancel, "ptr*", &ppIGPMResult := 0, "HRESULT")
        return IGPMResult(ppIGPMResult)
    }

    /**
     * Sets the security descriptor for the GPO. The method replaces the existing security descriptor.
     * @remarks
     * For more information about ACLs and the security model for controlling access to Windows objects, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control">Access Control</a> topic .
     * @param {Integer} lFlags Specifies a set of bit flags. Use this parameter to specify the parts of the security descriptor to set.
     * @param {IDispatch} pSD The security descriptor to set.
     * @returns {HRESULT} <h3>JScript</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * 
     * <h3>VB</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmgpo-setsecuritydescriptor
     */
    SetSecurityDescriptor(lFlags, pSD) {
        result := ComCall(32, this, "int", lFlags, "ptr", pSD, "HRESULT")
        return result
    }

    /**
     * Retrieves a pointer to an IDispatch interface from which the security descriptor for the Group Policy object (GPO) can be retrieved. For script programmers, this method returns a reference to an IADsSecurityDescriptor object.
     * @remarks
     * For more information about security descriptors, ACLs, and the security model for controlling access to Windows-based objects, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control">Access Control</a>.
     * @param {Integer} lFlags Specifies a set of bit flags. Use this parameter to specify the parts of the security descriptor to retrieve. The following values are valid.
     * @returns {IDispatch} Address of a pointer to an <b>IDispatch</b> interface. You can call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a> method to obtain a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadssecuritydescriptor">IADsSecurityDescriptor</a> interface on the security descriptor of the GPO.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmgpo-getsecuritydescriptor
     */
    GetSecurityDescriptor(lFlags) {
        result := ComCall(33, this, "int", lFlags, "ptr*", &ppSD := 0, "HRESULT")
        return IDispatch(ppSD)
    }

    /**
     * Checks for the consistency of ACLs between the Directory Service and the system volume folder (SysVol).
     * @remarks
     * For more information about ACLs and the security model for controlling access to Windows objects, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control">Access Control</a>.
     * @returns {VARIANT_BOOL} Value that indicates whether the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-lists">access control lists (ACLs)</a> on the different parts of the GPO are consistent. If <b>VARIANT_TRUE</b>, they are consistent.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmgpo-isaclconsistent
     */
    IsACLConsistent() {
        result := ComCall(34, this, VARIANT_BOOL.Ptr, &pvbConsistent := 0, "HRESULT")
        return pvbConsistent
    }

    /**
     * Makes ACLs consistent on the Directory Service and the system volume folder (SysVol) of the GPO. IsACLConsistent can be used to check for consistency of ACLs between the Directory Service and system volume folder (SysVol).
     * @remarks
     * For more information about ACLs and the security model for controlling access to Windows objects, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control">Access Control</a>.
     * @returns {HRESULT} <h3>JScript</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * 
     * <h3>VB</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmgpo-makeaclconsistent
     */
    MakeACLConsistent() {
        result := ComCall(35, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IGPMGPO.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_DisplayName := CallbackCreate(GetMethod(implObj, "get_DisplayName"), flags, 2)
        this.vtbl.put_DisplayName := CallbackCreate(GetMethod(implObj, "put_DisplayName"), flags, 2)
        this.vtbl.get_Path := CallbackCreate(GetMethod(implObj, "get_Path"), flags, 2)
        this.vtbl.get_ID := CallbackCreate(GetMethod(implObj, "get_ID"), flags, 2)
        this.vtbl.get_DomainName := CallbackCreate(GetMethod(implObj, "get_DomainName"), flags, 2)
        this.vtbl.get_CreationTime := CallbackCreate(GetMethod(implObj, "get_CreationTime"), flags, 2)
        this.vtbl.get_ModificationTime := CallbackCreate(GetMethod(implObj, "get_ModificationTime"), flags, 2)
        this.vtbl.get_UserDSVersionNumber := CallbackCreate(GetMethod(implObj, "get_UserDSVersionNumber"), flags, 2)
        this.vtbl.get_ComputerDSVersionNumber := CallbackCreate(GetMethod(implObj, "get_ComputerDSVersionNumber"), flags, 2)
        this.vtbl.get_UserSysvolVersionNumber := CallbackCreate(GetMethod(implObj, "get_UserSysvolVersionNumber"), flags, 2)
        this.vtbl.get_ComputerSysvolVersionNumber := CallbackCreate(GetMethod(implObj, "get_ComputerSysvolVersionNumber"), flags, 2)
        this.vtbl.GetWMIFilter := CallbackCreate(GetMethod(implObj, "GetWMIFilter"), flags, 2)
        this.vtbl.SetWMIFilter := CallbackCreate(GetMethod(implObj, "SetWMIFilter"), flags, 2)
        this.vtbl.SetUserEnabled := CallbackCreate(GetMethod(implObj, "SetUserEnabled"), flags, 2)
        this.vtbl.SetComputerEnabled := CallbackCreate(GetMethod(implObj, "SetComputerEnabled"), flags, 2)
        this.vtbl.IsUserEnabled := CallbackCreate(GetMethod(implObj, "IsUserEnabled"), flags, 2)
        this.vtbl.IsComputerEnabled := CallbackCreate(GetMethod(implObj, "IsComputerEnabled"), flags, 2)
        this.vtbl.GetSecurityInfo := CallbackCreate(GetMethod(implObj, "GetSecurityInfo"), flags, 2)
        this.vtbl.SetSecurityInfo := CallbackCreate(GetMethod(implObj, "SetSecurityInfo"), flags, 2)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 1)
        this.vtbl.Backup := CallbackCreate(GetMethod(implObj, "Backup"), flags, 6)
        this.vtbl.Import := CallbackCreate(GetMethod(implObj, "Import"), flags, 7)
        this.vtbl.GenerateReport := CallbackCreate(GetMethod(implObj, "GenerateReport"), flags, 5)
        this.vtbl.GenerateReportToFile := CallbackCreate(GetMethod(implObj, "GenerateReportToFile"), flags, 4)
        this.vtbl.CopyTo := CallbackCreate(GetMethod(implObj, "CopyTo"), flags, 8)
        this.vtbl.SetSecurityDescriptor := CallbackCreate(GetMethod(implObj, "SetSecurityDescriptor"), flags, 3)
        this.vtbl.GetSecurityDescriptor := CallbackCreate(GetMethod(implObj, "GetSecurityDescriptor"), flags, 3)
        this.vtbl.IsACLConsistent := CallbackCreate(GetMethod(implObj, "IsACLConsistent"), flags, 2)
        this.vtbl.MakeACLConsistent := CallbackCreate(GetMethod(implObj, "MakeACLConsistent"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_DisplayName)
        CallbackFree(this.vtbl.put_DisplayName)
        CallbackFree(this.vtbl.get_Path)
        CallbackFree(this.vtbl.get_ID)
        CallbackFree(this.vtbl.get_DomainName)
        CallbackFree(this.vtbl.get_CreationTime)
        CallbackFree(this.vtbl.get_ModificationTime)
        CallbackFree(this.vtbl.get_UserDSVersionNumber)
        CallbackFree(this.vtbl.get_ComputerDSVersionNumber)
        CallbackFree(this.vtbl.get_UserSysvolVersionNumber)
        CallbackFree(this.vtbl.get_ComputerSysvolVersionNumber)
        CallbackFree(this.vtbl.GetWMIFilter)
        CallbackFree(this.vtbl.SetWMIFilter)
        CallbackFree(this.vtbl.SetUserEnabled)
        CallbackFree(this.vtbl.SetComputerEnabled)
        CallbackFree(this.vtbl.IsUserEnabled)
        CallbackFree(this.vtbl.IsComputerEnabled)
        CallbackFree(this.vtbl.GetSecurityInfo)
        CallbackFree(this.vtbl.SetSecurityInfo)
        CallbackFree(this.vtbl.Delete)
        CallbackFree(this.vtbl.Backup)
        CallbackFree(this.vtbl.Import)
        CallbackFree(this.vtbl.GenerateReport)
        CallbackFree(this.vtbl.GenerateReportToFile)
        CallbackFree(this.vtbl.CopyTo)
        CallbackFree(this.vtbl.SetSecurityDescriptor)
        CallbackFree(this.vtbl.GetSecurityDescriptor)
        CallbackFree(this.vtbl.IsACLConsistent)
        CallbackFree(this.vtbl.MakeACLConsistent)
    }
}
