#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Variant\VARIANT.ahk" { VARIANT }
#Import ".\COMAdminApplicationInstallOptions.ahk" { COMAdminApplicationInstallOptions }
#Import ".\COMAdminApplicationExportOptions.ahk" { COMAdminApplicationExportOptions }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\ICOMAdminCatalog.ahk" { ICOMAdminCatalog }
#Import ".\COMAdminInUse.ahk" { COMAdminInUse }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * An extension of the ICOMAdminCatalog interface.
 * @see https://learn.microsoft.com/windows/win32/api/comadmin/nn-comadmin-icomadmincatalog2
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct ICOMAdminCatalog2 extends ICOMAdminCatalog {
    /**
     * The interface identifier for ICOMAdminCatalog2
     * @type {Guid}
     */
    static IID := Guid("{790c6e0b-9194-4cc9-9426-a48a63185696}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICOMAdminCatalog2 interfaces
    */
    struct Vtbl extends ICOMAdminCatalog.Vtbl {
        GetCollectionByQuery2                  : IntPtr
        GetApplicationInstanceIDFromProcessID  : IntPtr
        ShutdownApplicationInstances           : IntPtr
        PauseApplicationInstances              : IntPtr
        ResumeApplicationInstances             : IntPtr
        RecycleApplicationInstances            : IntPtr
        AreApplicationInstancesPaused          : IntPtr
        DumpApplicationInstance                : IntPtr
        get_IsApplicationInstanceDumpSupported : IntPtr
        CreateServiceForApplication            : IntPtr
        DeleteServiceForApplication            : IntPtr
        GetPartitionID                         : IntPtr
        GetPartitionName                       : IntPtr
        put_CurrentPartition                   : IntPtr
        get_CurrentPartitionID                 : IntPtr
        get_CurrentPartitionName               : IntPtr
        get_GlobalPartitionID                  : IntPtr
        FlushPartitionCache                    : IntPtr
        CopyApplications                       : IntPtr
        CopyComponents                         : IntPtr
        MoveComponents                         : IntPtr
        AliasComponent                         : IntPtr
        IsSafeToDelete                         : IntPtr
        ImportUnconfiguredComponents           : IntPtr
        PromoteUnconfiguredComponents          : IntPtr
        ImportComponents                       : IntPtr
        get_Is64BitCatalogServer               : IntPtr
        ExportPartition                        : IntPtr
        InstallPartition                       : IntPtr
        QueryApplicationFile2                  : IntPtr
        GetComponentVersionCount               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICOMAdminCatalog2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsApplicationInstanceDumpSupported {
        get => this.get_IsApplicationInstanceDumpSupported()
    }

    /**
     * @type {BSTR} 
     */
    CurrentPartition {
        set => this.put_CurrentPartition(value)
    }

    /**
     * @type {BSTR} 
     */
    CurrentPartitionID {
        get => this.get_CurrentPartitionID()
    }

    /**
     * @type {BSTR} 
     */
    CurrentPartitionName {
        get => this.get_CurrentPartitionName()
    }

    /**
     * @type {BSTR} 
     */
    GlobalPartitionID {
        get => this.get_GlobalPartitionID()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Is64BitCatalogServer {
        get => this.get_Is64BitCatalogServer()
    }

    /**
     * Retrieves a collection of items in the COM+ catalog that satisfy the specified set of query keys.
     * @param {BSTR} bstrCollectionName The name of the collection to be retrieved from the catalog. Possible collection names can be found in the table of collections at <a href="https://docs.microsoft.com/windows/desktop/cossdk/com--administration-collections">COM+ Administration Collections</a>.
     * @param {Pointer<VARIANT>} pVarQueryStrings The query keys.
     * @returns {IDispatch} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/comadmin/nn-comadmin-icatalogcollection">ICatalogCollection</a> interface pointer containing the result of the query.
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-getcollectionbyquery2
     */
    GetCollectionByQuery2(bstrCollectionName, pVarQueryStrings) {
        bstrCollectionName := bstrCollectionName is String ? BSTR.Alloc(bstrCollectionName).Value : bstrCollectionName

        result := ComCall(33, this, BSTR, bstrCollectionName, VARIANT.Ptr, pVarQueryStrings, "ptr*", &ppCatalogCollection := 0, "HRESULT")
        return IDispatch(ppCatalogCollection)
    }

    /**
     * Retrieves the application instance identifier for the specified process identifier.
     * @param {Integer} lProcessID The process ID.
     * @returns {BSTR} The corresponding application instance ID.
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-getapplicationinstanceidfromprocessid
     */
    GetApplicationInstanceIDFromProcessID(lProcessID) {
        pbstrApplicationInstanceID := BSTR.Owned()
        result := ComCall(34, this, "int", lProcessID, BSTR.Ptr, pbstrApplicationInstanceID, "HRESULT")
        return pbstrApplicationInstanceID
    }

    /**
     * Initiates shutdown of the specified application server processes.
     * @param {Pointer<VARIANT>} pVarApplicationInstanceID The application instances to be shut down. Each element of the <b>Variant</b> may be a <b>String</b> containing an application instance GUID (for example, as returned by the <a href="https://docs.microsoft.com/windows/desktop/api/comadmin/nf-comadmin-icomadmincatalog2-getapplicationinstanceidfromprocessid">GetApplicationInstanceIDFromProcessID</a> method), a single catalog object, or a catalog collection (for example, as returned by the <a href="https://docs.microsoft.com/windows/desktop/api/comadmin/nf-comadmin-icomadmincatalog2-getcollectionbyquery2">GetCollectionByQuery2</a> method).
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, and E_FAIL, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COMADIN_E_OBJECT_DOES_NOT_EXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A specified application instance does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-shutdownapplicationinstances
     */
    ShutdownApplicationInstances(pVarApplicationInstanceID) {
        result := ComCall(35, this, VARIANT.Ptr, pVarApplicationInstanceID, "HRESULT")
        return result
    }

    /**
     * Pauses the specified application server processes.
     * @param {Pointer<VARIANT>} pVarApplicationInstanceID The application instances to be paused. Each element of the <b>Variant</b> may be a <b>String</b> containing an application instance GUID (for example, as returned by the <a href="https://docs.microsoft.com/windows/desktop/api/comadmin/nf-comadmin-icomadmincatalog2-getapplicationinstanceidfromprocessid">GetApplicationInstanceIDFromProcessID</a> method), a single catalog object, or a catalog collection (for example, as returned by the <a href="https://docs.microsoft.com/windows/desktop/api/comadmin/nf-comadmin-icomadmincatalog2-getcollectionbyquery2">GetCollectionByQuery2</a> method).
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, and E_FAIL, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COMADIN_E_OBJECT_DOES_NOT_EXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A specified application instance does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-pauseapplicationinstances
     */
    PauseApplicationInstances(pVarApplicationInstanceID) {
        result := ComCall(36, this, VARIANT.Ptr, pVarApplicationInstanceID, "HRESULT")
        return result
    }

    /**
     * Resumes the specified application server processes.
     * @param {Pointer<VARIANT>} pVarApplicationInstanceID The application instances to be resumed. Each element of the <b>Variant</b> may be a <b>String</b> containing an application instance GUID (for example, as returned by the <a href="https://docs.microsoft.com/windows/desktop/api/comadmin/nf-comadmin-icomadmincatalog2-getapplicationinstanceidfromprocessid">GetApplicationInstanceIDFromProcessID</a> method), a single catalog object, or a catalog collection (for example, as returned by the <a href="https://docs.microsoft.com/windows/desktop/api/comadmin/nf-comadmin-icomadmincatalog2-getcollectionbyquery2">GetCollectionByQuery2</a> method).
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, and E_FAIL, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COMADIN_E_OBJECT_DOES_NOT_EXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A specified application instance does not exist.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-resumeapplicationinstances
     */
    ResumeApplicationInstances(pVarApplicationInstanceID) {
        result := ComCall(37, this, VARIANT.Ptr, pVarApplicationInstanceID, "HRESULT")
        return result
    }

    /**
     * Recycles (shuts down and restarts) the specified application server processes.
     * @param {Pointer<VARIANT>} pVarApplicationInstanceID The application instances to be recycled. Each element of the <b>Variant</b> may be a <b>String</b> containing an application instance GUID (for example, as returned by the <a href="https://docs.microsoft.com/windows/desktop/api/comadmin/nf-comadmin-icomadmincatalog2-getapplicationinstanceidfromprocessid">GetApplicationInstanceIDFromProcessID</a> method), a single catalog object, or a catalog collection (for example, as returned by the <a href="https://docs.microsoft.com/windows/desktop/api/comadmin/nf-comadmin-icomadmincatalog2-getcollectionbyquery2">GetCollectionByQuery2</a> method).
     * @param {Integer} lReasonCode The reason for recycling the specified application instances. This code is written to an event log entry.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, and E_FAIL, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COMADIN_E_OBJECT_DOES_NOT_EXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A specified application instance does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-recycleapplicationinstances
     */
    RecycleApplicationInstances(pVarApplicationInstanceID, lReasonCode) {
        result := ComCall(38, this, VARIANT.Ptr, pVarApplicationInstanceID, "int", lReasonCode, "HRESULT")
        return result
    }

    /**
     * Determines whether any of the specified application instances (processes) are paused.
     * @param {Pointer<VARIANT>} pVarApplicationInstanceID The application instances to be checked. Each element of the <b>Variant</b> may be a <b>String</b> containing an application instance ID (for example, as returned by the <a href="https://docs.microsoft.com/windows/desktop/api/comadmin/nf-comadmin-icomadmincatalog2-getapplicationinstanceidfromprocessid">GetApplicationInstanceIDFromProcessID</a> method), a single catalog object, or a catalog collection (for example, as returned by the <a href="https://docs.microsoft.com/windows/desktop/api/comadmin/nf-comadmin-icomadmincatalog2-getcollectionbyquery2">GetCollectionByQuery2</a> method).
     * @returns {VARIANT_BOOL} Indicates whether the specified applications are paused.
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-areapplicationinstancespaused
     */
    AreApplicationInstancesPaused(pVarApplicationInstanceID) {
        result := ComCall(39, this, VARIANT.Ptr, pVarApplicationInstanceID, VARIANT_BOOL.Ptr, &pVarBoolPaused := 0, "HRESULT")
        return pVarBoolPaused
    }

    /**
     * Creates a dump file containing an image of the state of the specified application instance (process).
     * @param {BSTR} bstrApplicationInstanceID The GUID of the application instance.
     * @param {BSTR} bstrDirectory The complete path to the directory into which the dump file is placed. Do not include the file name. If this parameter is <b>NULL</b>, the default directory is %SystemRoot%\system32\com\dmp.
     * @param {Integer} lMaxImages The maximum number of dump files that may exist in the dump directory. Specifying this variable prevents dump files from consuming too much storage space.
     * @returns {BSTR} The name of the dump file containing the resulting application instance image.
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-dumpapplicationinstance
     */
    DumpApplicationInstance(bstrApplicationInstanceID, bstrDirectory, lMaxImages) {
        bstrApplicationInstanceID := bstrApplicationInstanceID is String ? BSTR.Alloc(bstrApplicationInstanceID).Value : bstrApplicationInstanceID
        bstrDirectory := bstrDirectory is String ? BSTR.Alloc(bstrDirectory).Value : bstrDirectory

        pbstrDumpFile := BSTR.Owned()
        result := ComCall(40, this, BSTR, bstrApplicationInstanceID, BSTR, bstrDirectory, "int", lMaxImages, BSTR.Ptr, pbstrDumpFile, "HRESULT")
        return pbstrDumpFile
    }

    /**
     * Indicates whether the software required for application instance dumps is installed.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-get_isapplicationinstancedumpsupported
     */
    get_IsApplicationInstanceDumpSupported() {
        result := ComCall(41, this, VARIANT_BOOL.Ptr, &pVarBoolDumpSupported := 0, "HRESULT")
        return pVarBoolDumpSupported
    }

    /**
     * Configures a COM+ application to run as a Windows service.
     * @remarks
     * A service created by this method can be removed using the <a href="https://docs.microsoft.com/windows/desktop/api/comadmin/nf-comadmin-icomadmincatalog2-deleteserviceforapplication">DeleteServiceForApplication</a> method.
     * @param {BSTR} bstrApplicationIDOrName The application ID or name of the application.
     * @param {BSTR} bstrServiceName The service name of the application. This name is the internal name used by the service control manager (SCM), not the display name.
     * @param {BSTR} bstrStartType When to start the service. The valid arguments are the options of the <i>dwStartType</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function. The arguments must be in quotes. The following are the valid arguments: SERVICE_BOOT_START, SERVICE_SYSTEM_START, SERVICE_AUTO_START, SERVICE_DEMAND_START, and SERVICE_DISABLED.
     * @param {BSTR} bstrErrorControl The severity of the error if this service fails to start during startup. The error determines the action taken by the startup program if failure occurs. The valid arguments are the options of the <i>dwErrorControl</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function. The arguments must be in quotes. The following are the valid arguments: SERVICE_ERROR_IGNORE, SERVICE_ERROR_NORMAL, SERVICE_ERROR_SEVERE, and SERVICE_ERROR_CRITICAL.
     * @param {BSTR} bstrDependencies A list of dependencies for the service. There are two possible formats for the string: a standard null-delimited, double-null-terminated string (exactly as documented for <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a>); or a script-friendly list of service names separated by "\" (an invalid character to have in a service name). The rpcss service is implicit in this parameter and does not need to be specified.
     * @param {BSTR} bstrRunAs The user name to run this service as. If this parameter is <b>NULL</b>, the service will run as Local Service.
     * @param {BSTR} bstrPassword The password for the system user account. This parameter must be <b>NULL</b> if the service is configured to run as Local Service.
     * @param {VARIANT_BOOL} bDesktopOk Indicates whether the service should be allowed to interact with the desktop. This parameter is valid only when the service is marked as Local Service and must be <b>FALSE</b> otherwise.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-createserviceforapplication
     */
    CreateServiceForApplication(bstrApplicationIDOrName, bstrServiceName, bstrStartType, bstrErrorControl, bstrDependencies, bstrRunAs, bstrPassword, bDesktopOk) {
        bstrApplicationIDOrName := bstrApplicationIDOrName is String ? BSTR.Alloc(bstrApplicationIDOrName).Value : bstrApplicationIDOrName
        bstrServiceName := bstrServiceName is String ? BSTR.Alloc(bstrServiceName).Value : bstrServiceName
        bstrStartType := bstrStartType is String ? BSTR.Alloc(bstrStartType).Value : bstrStartType
        bstrErrorControl := bstrErrorControl is String ? BSTR.Alloc(bstrErrorControl).Value : bstrErrorControl
        bstrDependencies := bstrDependencies is String ? BSTR.Alloc(bstrDependencies).Value : bstrDependencies
        bstrRunAs := bstrRunAs is String ? BSTR.Alloc(bstrRunAs).Value : bstrRunAs
        bstrPassword := bstrPassword is String ? BSTR.Alloc(bstrPassword).Value : bstrPassword

        result := ComCall(42, this, BSTR, bstrApplicationIDOrName, BSTR, bstrServiceName, BSTR, bstrStartType, BSTR, bstrErrorControl, BSTR, bstrDependencies, BSTR, bstrRunAs, BSTR, bstrPassword, VARIANT_BOOL, bDesktopOk, "HRESULT")
        return result
    }

    /**
     * Deletes the Windows service associated with the specified COM+ application.
     * @param {BSTR} bstrApplicationIDOrName The application ID or name of the COM+ application to be deleted.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-deleteserviceforapplication
     */
    DeleteServiceForApplication(bstrApplicationIDOrName) {
        bstrApplicationIDOrName := bstrApplicationIDOrName is String ? BSTR.Alloc(bstrApplicationIDOrName).Value : bstrApplicationIDOrName

        result := ComCall(43, this, BSTR, bstrApplicationIDOrName, "HRESULT")
        return result
    }

    /**
     * Retrieves the partition identifier for the specified COM+ application.
     * @param {BSTR} bstrApplicationIDOrName The application ID or name of a COM+ application.
     * @returns {BSTR} The partition GUID associated with the specified application.
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-getpartitionid
     */
    GetPartitionID(bstrApplicationIDOrName) {
        bstrApplicationIDOrName := bstrApplicationIDOrName is String ? BSTR.Alloc(bstrApplicationIDOrName).Value : bstrApplicationIDOrName

        pbstrPartitionID := BSTR.Owned()
        result := ComCall(44, this, BSTR, bstrApplicationIDOrName, BSTR.Ptr, pbstrPartitionID, "HRESULT")
        return pbstrPartitionID
    }

    /**
     * Retrieves the name of the specified COM+ application.
     * @param {BSTR} bstrApplicationIDOrName The application ID or name of a COM+ application.
     * @returns {BSTR} The partition name associated with the specified application.
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-getpartitionname
     */
    GetPartitionName(bstrApplicationIDOrName) {
        bstrApplicationIDOrName := bstrApplicationIDOrName is String ? BSTR.Alloc(bstrApplicationIDOrName).Value : bstrApplicationIDOrName

        pbstrPartitionName := BSTR.Owned()
        result := ComCall(45, this, BSTR, bstrApplicationIDOrName, BSTR.Ptr, pbstrPartitionName, "HRESULT")
        return pbstrPartitionName
    }

    /**
     * Sets the current destination partition.
     * @param {BSTR} bstrPartitionIDOrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-put_currentpartition
     */
    put_CurrentPartition(bstrPartitionIDOrName) {
        bstrPartitionIDOrName := bstrPartitionIDOrName is String ? BSTR.Alloc(bstrPartitionIDOrName).Value : bstrPartitionIDOrName

        result := ComCall(46, this, BSTR, bstrPartitionIDOrName, "HRESULT")
        return result
    }

    /**
     * Retrieves the identifier for the current partition.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-get_currentpartitionid
     */
    get_CurrentPartitionID() {
        pbstrPartitionID := BSTR.Owned()
        result := ComCall(47, this, BSTR.Ptr, pbstrPartitionID, "HRESULT")
        return pbstrPartitionID
    }

    /**
     * Retrieves the name of the current partition.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-get_currentpartitionname
     */
    get_CurrentPartitionName() {
        pbstrPartitionName := BSTR.Owned()
        result := ComCall(48, this, BSTR.Ptr, pbstrPartitionName, "HRESULT")
        return pbstrPartitionName
    }

    /**
     * Retrieves the identifier for the global partition.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-get_globalpartitionid
     */
    get_GlobalPartitionID() {
        pbstrGlobalPartitionID := BSTR.Owned()
        result := ComCall(49, this, BSTR.Ptr, pbstrGlobalPartitionID, "HRESULT")
        return pbstrGlobalPartitionID
    }

    /**
     * Empties the cache that maps users to their default partitions.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-flushpartitioncache
     */
    FlushPartitionCache() {
        result := ComCall(50, this, "HRESULT")
        return result
    }

    /**
     * Copies the specified COM+ applications from one partition to another.
     * @param {BSTR} bstrSourcePartitionIDOrName The partition GUID or the name of the source partition.
     * @param {Pointer<VARIANT>} pVarApplicationID The applications to be copied. Each element of the <b>Variant</b> may be a <b>String</b> containing an application name or ID, a single catalog object, or a catalog collection (as returned, for example, by the <a href="https://docs.microsoft.com/windows/desktop/api/comadmin/nf-comadmin-icomadmincatalog2-getcollectionbyquery2">GetCollectionByQuery2</a> method).
     * @param {BSTR} bstrDestinationPartitionIDOrName The partition GUID or the name of the destination partition.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-copyapplications
     */
    CopyApplications(bstrSourcePartitionIDOrName, pVarApplicationID, bstrDestinationPartitionIDOrName) {
        bstrSourcePartitionIDOrName := bstrSourcePartitionIDOrName is String ? BSTR.Alloc(bstrSourcePartitionIDOrName).Value : bstrSourcePartitionIDOrName
        bstrDestinationPartitionIDOrName := bstrDestinationPartitionIDOrName is String ? BSTR.Alloc(bstrDestinationPartitionIDOrName).Value : bstrDestinationPartitionIDOrName

        result := ComCall(51, this, BSTR, bstrSourcePartitionIDOrName, VARIANT.Ptr, pVarApplicationID, BSTR, bstrDestinationPartitionIDOrName, "HRESULT")
        return result
    }

    /**
     * Copies the specified components from one partition to another.
     * @param {BSTR} bstrSourceApplicationIDOrName The application ID or name of the source application.
     * @param {Pointer<VARIANT>} pVarCLSIDOrProgID The components to be copied. Each element of the <b>Variant</b> may be a <b>String</b> containing a class ID or program ID, a single catalog object, or a catalog collection (for example, as returned by the <a href="https://docs.microsoft.com/windows/desktop/api/comadmin/nf-comadmin-icomadmincatalog2-getcollectionbyquery2">GetCollectionByQuery2</a> method).
     * @param {BSTR} bstrDestinationApplicationIDOrName The application ID or name of the destination application.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, and E_FAIL, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COMADMIN_E_AMBIGUOUS_APPLICATION_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one of the named applications exists in multiple partitions. To avoid this error, use application IDs instead of names.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-copycomponents
     */
    CopyComponents(bstrSourceApplicationIDOrName, pVarCLSIDOrProgID, bstrDestinationApplicationIDOrName) {
        bstrSourceApplicationIDOrName := bstrSourceApplicationIDOrName is String ? BSTR.Alloc(bstrSourceApplicationIDOrName).Value : bstrSourceApplicationIDOrName
        bstrDestinationApplicationIDOrName := bstrDestinationApplicationIDOrName is String ? BSTR.Alloc(bstrDestinationApplicationIDOrName).Value : bstrDestinationApplicationIDOrName

        result := ComCall(52, this, BSTR, bstrSourceApplicationIDOrName, VARIANT.Ptr, pVarCLSIDOrProgID, BSTR, bstrDestinationApplicationIDOrName, "HRESULT")
        return result
    }

    /**
     * Moves the specified components from one application to another.
     * @param {BSTR} bstrSourceApplicationIDOrName The application ID or name of the source application.
     * @param {Pointer<VARIANT>} pVarCLSIDOrProgID The components to be moved. Each element of the <b>Variant</b> may be a <b>String</b> containing a class ID or program ID, a single catalog object, or a catalog collection (for example, as returned by the <a href="https://docs.microsoft.com/windows/desktop/api/comadmin/nf-comadmin-icomadmincatalog2-getcollectionbyquery2">GetCollectionByQuery2</a> method).
     * @param {BSTR} bstrDestinationApplicationIDOrName The application ID or name of the destination application.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, and E_FAIL, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COMADIN_E_AMBIGUOUS_APPLICATION_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one of the named applications exists in multiple partitions. To avoid this error, use application IDs instead of names.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-movecomponents
     */
    MoveComponents(bstrSourceApplicationIDOrName, pVarCLSIDOrProgID, bstrDestinationApplicationIDOrName) {
        bstrSourceApplicationIDOrName := bstrSourceApplicationIDOrName is String ? BSTR.Alloc(bstrSourceApplicationIDOrName).Value : bstrSourceApplicationIDOrName
        bstrDestinationApplicationIDOrName := bstrDestinationApplicationIDOrName is String ? BSTR.Alloc(bstrDestinationApplicationIDOrName).Value : bstrDestinationApplicationIDOrName

        result := ComCall(53, this, BSTR, bstrSourceApplicationIDOrName, VARIANT.Ptr, pVarCLSIDOrProgID, BSTR, bstrDestinationApplicationIDOrName, "HRESULT")
        return result
    }

    /**
     * Creates an alias for an existing COM+ component.
     * @param {BSTR} bstrSrcApplicationIDOrName The application ID or name of the source application containing the component.
     * @param {BSTR} bstrCLSIDOrProgID The class ID or program ID of the component for which an alias is created.
     * @param {BSTR} bstrDestApplicationIDOrName The application ID or the name of the destination application that contains the alias. If this argument is <b>NULL</b> or an empty string, the alias is created within the source application.
     * @param {BSTR} bstrNewProgId The program ID of the alias.
     * @param {BSTR} bstrNewClsid The class ID of the alias. If this argument is <b>NULL</b> or an empty string, a new, unique class ID is assigned.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, and E_FAIL, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COMADMIN_E_AMBIGUOUS_APPLICATION_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one of the named applications exists in multiple partitions. To avoid this error, use application IDs instead of names.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-aliascomponent
     */
    AliasComponent(bstrSrcApplicationIDOrName, bstrCLSIDOrProgID, bstrDestApplicationIDOrName, bstrNewProgId, bstrNewClsid) {
        bstrSrcApplicationIDOrName := bstrSrcApplicationIDOrName is String ? BSTR.Alloc(bstrSrcApplicationIDOrName).Value : bstrSrcApplicationIDOrName
        bstrCLSIDOrProgID := bstrCLSIDOrProgID is String ? BSTR.Alloc(bstrCLSIDOrProgID).Value : bstrCLSIDOrProgID
        bstrDestApplicationIDOrName := bstrDestApplicationIDOrName is String ? BSTR.Alloc(bstrDestApplicationIDOrName).Value : bstrDestApplicationIDOrName
        bstrNewProgId := bstrNewProgId is String ? BSTR.Alloc(bstrNewProgId).Value : bstrNewProgId
        bstrNewClsid := bstrNewClsid is String ? BSTR.Alloc(bstrNewClsid).Value : bstrNewClsid

        result := ComCall(54, this, BSTR, bstrSrcApplicationIDOrName, BSTR, bstrCLSIDOrProgID, BSTR, bstrDestApplicationIDOrName, BSTR, bstrNewProgId, BSTR, bstrNewClsid, "HRESULT")
        return result
    }

    /**
     * Determines whether the specified DLL is in use by the COM+ catalog or the registry.
     * @param {BSTR} bstrDllName The full path to the DLL to be tested.
     * @returns {COMAdminInUse} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-issafetodelete
     */
    IsSafeToDelete(bstrDllName) {
        bstrDllName := bstrDllName is String ? BSTR.Alloc(bstrDllName).Value : bstrDllName

        result := ComCall(55, this, BSTR, bstrDllName, "int*", &pCOMAdminInUse := 0, "HRESULT")
        return pCOMAdminInUse
    }

    /**
     * Imports the specified classes into a COM+ application as unconfigured components.
     * @param {BSTR} bstrApplicationIDOrName The application ID or name of the application into which the components are to be imported.
     * @param {Pointer<VARIANT>} pVarCLSIDOrProgID The unconfigured components to be imported. Each element of the <b>Variant</b> may be a <b>String</b> containing a class ID or program ID, a single catalog object, or a catalog collection (for example, as returned by the <a href="https://docs.microsoft.com/windows/desktop/api/comadmin/nf-comadmin-icomadmincatalog2-getcollectionbyquery2">GetCollectionByQuery2</a> method).
     * @param {Pointer<VARIANT>} pVarComponentType 
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-importunconfiguredcomponents
     */
    ImportUnconfiguredComponents(bstrApplicationIDOrName, pVarCLSIDOrProgID, pVarComponentType) {
        bstrApplicationIDOrName := bstrApplicationIDOrName is String ? BSTR.Alloc(bstrApplicationIDOrName).Value : bstrApplicationIDOrName

        result := ComCall(56, this, BSTR, bstrApplicationIDOrName, VARIANT.Ptr, pVarCLSIDOrProgID, VARIANT.Ptr, pVarComponentType, "HRESULT")
        return result
    }

    /**
     * Promotes the specified classes from unconfigured components to configured components.
     * @param {BSTR} bstrApplicationIDOrName The application ID or name of the application containing the components to be promoted.
     * @param {Pointer<VARIANT>} pVarCLSIDOrProgID The unconfigured components to be promoted. Each element of the <b>Variant</b> may be a <b>String</b> containing a class ID or program ID, a single catalog object, or a catalog collection (for example, as returned by the <a href="https://docs.microsoft.com/windows/desktop/api/comadmin/nf-comadmin-icomadmincatalog2-getcollectionbyquery2">GetCollectionByQuery2</a> method).
     * @param {Pointer<VARIANT>} pVarComponentType 
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-promoteunconfiguredcomponents
     */
    PromoteUnconfiguredComponents(bstrApplicationIDOrName, pVarCLSIDOrProgID, pVarComponentType) {
        bstrApplicationIDOrName := bstrApplicationIDOrName is String ? BSTR.Alloc(bstrApplicationIDOrName).Value : bstrApplicationIDOrName

        result := ComCall(57, this, BSTR, bstrApplicationIDOrName, VARIANT.Ptr, pVarCLSIDOrProgID, VARIANT.Ptr, pVarComponentType, "HRESULT")
        return result
    }

    /**
     * Imports the specified components that are already registered into an application.
     * @param {BSTR} bstrApplicationIDOrName The application ID or name of the application into which the components are to be imported.
     * @param {Pointer<VARIANT>} pVarCLSIDOrProgID The components to be imported. Each element of the <b>Variant</b> may be a <b>String</b> containing a class ID or program ID, a single catalog object, or a catalog collection (for example, as returned by the <a href="https://docs.microsoft.com/windows/desktop/api/comadmin/nf-comadmin-icomadmincatalog2-getcollectionbyquery2">GetCollectionByQuery2</a> method).
     * @param {Pointer<VARIANT>} pVarComponentType 
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-importcomponents
     */
    ImportComponents(bstrApplicationIDOrName, pVarCLSIDOrProgID, pVarComponentType) {
        bstrApplicationIDOrName := bstrApplicationIDOrName is String ? BSTR.Alloc(bstrApplicationIDOrName).Value : bstrApplicationIDOrName

        result := ComCall(58, this, BSTR, bstrApplicationIDOrName, VARIANT.Ptr, pVarCLSIDOrProgID, VARIANT.Ptr, pVarComponentType, "HRESULT")
        return result
    }

    /**
     * Indicates whether the currently connected catalog server is a 64-bit computer.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-get_is64bitcatalogserver
     */
    get_Is64BitCatalogServer() {
        result := ComCall(59, this, VARIANT_BOOL.Ptr, &pbIs64Bit := 0, "HRESULT")
        return pbIs64Bit
    }

    /**
     * Exports a partition to a file.
     * @param {BSTR} bstrPartitionIDOrName The partition GUID or name of the partition.
     * @param {BSTR} bstrPartitionFileName The file to which the specified partition is exported. If no path is specified, the current directory is used. If no file name is specified, the application name is used.
     * @param {COMAdminApplicationExportOptions} lOptions 
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, and E_FAIL, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COMADMIN_E_OBJECT_DOES_NOT_EXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified partition does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-exportpartition
     */
    ExportPartition(bstrPartitionIDOrName, bstrPartitionFileName, lOptions) {
        bstrPartitionIDOrName := bstrPartitionIDOrName is String ? BSTR.Alloc(bstrPartitionIDOrName).Value : bstrPartitionIDOrName
        bstrPartitionFileName := bstrPartitionFileName is String ? BSTR.Alloc(bstrPartitionFileName).Value : bstrPartitionFileName

        result := ComCall(60, this, BSTR, bstrPartitionIDOrName, BSTR, bstrPartitionFileName, COMAdminApplicationExportOptions, lOptions, "HRESULT")
        return result
    }

    /**
     * Imports a partition from a file.
     * @param {BSTR} bstrFileName The file from which the partition is to be imported.
     * @param {BSTR} bstrDestDirectory The path to the directory in which to install the partition components.
     * @param {COMAdminApplicationInstallOptions} lOptions 
     * @param {BSTR} bstrUserID The user ID under which to install the partition.
     * @param {BSTR} bstrPassword The password for the specified user.
     * @param {BSTR} bstrRSN The name of a remote server to use as a proxy.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-installpartition
     */
    InstallPartition(bstrFileName, bstrDestDirectory, lOptions, bstrUserID, bstrPassword, bstrRSN) {
        bstrFileName := bstrFileName is String ? BSTR.Alloc(bstrFileName).Value : bstrFileName
        bstrDestDirectory := bstrDestDirectory is String ? BSTR.Alloc(bstrDestDirectory).Value : bstrDestDirectory
        bstrUserID := bstrUserID is String ? BSTR.Alloc(bstrUserID).Value : bstrUserID
        bstrPassword := bstrPassword is String ? BSTR.Alloc(bstrPassword).Value : bstrPassword
        bstrRSN := bstrRSN is String ? BSTR.Alloc(bstrRSN).Value : bstrRSN

        result := ComCall(61, this, BSTR, bstrFileName, BSTR, bstrDestDirectory, COMAdminApplicationInstallOptions, lOptions, BSTR, bstrUserID, BSTR, bstrPassword, BSTR, bstrRSN, "HRESULT")
        return result
    }

    /**
     * Retrieves information about an application that is about to be installed.
     * @param {BSTR} bstrApplicationFile The full path to the application file.
     * @returns {IDispatch} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/comadmin/nn-comadmin-icatalogcollection">ICatalogCollection</a> interface pointer that specifies the <a href="https://docs.microsoft.com/windows/desktop/cossdk/filesforimport">FilesForImport</a> collection for the application.
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-queryapplicationfile2
     */
    QueryApplicationFile2(bstrApplicationFile) {
        bstrApplicationFile := bstrApplicationFile is String ? BSTR.Alloc(bstrApplicationFile).Value : bstrApplicationFile

        result := ComCall(62, this, BSTR, bstrApplicationFile, "ptr*", &ppFilesForImport := 0, "HRESULT")
        return IDispatch(ppFilesForImport)
    }

    /**
     * Retrieves the number of partitions in which a specified component is installed.
     * @param {BSTR} bstrCLSIDOrProgID The class ID or program ID of the component.
     * @returns {Integer} The number of different partitions in which the component is installed.
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-getcomponentversioncount
     */
    GetComponentVersionCount(bstrCLSIDOrProgID) {
        bstrCLSIDOrProgID := bstrCLSIDOrProgID is String ? BSTR.Alloc(bstrCLSIDOrProgID).Value : bstrCLSIDOrProgID

        result := ComCall(63, this, BSTR, bstrCLSIDOrProgID, "int*", &plVersionCount := 0, "HRESULT")
        return plVersionCount
    }

    Query(iid) {
        if (ICOMAdminCatalog2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCollectionByQuery2 := CallbackCreate(GetMethod(implObj, "GetCollectionByQuery2"), flags, 4)
        this.vtbl.GetApplicationInstanceIDFromProcessID := CallbackCreate(GetMethod(implObj, "GetApplicationInstanceIDFromProcessID"), flags, 3)
        this.vtbl.ShutdownApplicationInstances := CallbackCreate(GetMethod(implObj, "ShutdownApplicationInstances"), flags, 2)
        this.vtbl.PauseApplicationInstances := CallbackCreate(GetMethod(implObj, "PauseApplicationInstances"), flags, 2)
        this.vtbl.ResumeApplicationInstances := CallbackCreate(GetMethod(implObj, "ResumeApplicationInstances"), flags, 2)
        this.vtbl.RecycleApplicationInstances := CallbackCreate(GetMethod(implObj, "RecycleApplicationInstances"), flags, 3)
        this.vtbl.AreApplicationInstancesPaused := CallbackCreate(GetMethod(implObj, "AreApplicationInstancesPaused"), flags, 3)
        this.vtbl.DumpApplicationInstance := CallbackCreate(GetMethod(implObj, "DumpApplicationInstance"), flags, 5)
        this.vtbl.get_IsApplicationInstanceDumpSupported := CallbackCreate(GetMethod(implObj, "get_IsApplicationInstanceDumpSupported"), flags, 2)
        this.vtbl.CreateServiceForApplication := CallbackCreate(GetMethod(implObj, "CreateServiceForApplication"), flags, 9)
        this.vtbl.DeleteServiceForApplication := CallbackCreate(GetMethod(implObj, "DeleteServiceForApplication"), flags, 2)
        this.vtbl.GetPartitionID := CallbackCreate(GetMethod(implObj, "GetPartitionID"), flags, 3)
        this.vtbl.GetPartitionName := CallbackCreate(GetMethod(implObj, "GetPartitionName"), flags, 3)
        this.vtbl.put_CurrentPartition := CallbackCreate(GetMethod(implObj, "put_CurrentPartition"), flags, 2)
        this.vtbl.get_CurrentPartitionID := CallbackCreate(GetMethod(implObj, "get_CurrentPartitionID"), flags, 2)
        this.vtbl.get_CurrentPartitionName := CallbackCreate(GetMethod(implObj, "get_CurrentPartitionName"), flags, 2)
        this.vtbl.get_GlobalPartitionID := CallbackCreate(GetMethod(implObj, "get_GlobalPartitionID"), flags, 2)
        this.vtbl.FlushPartitionCache := CallbackCreate(GetMethod(implObj, "FlushPartitionCache"), flags, 1)
        this.vtbl.CopyApplications := CallbackCreate(GetMethod(implObj, "CopyApplications"), flags, 4)
        this.vtbl.CopyComponents := CallbackCreate(GetMethod(implObj, "CopyComponents"), flags, 4)
        this.vtbl.MoveComponents := CallbackCreate(GetMethod(implObj, "MoveComponents"), flags, 4)
        this.vtbl.AliasComponent := CallbackCreate(GetMethod(implObj, "AliasComponent"), flags, 6)
        this.vtbl.IsSafeToDelete := CallbackCreate(GetMethod(implObj, "IsSafeToDelete"), flags, 3)
        this.vtbl.ImportUnconfiguredComponents := CallbackCreate(GetMethod(implObj, "ImportUnconfiguredComponents"), flags, 4)
        this.vtbl.PromoteUnconfiguredComponents := CallbackCreate(GetMethod(implObj, "PromoteUnconfiguredComponents"), flags, 4)
        this.vtbl.ImportComponents := CallbackCreate(GetMethod(implObj, "ImportComponents"), flags, 4)
        this.vtbl.get_Is64BitCatalogServer := CallbackCreate(GetMethod(implObj, "get_Is64BitCatalogServer"), flags, 2)
        this.vtbl.ExportPartition := CallbackCreate(GetMethod(implObj, "ExportPartition"), flags, 4)
        this.vtbl.InstallPartition := CallbackCreate(GetMethod(implObj, "InstallPartition"), flags, 7)
        this.vtbl.QueryApplicationFile2 := CallbackCreate(GetMethod(implObj, "QueryApplicationFile2"), flags, 3)
        this.vtbl.GetComponentVersionCount := CallbackCreate(GetMethod(implObj, "GetComponentVersionCount"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCollectionByQuery2)
        CallbackFree(this.vtbl.GetApplicationInstanceIDFromProcessID)
        CallbackFree(this.vtbl.ShutdownApplicationInstances)
        CallbackFree(this.vtbl.PauseApplicationInstances)
        CallbackFree(this.vtbl.ResumeApplicationInstances)
        CallbackFree(this.vtbl.RecycleApplicationInstances)
        CallbackFree(this.vtbl.AreApplicationInstancesPaused)
        CallbackFree(this.vtbl.DumpApplicationInstance)
        CallbackFree(this.vtbl.get_IsApplicationInstanceDumpSupported)
        CallbackFree(this.vtbl.CreateServiceForApplication)
        CallbackFree(this.vtbl.DeleteServiceForApplication)
        CallbackFree(this.vtbl.GetPartitionID)
        CallbackFree(this.vtbl.GetPartitionName)
        CallbackFree(this.vtbl.put_CurrentPartition)
        CallbackFree(this.vtbl.get_CurrentPartitionID)
        CallbackFree(this.vtbl.get_CurrentPartitionName)
        CallbackFree(this.vtbl.get_GlobalPartitionID)
        CallbackFree(this.vtbl.FlushPartitionCache)
        CallbackFree(this.vtbl.CopyApplications)
        CallbackFree(this.vtbl.CopyComponents)
        CallbackFree(this.vtbl.MoveComponents)
        CallbackFree(this.vtbl.AliasComponent)
        CallbackFree(this.vtbl.IsSafeToDelete)
        CallbackFree(this.vtbl.ImportUnconfiguredComponents)
        CallbackFree(this.vtbl.PromoteUnconfiguredComponents)
        CallbackFree(this.vtbl.ImportComponents)
        CallbackFree(this.vtbl.get_Is64BitCatalogServer)
        CallbackFree(this.vtbl.ExportPartition)
        CallbackFree(this.vtbl.InstallPartition)
        CallbackFree(this.vtbl.QueryApplicationFile2)
        CallbackFree(this.vtbl.GetComponentVersionCount)
    }
}
