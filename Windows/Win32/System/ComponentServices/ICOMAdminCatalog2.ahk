#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk
#Include .\ICOMAdminCatalog.ahk

/**
 * An extension of the ICOMAdminCatalog interface.
 * @see https://docs.microsoft.com/windows/win32/api//comadmin/nn-comadmin-icomadmincatalog2
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ICOMAdminCatalog2 extends ICOMAdminCatalog{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICOMAdminCatalog2
     * @type {Guid}
     */
    static IID => Guid("{790c6e0b-9194-4cc9-9426-a48a63185696}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 33

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCollectionByQuery2", "GetApplicationInstanceIDFromProcessID", "ShutdownApplicationInstances", "PauseApplicationInstances", "ResumeApplicationInstances", "RecycleApplicationInstances", "AreApplicationInstancesPaused", "DumpApplicationInstance", "get_IsApplicationInstanceDumpSupported", "CreateServiceForApplication", "DeleteServiceForApplication", "GetPartitionID", "GetPartitionName", "put_CurrentPartition", "get_CurrentPartitionID", "get_CurrentPartitionName", "get_GlobalPartitionID", "FlushPartitionCache", "CopyApplications", "CopyComponents", "MoveComponents", "AliasComponent", "IsSafeToDelete", "ImportUnconfiguredComponents", "PromoteUnconfiguredComponents", "ImportComponents", "get_Is64BitCatalogServer", "ExportPartition", "InstallPartition", "QueryApplicationFile2", "GetComponentVersionCount"]

    /**
     * @type {VARIANT_BOOL} 
     */
    IsApplicationInstanceDumpSupported {
        get => this.get_IsApplicationInstanceDumpSupported()
    }

    /**
     * @type {HRESULT} 
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
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog2-getcollectionbyquery2
     */
    GetCollectionByQuery2(bstrCollectionName, pVarQueryStrings) {
        bstrCollectionName := bstrCollectionName is String ? BSTR.Alloc(bstrCollectionName).Value : bstrCollectionName

        result := ComCall(33, this, "ptr", bstrCollectionName, "ptr", pVarQueryStrings, "ptr*", &ppCatalogCollection := 0, "HRESULT")
        return IDispatch(ppCatalogCollection)
    }

    /**
     * Retrieives the application instance identifier for the specified process identifier.
     * @param {Integer} lProcessID The process ID.
     * @returns {BSTR} The corresponding application instance ID.
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog2-getapplicationinstanceidfromprocessid
     */
    GetApplicationInstanceIDFromProcessID(lProcessID) {
        pbstrApplicationInstanceID := BSTR()
        result := ComCall(34, this, "int", lProcessID, "ptr", pbstrApplicationInstanceID, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog2-shutdownapplicationinstances
     */
    ShutdownApplicationInstances(pVarApplicationInstanceID) {
        result := ComCall(35, this, "ptr", pVarApplicationInstanceID, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog2-pauseapplicationinstances
     */
    PauseApplicationInstances(pVarApplicationInstanceID) {
        result := ComCall(36, this, "ptr", pVarApplicationInstanceID, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog2-resumeapplicationinstances
     */
    ResumeApplicationInstances(pVarApplicationInstanceID) {
        result := ComCall(37, this, "ptr", pVarApplicationInstanceID, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog2-recycleapplicationinstances
     */
    RecycleApplicationInstances(pVarApplicationInstanceID, lReasonCode) {
        result := ComCall(38, this, "ptr", pVarApplicationInstanceID, "int", lReasonCode, "HRESULT")
        return result
    }

    /**
     * Determines whether any of the specified application instances (processes) are paused.
     * @param {Pointer<VARIANT>} pVarApplicationInstanceID The application instances to be checked. Each element of the <b>Variant</b> may be a <b>String</b> containing an application instance ID (for example, as returned by the <a href="https://docs.microsoft.com/windows/desktop/api/comadmin/nf-comadmin-icomadmincatalog2-getapplicationinstanceidfromprocessid">GetApplicationInstanceIDFromProcessID</a> method), a single catalog object, or a catalog collection (for example, as returned by the <a href="https://docs.microsoft.com/windows/desktop/api/comadmin/nf-comadmin-icomadmincatalog2-getcollectionbyquery2">GetCollectionByQuery2</a> method).
     * @returns {VARIANT_BOOL} Indicates whether the specified applications are paused.
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog2-areapplicationinstancespaused
     */
    AreApplicationInstancesPaused(pVarApplicationInstanceID) {
        result := ComCall(39, this, "ptr", pVarApplicationInstanceID, "short*", &pVarBoolPaused := 0, "HRESULT")
        return pVarBoolPaused
    }

    /**
     * Creates a dump file containing an image of the state of the specified application instance (process).
     * @param {BSTR} bstrApplicationInstanceID The GUID of the application instance.
     * @param {BSTR} bstrDirectory The complete path to the directory into which the dump file is placed. Do not include the file name. If this parameter is <b>NULL</b>, the default directory is %SystemRoot%\system32\com\dmp.
     * @param {Integer} lMaxImages The maximum number of dump files that may exist in the dump directory. Specifying this variable prevents dump files from consuming too much storage space.
     * @returns {BSTR} The name of the dump file containing the resulting application instance image.
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog2-dumpapplicationinstance
     */
    DumpApplicationInstance(bstrApplicationInstanceID, bstrDirectory, lMaxImages) {
        bstrApplicationInstanceID := bstrApplicationInstanceID is String ? BSTR.Alloc(bstrApplicationInstanceID).Value : bstrApplicationInstanceID
        bstrDirectory := bstrDirectory is String ? BSTR.Alloc(bstrDirectory).Value : bstrDirectory

        pbstrDumpFile := BSTR()
        result := ComCall(40, this, "ptr", bstrApplicationInstanceID, "ptr", bstrDirectory, "int", lMaxImages, "ptr", pbstrDumpFile, "HRESULT")
        return pbstrDumpFile
    }

    /**
     * Indicates whether the software required for application instance dumps is installed.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog2-get_isapplicationinstancedumpsupported
     */
    get_IsApplicationInstanceDumpSupported() {
        result := ComCall(41, this, "short*", &pVarBoolDumpSupported := 0, "HRESULT")
        return pVarBoolDumpSupported
    }

    /**
     * Configures a COM+ application to run as a Windows service.
     * @param {BSTR} bstrApplicationIDOrName The application ID or name of the application.
     * @param {BSTR} bstrServiceName The service name of the application. This name is the internal name used by the service control manager (SCM), not the display name.
     * @param {BSTR} bstrStartType When to start the service. The valid arguments are the options of the <i>dwStartType</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function. The arguments must be in quotes. The following are the valid arguments: SERVICE_BOOT_START, SERVICE_SYSTEM_START, SERVICE_AUTO_START, SERVICE_DEMAND_START, and SERVICE_DISABLED.
     * @param {BSTR} bstrErrorControl The severity of the error if this service fails to start during startup. The error determines the action taken by the startup program if failure occurs. The valid arguments are the options of the <i>dwErrorControl</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function. The arguments must be in quotes. The following are the valid arguments: SERVICE_ERROR_IGNORE, SERVICE_ERROR_NORMAL, SERVICE_ERROR_SEVERE, and SERVICE_ERROR_CRITICAL.
     * @param {BSTR} bstrDependencies A list of dependencies for the service. There are two possible formats for the string: a standard null-delimited, double-null-terminated string (exactly as documented for <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a>); or a script-friendly list of service names separated by "\" (an invalid character to have in a service name). The rpcss service is implicit in this parameter and does not need to be specified.
     * @param {BSTR} bstrRunAs The user name to run this service as. If this parameter is <b>NULL</b>, the service will run as Local Service.
     * @param {BSTR} bstrPassword The password for the system user account. This parameter must be <b>NULL</b> if the service is configured to run as Local Service.
     * @param {VARIANT_BOOL} bDesktopOk Indicates whether the service should be allowed to interact with the desktop. This parameter is valid only when the service is marked as Local Service and must be <b>FALSE</b> otherwise.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog2-createserviceforapplication
     */
    CreateServiceForApplication(bstrApplicationIDOrName, bstrServiceName, bstrStartType, bstrErrorControl, bstrDependencies, bstrRunAs, bstrPassword, bDesktopOk) {
        bstrApplicationIDOrName := bstrApplicationIDOrName is String ? BSTR.Alloc(bstrApplicationIDOrName).Value : bstrApplicationIDOrName
        bstrServiceName := bstrServiceName is String ? BSTR.Alloc(bstrServiceName).Value : bstrServiceName
        bstrStartType := bstrStartType is String ? BSTR.Alloc(bstrStartType).Value : bstrStartType
        bstrErrorControl := bstrErrorControl is String ? BSTR.Alloc(bstrErrorControl).Value : bstrErrorControl
        bstrDependencies := bstrDependencies is String ? BSTR.Alloc(bstrDependencies).Value : bstrDependencies
        bstrRunAs := bstrRunAs is String ? BSTR.Alloc(bstrRunAs).Value : bstrRunAs
        bstrPassword := bstrPassword is String ? BSTR.Alloc(bstrPassword).Value : bstrPassword

        result := ComCall(42, this, "ptr", bstrApplicationIDOrName, "ptr", bstrServiceName, "ptr", bstrStartType, "ptr", bstrErrorControl, "ptr", bstrDependencies, "ptr", bstrRunAs, "ptr", bstrPassword, "short", bDesktopOk, "HRESULT")
        return result
    }

    /**
     * Deletes the Windows service associated with the specified COM+ application.
     * @param {BSTR} bstrApplicationIDOrName The application ID or name of the COM+ application to be deleted.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog2-deleteserviceforapplication
     */
    DeleteServiceForApplication(bstrApplicationIDOrName) {
        bstrApplicationIDOrName := bstrApplicationIDOrName is String ? BSTR.Alloc(bstrApplicationIDOrName).Value : bstrApplicationIDOrName

        result := ComCall(43, this, "ptr", bstrApplicationIDOrName, "HRESULT")
        return result
    }

    /**
     * Retrieves the partition identifier for the specified COM+ application.
     * @param {BSTR} bstrApplicationIDOrName The application ID or name of a COM+ application.
     * @returns {BSTR} The partition GUID associated with the specified application.
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog2-getpartitionid
     */
    GetPartitionID(bstrApplicationIDOrName) {
        bstrApplicationIDOrName := bstrApplicationIDOrName is String ? BSTR.Alloc(bstrApplicationIDOrName).Value : bstrApplicationIDOrName

        pbstrPartitionID := BSTR()
        result := ComCall(44, this, "ptr", bstrApplicationIDOrName, "ptr", pbstrPartitionID, "HRESULT")
        return pbstrPartitionID
    }

    /**
     * Retrieves the name of the specified COM+ application.
     * @param {BSTR} bstrApplicationIDOrName The application ID or name of a COM+ application.
     * @returns {BSTR} The partition name associated with the specified application.
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog2-getpartitionname
     */
    GetPartitionName(bstrApplicationIDOrName) {
        bstrApplicationIDOrName := bstrApplicationIDOrName is String ? BSTR.Alloc(bstrApplicationIDOrName).Value : bstrApplicationIDOrName

        pbstrPartitionName := BSTR()
        result := ComCall(45, this, "ptr", bstrApplicationIDOrName, "ptr", pbstrPartitionName, "HRESULT")
        return pbstrPartitionName
    }

    /**
     * Sets the current destination partition.
     * @param {BSTR} bstrPartitionIDOrName 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog2-put_currentpartition
     */
    put_CurrentPartition(bstrPartitionIDOrName) {
        bstrPartitionIDOrName := bstrPartitionIDOrName is String ? BSTR.Alloc(bstrPartitionIDOrName).Value : bstrPartitionIDOrName

        result := ComCall(46, this, "ptr", bstrPartitionIDOrName, "HRESULT")
        return result
    }

    /**
     * Retrieves the identifier for the current partition.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog2-get_currentpartitionid
     */
    get_CurrentPartitionID() {
        pbstrPartitionID := BSTR()
        result := ComCall(47, this, "ptr", pbstrPartitionID, "HRESULT")
        return pbstrPartitionID
    }

    /**
     * Retrieves the name of the current partition.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog2-get_currentpartitionname
     */
    get_CurrentPartitionName() {
        pbstrPartitionName := BSTR()
        result := ComCall(48, this, "ptr", pbstrPartitionName, "HRESULT")
        return pbstrPartitionName
    }

    /**
     * Retrieves the identifier for the global partition.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog2-get_globalpartitionid
     */
    get_GlobalPartitionID() {
        pbstrGlobalPartitionID := BSTR()
        result := ComCall(49, this, "ptr", pbstrGlobalPartitionID, "HRESULT")
        return pbstrGlobalPartitionID
    }

    /**
     * Empties the cache that maps users to their default partitions.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog2-flushpartitioncache
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
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog2-copyapplications
     */
    CopyApplications(bstrSourcePartitionIDOrName, pVarApplicationID, bstrDestinationPartitionIDOrName) {
        bstrSourcePartitionIDOrName := bstrSourcePartitionIDOrName is String ? BSTR.Alloc(bstrSourcePartitionIDOrName).Value : bstrSourcePartitionIDOrName
        bstrDestinationPartitionIDOrName := bstrDestinationPartitionIDOrName is String ? BSTR.Alloc(bstrDestinationPartitionIDOrName).Value : bstrDestinationPartitionIDOrName

        result := ComCall(51, this, "ptr", bstrSourcePartitionIDOrName, "ptr", pVarApplicationID, "ptr", bstrDestinationPartitionIDOrName, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog2-copycomponents
     */
    CopyComponents(bstrSourceApplicationIDOrName, pVarCLSIDOrProgID, bstrDestinationApplicationIDOrName) {
        bstrSourceApplicationIDOrName := bstrSourceApplicationIDOrName is String ? BSTR.Alloc(bstrSourceApplicationIDOrName).Value : bstrSourceApplicationIDOrName
        bstrDestinationApplicationIDOrName := bstrDestinationApplicationIDOrName is String ? BSTR.Alloc(bstrDestinationApplicationIDOrName).Value : bstrDestinationApplicationIDOrName

        result := ComCall(52, this, "ptr", bstrSourceApplicationIDOrName, "ptr", pVarCLSIDOrProgID, "ptr", bstrDestinationApplicationIDOrName, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog2-movecomponents
     */
    MoveComponents(bstrSourceApplicationIDOrName, pVarCLSIDOrProgID, bstrDestinationApplicationIDOrName) {
        bstrSourceApplicationIDOrName := bstrSourceApplicationIDOrName is String ? BSTR.Alloc(bstrSourceApplicationIDOrName).Value : bstrSourceApplicationIDOrName
        bstrDestinationApplicationIDOrName := bstrDestinationApplicationIDOrName is String ? BSTR.Alloc(bstrDestinationApplicationIDOrName).Value : bstrDestinationApplicationIDOrName

        result := ComCall(53, this, "ptr", bstrSourceApplicationIDOrName, "ptr", pVarCLSIDOrProgID, "ptr", bstrDestinationApplicationIDOrName, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog2-aliascomponent
     */
    AliasComponent(bstrSrcApplicationIDOrName, bstrCLSIDOrProgID, bstrDestApplicationIDOrName, bstrNewProgId, bstrNewClsid) {
        bstrSrcApplicationIDOrName := bstrSrcApplicationIDOrName is String ? BSTR.Alloc(bstrSrcApplicationIDOrName).Value : bstrSrcApplicationIDOrName
        bstrCLSIDOrProgID := bstrCLSIDOrProgID is String ? BSTR.Alloc(bstrCLSIDOrProgID).Value : bstrCLSIDOrProgID
        bstrDestApplicationIDOrName := bstrDestApplicationIDOrName is String ? BSTR.Alloc(bstrDestApplicationIDOrName).Value : bstrDestApplicationIDOrName
        bstrNewProgId := bstrNewProgId is String ? BSTR.Alloc(bstrNewProgId).Value : bstrNewProgId
        bstrNewClsid := bstrNewClsid is String ? BSTR.Alloc(bstrNewClsid).Value : bstrNewClsid

        result := ComCall(54, this, "ptr", bstrSrcApplicationIDOrName, "ptr", bstrCLSIDOrProgID, "ptr", bstrDestApplicationIDOrName, "ptr", bstrNewProgId, "ptr", bstrNewClsid, "HRESULT")
        return result
    }

    /**
     * Determines whether the specified DLL is in use by the COM+ catalog or the registry.
     * @param {BSTR} bstrDllName The full path to the DLL to be tested.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog2-issafetodelete
     */
    IsSafeToDelete(bstrDllName) {
        bstrDllName := bstrDllName is String ? BSTR.Alloc(bstrDllName).Value : bstrDllName

        result := ComCall(55, this, "ptr", bstrDllName, "int*", &pCOMAdminInUse := 0, "HRESULT")
        return pCOMAdminInUse
    }

    /**
     * Imports the specified classes into a COM+ application as unconfigured components.
     * @param {BSTR} bstrApplicationIDOrName The application ID or name of the application into which the components are to be imported.
     * @param {Pointer<VARIANT>} pVarCLSIDOrProgID The unconfigured components to be imported. Each element of the <b>Variant</b> may be a <b>String</b> containing a class ID or program ID, a single catalog object, or a catalog collection (for example, as returned by the <a href="https://docs.microsoft.com/windows/desktop/api/comadmin/nf-comadmin-icomadmincatalog2-getcollectionbyquery2">GetCollectionByQuery2</a> method).
     * @param {Pointer<VARIANT>} pVarComponentType 
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog2-importunconfiguredcomponents
     */
    ImportUnconfiguredComponents(bstrApplicationIDOrName, pVarCLSIDOrProgID, pVarComponentType) {
        bstrApplicationIDOrName := bstrApplicationIDOrName is String ? BSTR.Alloc(bstrApplicationIDOrName).Value : bstrApplicationIDOrName

        result := ComCall(56, this, "ptr", bstrApplicationIDOrName, "ptr", pVarCLSIDOrProgID, "ptr", pVarComponentType, "HRESULT")
        return result
    }

    /**
     * Promotes the specified classes from unconfigured components to configured components.
     * @param {BSTR} bstrApplicationIDOrName The application ID or name of the application containing the components to be promoted.
     * @param {Pointer<VARIANT>} pVarCLSIDOrProgID The unconfigured components to be promoted. Each element of the <b>Variant</b> may be a <b>String</b> containing a class ID or program ID, a single catalog object, or a catalog collection (for example, as returned by the <a href="https://docs.microsoft.com/windows/desktop/api/comadmin/nf-comadmin-icomadmincatalog2-getcollectionbyquery2">GetCollectionByQuery2</a> method).
     * @param {Pointer<VARIANT>} pVarComponentType 
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog2-promoteunconfiguredcomponents
     */
    PromoteUnconfiguredComponents(bstrApplicationIDOrName, pVarCLSIDOrProgID, pVarComponentType) {
        bstrApplicationIDOrName := bstrApplicationIDOrName is String ? BSTR.Alloc(bstrApplicationIDOrName).Value : bstrApplicationIDOrName

        result := ComCall(57, this, "ptr", bstrApplicationIDOrName, "ptr", pVarCLSIDOrProgID, "ptr", pVarComponentType, "HRESULT")
        return result
    }

    /**
     * Imports the specified components that are already registered into an application.
     * @param {BSTR} bstrApplicationIDOrName The application ID or name of the application into which the components are to be imported.
     * @param {Pointer<VARIANT>} pVarCLSIDOrProgID The components to be imported. Each element of the <b>Variant</b> may be a <b>String</b> containing a class ID or program ID, a single catalog object, or a catalog collection (for example, as returned by the <a href="https://docs.microsoft.com/windows/desktop/api/comadmin/nf-comadmin-icomadmincatalog2-getcollectionbyquery2">GetCollectionByQuery2</a> method).
     * @param {Pointer<VARIANT>} pVarComponentType 
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog2-importcomponents
     */
    ImportComponents(bstrApplicationIDOrName, pVarCLSIDOrProgID, pVarComponentType) {
        bstrApplicationIDOrName := bstrApplicationIDOrName is String ? BSTR.Alloc(bstrApplicationIDOrName).Value : bstrApplicationIDOrName

        result := ComCall(58, this, "ptr", bstrApplicationIDOrName, "ptr", pVarCLSIDOrProgID, "ptr", pVarComponentType, "HRESULT")
        return result
    }

    /**
     * Indicates whether the currently connected catalog server is a 64-bit computer.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog2-get_is64bitcatalogserver
     */
    get_Is64BitCatalogServer() {
        result := ComCall(59, this, "short*", &pbIs64Bit := 0, "HRESULT")
        return pbIs64Bit
    }

    /**
     * Exports a partition to a file.
     * @param {BSTR} bstrPartitionIDOrName The partition GUID or name of the partition.
     * @param {BSTR} bstrPartitionFileName The file to which the specified partition is exported. If no path is specified, the current directory is used. If no file name is specified, the application name is used.
     * @param {Integer} lOptions 
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
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog2-exportpartition
     */
    ExportPartition(bstrPartitionIDOrName, bstrPartitionFileName, lOptions) {
        bstrPartitionIDOrName := bstrPartitionIDOrName is String ? BSTR.Alloc(bstrPartitionIDOrName).Value : bstrPartitionIDOrName
        bstrPartitionFileName := bstrPartitionFileName is String ? BSTR.Alloc(bstrPartitionFileName).Value : bstrPartitionFileName

        result := ComCall(60, this, "ptr", bstrPartitionIDOrName, "ptr", bstrPartitionFileName, "int", lOptions, "HRESULT")
        return result
    }

    /**
     * Imports a partition from a file.
     * @param {BSTR} bstrFileName The file from which the partition is to be imported.
     * @param {BSTR} bstrDestDirectory The path to the directory in which to install the partition components.
     * @param {Integer} lOptions 
     * @param {BSTR} bstrUserID The user ID under which to install the partition.
     * @param {BSTR} bstrPassword The password for the specified user.
     * @param {BSTR} bstrRSN The name of a remote server to use as a proxy.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog2-installpartition
     */
    InstallPartition(bstrFileName, bstrDestDirectory, lOptions, bstrUserID, bstrPassword, bstrRSN) {
        bstrFileName := bstrFileName is String ? BSTR.Alloc(bstrFileName).Value : bstrFileName
        bstrDestDirectory := bstrDestDirectory is String ? BSTR.Alloc(bstrDestDirectory).Value : bstrDestDirectory
        bstrUserID := bstrUserID is String ? BSTR.Alloc(bstrUserID).Value : bstrUserID
        bstrPassword := bstrPassword is String ? BSTR.Alloc(bstrPassword).Value : bstrPassword
        bstrRSN := bstrRSN is String ? BSTR.Alloc(bstrRSN).Value : bstrRSN

        result := ComCall(61, this, "ptr", bstrFileName, "ptr", bstrDestDirectory, "int", lOptions, "ptr", bstrUserID, "ptr", bstrPassword, "ptr", bstrRSN, "HRESULT")
        return result
    }

    /**
     * Retrieves information about an application that is about to be installed.
     * @param {BSTR} bstrApplicationFile The full path to the application file.
     * @returns {IDispatch} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/comadmin/nn-comadmin-icatalogcollection">ICatalogCollection</a> interface pointer that specifies the <a href="https://docs.microsoft.com/windows/desktop/cossdk/filesforimport">FilesForImport</a> collection for the application.
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog2-queryapplicationfile2
     */
    QueryApplicationFile2(bstrApplicationFile) {
        bstrApplicationFile := bstrApplicationFile is String ? BSTR.Alloc(bstrApplicationFile).Value : bstrApplicationFile

        result := ComCall(62, this, "ptr", bstrApplicationFile, "ptr*", &ppFilesForImport := 0, "HRESULT")
        return IDispatch(ppFilesForImport)
    }

    /**
     * Retrieves the number of partitions in which a specified component is installed.
     * @param {BSTR} bstrCLSIDOrProgID The class ID or program ID of the component.
     * @returns {Integer} The number of different partitions in which the component is installed.
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog2-getcomponentversioncount
     */
    GetComponentVersionCount(bstrCLSIDOrProgID) {
        bstrCLSIDOrProgID := bstrCLSIDOrProgID is String ? BSTR.Alloc(bstrCLSIDOrProgID).Value : bstrCLSIDOrProgID

        result := ComCall(63, this, "ptr", bstrCLSIDOrProgID, "int*", &plVersionCount := 0, "HRESULT")
        return plVersionCount
    }
}
