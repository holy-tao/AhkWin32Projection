#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IGPMSecurityInfo.ahk" { IGPMSecurityInfo }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\GPMStarterGPOType.ahk" { GPMStarterGPOType }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\GPMReportType.ahk" { GPMReportType }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IGPMResult.ahk" { IGPMResult }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IGPMStarterGPO interface supports methods that enable you to manage Starter Group Policy Objects (GPOs) in the directory service.
 * @remarks
 * The <b>GPMStarterGPO</b> object is analogous to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmgpo2">GPMGPO2</a> object. The <b>GPMStarterGPO</b> object represents a single instance of a Starter Group Policy object (GPO).
 * 
 * The <b>IGPMStarterGPO</b> interface has three properties that do not have a counterpart in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmgpo2">IGPMGPO2</a> interface.
 * 
 * <ul>
 * <li>The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/gpmc/igpmstartergpo-property-methods">Author</a> property contains the name of who created the Template.  This attribute is applicable to System Templates.  For custom Templates this attribute will be blank.  This attribute is read-only.</li>
 * <li>The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/gpmc/igpmstartergpo-property-methods">Product</a> 
 *      property contains the name of the product that the Template is designed to manage.  For example a Template might ship to configure MS Office.  This attribute is applicable to System Templates.  For custom Templates this attribute will be blank.  This attribute is read-only.</li>
 * <li>The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/gpmc/igpmstartergpo-property-methods">Type</a> 
 *      property is an enum value,  <a href="https://docs.microsoft.com/windows/win32/api/gpmgmt/ne-gpmgmt-gpmstartergpotype">GPMStarterGPOType</a>, that specifies the type of the attribute.  The Type may be either a system  Starter Group Policy object or a custom Starter Group Policy object.</li>
 * </ul>
 * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpmstartergpo-save">Save</a> method has no corresponding method in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmgpo2">IGPMGPO2</a> interface.  The <b>Save</b> method will generate a CAB file containing all the contents of a single Starter GPO.  The objective of this method is to allow a user to save a Starter GPO in a form that can be easily redistributed. There is no way to create a CAB file containing multiple Starter GPOs.
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmstartergpo
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct IGPMStarterGPO extends IDispatch {
    /**
     * The interface identifier for IGPMStarterGPO
     * @type {Guid}
     */
    static IID := Guid("{dfc3f61b-8880-4490-9337-d29c7ba8c2f0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGPMStarterGPO interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_DisplayName       : IntPtr
        put_DisplayName       : IntPtr
        get_Description       : IntPtr
        put_Description       : IntPtr
        get_Author            : IntPtr
        get_Product           : IntPtr
        get_CreationTime      : IntPtr
        get_ID                : IntPtr
        get_ModifiedTime      : IntPtr
        get_Type              : IntPtr
        get_ComputerVersion   : IntPtr
        get_UserVersion       : IntPtr
        get_StarterGPOVersion : IntPtr
        Delete                : IntPtr
        Save                  : IntPtr
        Backup                : IntPtr
        CopyTo                : IntPtr
        GenerateReport        : IntPtr
        GenerateReportToFile  : IntPtr
        GetSecurityInfo       : IntPtr
        SetSecurityInfo       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGPMStarterGPO.Vtbl()
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
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * @type {BSTR} 
     */
    Author {
        get => this.get_Author()
    }

    /**
     * @type {BSTR} 
     */
    Product {
        get => this.get_Product()
    }

    /**
     * @type {Float} 
     */
    CreationTime {
        get => this.get_CreationTime()
    }

    /**
     * @type {BSTR} 
     */
    ID {
        get => this.get_ID()
    }

    /**
     * @type {Float} 
     */
    ModifiedTime {
        get => this.get_ModifiedTime()
    }

    /**
     * @type {GPMStarterGPOType} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * @type {Integer} 
     */
    ComputerVersion {
        get => this.get_ComputerVersion()
    }

    /**
     * @type {Integer} 
     */
    UserVersion {
        get => this.get_UserVersion()
    }

    /**
     * @type {BSTR} 
     */
    StarterGPOVersion {
        get => this.get_StarterGPOVersion()
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
    get_Description() {
        pVal := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     */
    put_Description(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(10, this, BSTR, newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Author() {
        pVal := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Product() {
        pVal := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CreationTime() {
        result := ComCall(13, this, "double*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ID() {
        pVal := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ModifiedTime() {
        result := ComCall(15, this, "double*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMStarterGPOType} 
     */
    get_Type() {
        result := ComCall(16, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ComputerVersion() {
        result := ComCall(17, this, "ushort*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UserVersion() {
        result := ComCall(18, this, "ushort*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_StarterGPOVersion() {
        pVal := BSTR.Owned()
        result := ComCall(19, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Deletes the GPO from the current domain's system volume folder(SysVol).
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmstartergpo-delete
     */
    Delete() {
        result := ComCall(20, this, "HRESULT")
        return result
    }

    /**
     * Saves all Starter GPO settings into a single CAB file.
     * @param {BSTR} bstrSaveFile Name of the file to which the Starter GPO should be saved.  Use null-terminated string.
     * @param {VARIANT_BOOL} bOverwrite Boolean value that determines whether the file  should be  overwritten, if it exists.
     * @param {VARIANT_BOOL} bSaveAsSystem Boolean value that specifies whether to convert the Starter GPO into a system template as part of the save.  By default, the value is <b>VARIANT_FALSE</b>, save as a system Starter GPO.  This option must be VARIANT_FALSE if the Starter GPO being saved is a system Starter GPO; entering VARIANT_TRUE for a system Starter GPO will return an invalid argument error.
     * @param {Pointer<VARIANT>} bstrLanguage Specifies the MUI language code all the language specific strings of the custom Starter GPO will be exported during the save.  The custom Starter GPO strings are converted into MUI resources without performing any language checks on the strings.  If bSaveAsSystem is VARIANT_FALSE this parameter is ignored.  If this parameter is <b>NULL</b>, the user's current language code is used.
     * @param {Pointer<VARIANT>} bstrAuthor Specifies the Author property of the new system Starter GPO.  If bSaveAsSystem is VARIANT_FALSE this parameter is ignored.
     * @param {Pointer<VARIANT>} bstrProduct Specifies the Product property of the new system Starter GPO.  If bSaveAsSystem is VARIANT_FALSE this parameter is ignored
     * @param {Pointer<VARIANT>} bstrUniqueID Specifies the ID property of the new system Starter GPO.  If the parameter is <b>NULL</b> a new unique ID will be generated.  If bSaveAsSystem is VARIANT_FALSE this parameter is ignored.
     * @param {Pointer<VARIANT>} bstrVersion Specifies the Starter GPO version of the new system Starter GPO.  The format of the string must be 4 digits-dot-5 digits.  If the value is <b>NULL</b> the version is set to 1.0.  If bSaveAsSystem is VARIANT_FALSE this parameter is ignored
     * @param {Pointer<VARIANT>} pvarGPMProgress Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasyncprogress">IGPMAsyncProgress</a> interface that allows the client to receive status notifications about the progress of the copy operation. If not <b>NULL</b>, the call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpmbackup-generatereport">GenerateReport</a> is handled asynchronously and <i>pvarGPMCancel</i> receives a pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasynccancel">IGPMAsyncCancel</a> interface.   If this parameter is <b>NULL</b> the call to <b>GenerateReport</b> is handled synchronously. The <i>pvarGPMProgress</i> parameter must be <b>NULL</b> if the client should not receive asynchronous notifications.
     * @param {Pointer<VARIANT>} pvarGPMCancel Receives a pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasynccancel">IGPMAsyncCancel</a> interface that the client can use to cancel the copy operation. This parameter is not returned if <i>pvarGPMProgress</i> is <b>NULL</b>.
     * @returns {IGPMResult} Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmresult">IGPMResult</a>. The Result property contains a string representing the GUID of the saved Starter GPO.  If bSaveAsSystem is <b>VARIANT_TRUE</b>, the Starter GPO will be saved with a new GUID as specified by bstrUniqueID. The Status property contains a reference to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmstatusmsgcollection">IGPMStatusMsgCollection</a>.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmstartergpo-save
     */
    Save(bstrSaveFile, bOverwrite, bSaveAsSystem, bstrLanguage, bstrAuthor, bstrProduct, bstrUniqueID, bstrVersion, pvarGPMProgress, pvarGPMCancel) {
        bstrSaveFile := bstrSaveFile is String ? BSTR.Alloc(bstrSaveFile).Value : bstrSaveFile

        result := ComCall(21, this, BSTR, bstrSaveFile, VARIANT_BOOL, bOverwrite, VARIANT_BOOL, bSaveAsSystem, VARIANT.Ptr, bstrLanguage, VARIANT.Ptr, bstrAuthor, VARIANT.Ptr, bstrProduct, VARIANT.Ptr, bstrUniqueID, VARIANT.Ptr, bstrVersion, VARIANT.Ptr, pvarGPMProgress, VARIANT.Ptr, pvarGPMCancel, "ptr*", &ppIGPMResult := 0, "HRESULT")
        return IGPMResult(ppIGPMResult)
    }

    /**
     * Creates a backup of the current Starter GPO.
     * @remarks
     * Note that you must check the code returned by the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpmresult-overallstatus">IGPMResult::OverallStatus</a> method as well as the one returned by this method to determine whether or not the operation succeeded. 
     * <b>OverallStatus</b> returns an overall status code for the operation. If no error occurred during the operation, it returns a success code; otherwise it returns a failure code.
     * @param {BSTR} bstrBackupDir Name of the file system directory in which the <b>GPMStarterGPOBackup</b> object should be stored.  The directory must already exist.  Use a null-terminated string.
     * @param {BSTR} bstrComment Comment to associate with the <b>GPMStarterGPOBackup</b> object.
     * @param {Pointer<VARIANT>} pvarGPMProgress Specifies a pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasyncprogress">IGPMAsyncProgress</a> interface that allows the client to receive status notifications about the progress of the backup operation. The method runs synchronously if this parameter is <b>NULL</b>. The method runs asynchronously if this parameter is not <b>NULL</b>. This parameter must be <b>NULL</b> if the client should not receive asynchronous notifications.
     * @param {Pointer<VARIANT>} pvarGPMCancel Receives a pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasynccancel">IGPMAsyncCancel</a> interface that the client can use to cancel the backup operation. This parameter is not returned if <i>pvarGPMProgress</i> is <b>NULL</b>.
     * @returns {IGPMResult} Address of a pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmresult">IGPMResult</a> interface representing the result of the backup operation. That interface contains pointers to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmbackup">IGPMBackup</a> interface and an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmstatusmsgcollection">IGPMStatusMsgCollection</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmstartergpo-backup
     */
    Backup(bstrBackupDir, bstrComment, pvarGPMProgress, pvarGPMCancel) {
        bstrBackupDir := bstrBackupDir is String ? BSTR.Alloc(bstrBackupDir).Value : bstrBackupDir
        bstrComment := bstrComment is String ? BSTR.Alloc(bstrComment).Value : bstrComment

        result := ComCall(22, this, BSTR, bstrBackupDir, BSTR, bstrComment, VARIANT.Ptr, pvarGPMProgress, VARIANT.Ptr, pvarGPMCancel, "ptr*", &ppIGPMResult := 0, "HRESULT")
        return IGPMResult(ppIGPMResult)
    }

    /**
     * The CopyTo method copies the current Starter GPO and returns a pointer to the copy of the Starter GPO.
     * @remarks
     * Note that you must check the code returned by the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpmresult-overallstatus">IGPMResult::OverallStatus</a> method as well as the one returned by this method to determine whether or not the operation succeeded. 
     * <b>OverallStatus</b> returns an overall status code for the operation. If no error occurred during the operation, it returns a success code; otherwise it returns a failure code.
     * @param {Pointer<VARIANT>} pvarNewDisplayName Display name to be put on the copied Starter GPO. A display name is assigned if the <b>VARIANT</b> structure does not contain a <b>BSTR</b>, or if <i>pvarNewDisplayName</i> is <b>NULL</b>.
     * @param {Pointer<VARIANT>} pvarGPMProgress Specifies a pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasyncprogress">IGPMAsyncProgress</a> interface that allows the client to receive status notifications about the progress of the copy operation. This parameter must be <b>NULL</b> if the client does not receive asynchronous notifications.
     * @param {Pointer<VARIANT>} pvarGPMCancel Receives a pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasynccancel">IGPMAsyncCancel</a> interface that the client can use to cancel the copy operation. This parameter is not returned if <i>pvarGPMProgress</i> is <b>NULL</b>.
     * @returns {IGPMResult} Address of a pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmresult">IGPMResult</a> interface that represents the result of the copy operation. That interface contains pointers to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmgpo">IGPMGPO</a> interface and an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmstatusmsgcollection">IGPMStatusMsgCollection</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmstartergpo-copyto
     */
    CopyTo(pvarNewDisplayName, pvarGPMProgress, pvarGPMCancel) {
        result := ComCall(23, this, VARIANT.Ptr, pvarNewDisplayName, VARIANT.Ptr, pvarGPMProgress, VARIANT.Ptr, pvarGPMCancel, "ptr*", &ppIGPMResult := 0, "HRESULT")
        return IGPMResult(ppIGPMResult)
    }

    /**
     * Gets the report for the Starter GPO.
     * @param {GPMReportType} _gpmReportType Specifies whether the report is in XML or HTML.
     * @param {Pointer<VARIANT>} pvarGPMProgress Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasyncprogress">IGPMAsyncProgress</a> interface that allows the client to receive status notifications about the progress of the copy operation. If not <b>NULL</b>, the call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpmbackup-generatereport">GenerateReport</a> is handled asynchronously and <i>pvarGPMCancel</i> receives a pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasynccancel">IGPMAsyncCancel</a> interface.   If this parameter is <b>NULL</b> the call to <b>GenerateReport</b> is handled synchronously. The <i>pvarGPMProgress</i> parameter must be <b>NULL</b> if the client should not receive asynchronous notifications.
     * @param {Pointer<VARIANT>} pvarGPMCancel Receives a pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmasynccancel">IGPMAsyncCancel</a> interface that the client can use to cancel the copy operation. This parameter is not returned if <i>pvarGPMProgress</i> is <b>NULL</b>.
     * @returns {IGPMResult} Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmresult">IGPMResult</a>. The Result property contains  a binary string of XML or HTML. The Status property contains a reference to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmstatusmsgcollection">IGPMStatusMsgCollection</a>.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmstartergpo-generatereport
     */
    GenerateReport(_gpmReportType, pvarGPMProgress, pvarGPMCancel) {
        result := ComCall(24, this, GPMReportType, _gpmReportType, VARIANT.Ptr, pvarGPMProgress, VARIANT.Ptr, pvarGPMCancel, "ptr*", &ppIGPMResult := 0, "HRESULT")
        return IGPMResult(ppIGPMResult)
    }

    /**
     * The GenerateReportToFile method gets the report for the GPO and saves it to a file at a specified path.
     * @param {GPMReportType} _gpmReportType Specifies whether the report is in XML or HTML.
     * @param {BSTR} bstrTargetFilePath Binary string that contains the path to the file where the report is being saved. Use null-terminated string.
     * @returns {IGPMResult} Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmresult">IGPMResult</a> interface. The <b>Status</b> property contains a reference to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmstatusmsgcollection">IGPMStatusMsgCollection</a>.
     * 
     * <div class="alert"><b>Note</b>  The value of the <b>Result</b> property of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmresult">IGPMResult</a> interface is indeterminate and should not be relied upon.</div>
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmstartergpo-generatereporttofile
     */
    GenerateReportToFile(_gpmReportType, bstrTargetFilePath) {
        bstrTargetFilePath := bstrTargetFilePath is String ? BSTR.Alloc(bstrTargetFilePath).Value : bstrTargetFilePath

        result := ComCall(25, this, GPMReportType, _gpmReportType, BSTR, bstrTargetFilePath, "ptr*", &ppIGPMResult := 0, "HRESULT")
        return IGPMResult(ppIGPMResult)
    }

    /**
     * Retrieves the set of permissions for the Starter GPO, such as who is granted permission to edit it.
     * @remarks
     * For more information about policy-related permissions, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpm-createpermission">IGPM::CreatePermission</a>.
     * @returns {IGPMSecurityInfo} Address of a pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmsecurityinfo">IGPMSecurityInfo</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmstartergpo-getsecurityinfo
     */
    GetSecurityInfo() {
        result := ComCall(26, this, "ptr*", &ppSecurityInfo := 0, "HRESULT")
        return IGPMSecurityInfo(ppSecurityInfo)
    }

    /**
     * Sets the list of permissions for the Group Policy object (GPO).
     * @remarks
     * For more information about policy-related permissions, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpm-createpermission">IGPM::CreatePermission</a>.
     * @param {IGPMSecurityInfo} pSecurityInfo Pointer to the security information to apply to the GPO.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmstartergpo-setsecurityinfo
     */
    SetSecurityInfo(pSecurityInfo) {
        result := ComCall(27, this, "ptr", pSecurityInfo, "HRESULT")
        return result
    }

    Query(iid) {
        if (IGPMStarterGPO.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_DisplayName := CallbackCreate(GetMethod(implObj, "get_DisplayName"), flags, 2)
        this.vtbl.put_DisplayName := CallbackCreate(GetMethod(implObj, "put_DisplayName"), flags, 2)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.put_Description := CallbackCreate(GetMethod(implObj, "put_Description"), flags, 2)
        this.vtbl.get_Author := CallbackCreate(GetMethod(implObj, "get_Author"), flags, 2)
        this.vtbl.get_Product := CallbackCreate(GetMethod(implObj, "get_Product"), flags, 2)
        this.vtbl.get_CreationTime := CallbackCreate(GetMethod(implObj, "get_CreationTime"), flags, 2)
        this.vtbl.get_ID := CallbackCreate(GetMethod(implObj, "get_ID"), flags, 2)
        this.vtbl.get_ModifiedTime := CallbackCreate(GetMethod(implObj, "get_ModifiedTime"), flags, 2)
        this.vtbl.get_Type := CallbackCreate(GetMethod(implObj, "get_Type"), flags, 2)
        this.vtbl.get_ComputerVersion := CallbackCreate(GetMethod(implObj, "get_ComputerVersion"), flags, 2)
        this.vtbl.get_UserVersion := CallbackCreate(GetMethod(implObj, "get_UserVersion"), flags, 2)
        this.vtbl.get_StarterGPOVersion := CallbackCreate(GetMethod(implObj, "get_StarterGPOVersion"), flags, 2)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 1)
        this.vtbl.Save := CallbackCreate(GetMethod(implObj, "Save"), flags, 12)
        this.vtbl.Backup := CallbackCreate(GetMethod(implObj, "Backup"), flags, 6)
        this.vtbl.CopyTo := CallbackCreate(GetMethod(implObj, "CopyTo"), flags, 5)
        this.vtbl.GenerateReport := CallbackCreate(GetMethod(implObj, "GenerateReport"), flags, 5)
        this.vtbl.GenerateReportToFile := CallbackCreate(GetMethod(implObj, "GenerateReportToFile"), flags, 4)
        this.vtbl.GetSecurityInfo := CallbackCreate(GetMethod(implObj, "GetSecurityInfo"), flags, 2)
        this.vtbl.SetSecurityInfo := CallbackCreate(GetMethod(implObj, "SetSecurityInfo"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_DisplayName)
        CallbackFree(this.vtbl.put_DisplayName)
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.put_Description)
        CallbackFree(this.vtbl.get_Author)
        CallbackFree(this.vtbl.get_Product)
        CallbackFree(this.vtbl.get_CreationTime)
        CallbackFree(this.vtbl.get_ID)
        CallbackFree(this.vtbl.get_ModifiedTime)
        CallbackFree(this.vtbl.get_Type)
        CallbackFree(this.vtbl.get_ComputerVersion)
        CallbackFree(this.vtbl.get_UserVersion)
        CallbackFree(this.vtbl.get_StarterGPOVersion)
        CallbackFree(this.vtbl.Delete)
        CallbackFree(this.vtbl.Save)
        CallbackFree(this.vtbl.Backup)
        CallbackFree(this.vtbl.CopyTo)
        CallbackFree(this.vtbl.GenerateReport)
        CallbackFree(this.vtbl.GenerateReportToFile)
        CallbackFree(this.vtbl.GetSecurityInfo)
        CallbackFree(this.vtbl.SetSecurityInfo)
    }
}
