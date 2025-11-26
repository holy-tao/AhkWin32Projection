#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Initiates a session to do programmatic COM+ administration, access collections in the catalog, install COM+ applications and components, start and stop services, and connect to remote servers.
 * @see https://docs.microsoft.com/windows/win32/api//comadmin/nn-comadmin-icomadmincatalog
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ICOMAdminCatalog extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICOMAdminCatalog
     * @type {Guid}
     */
    static IID => Guid("{dd662187-dfc2-11d1-a2cf-00805fc79235}")

    /**
     * The class identifier for COMAdminCatalog
     * @type {Guid}
     */
    static CLSID => Guid("{f618c514-dfb8-11d1-a2cf-00805fc79235}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCollection", "Connect", "get_MajorVersion", "get_MinorVersion", "GetCollectionByQuery", "ImportComponent", "InstallComponent", "ShutdownApplication", "ExportApplication", "InstallApplication", "StopRouter", "RefreshRouter", "StartRouter", "Reserved1", "Reserved2", "InstallMultipleComponents", "GetMultipleComponentsInfo", "RefreshComponents", "BackupREGDB", "RestoreREGDB", "QueryApplicationFile", "StartApplication", "ServiceCheck", "InstallMultipleEventClasses", "InstallEventClass", "GetEventClassesForIID"]

    /**
     * @type {Integer} 
     */
    MajorVersion {
        get => this.get_MajorVersion()
    }

    /**
     * @type {Integer} 
     */
    MinorVersion {
        get => this.get_MinorVersion()
    }

    /**
     * Retrieves a top-level collection on the COM+ catalog.
     * @param {BSTR} bstrCollName The name of the collection to be retrieved.
     * @returns {IDispatch} The <a href="https://docs.microsoft.com/windows/desktop/api/comadmin/nn-comadmin-icatalogcollection">ICatalogCollection</a> interface for the collection.
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog-getcollection
     */
    GetCollection(bstrCollName) {
        bstrCollName := bstrCollName is String ? BSTR.Alloc(bstrCollName).Value : bstrCollName

        result := ComCall(7, this, "ptr", bstrCollName, "ptr*", &ppCatalogCollection := 0, "HRESULT")
        return IDispatch(ppCatalogCollection)
    }

    /**
     * Connects to the COM+ catalog on a specified remote computer.
     * @param {BSTR} bstrCatalogServerName The name of the remote computer. To connect to the local computer, use an empty string.
     * @returns {IDispatch} The <a href="https://docs.microsoft.com/windows/desktop/api/comadmin/nn-comadmin-icatalogcollection">ICatalogCollection</a> interface for the root collection on the remote computer.
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog-connect
     */
    Connect(bstrCatalogServerName) {
        bstrCatalogServerName := bstrCatalogServerName is String ? BSTR.Alloc(bstrCatalogServerName).Value : bstrCatalogServerName

        result := ComCall(8, this, "ptr", bstrCatalogServerName, "ptr*", &ppCatalogCollection := 0, "HRESULT")
        return IDispatch(ppCatalogCollection)
    }

    /**
     * Retrieves the major version number of the COMAdmin library.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog-get_majorversion
     */
    get_MajorVersion() {
        result := ComCall(9, this, "int*", &plMajorVersion := 0, "HRESULT")
        return plMajorVersion
    }

    /**
     * Retrieves the minor version number of the COMAdmin library.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog-get_minorversion
     */
    get_MinorVersion() {
        result := ComCall(10, this, "int*", &plMinorVersion := 0, "HRESULT")
        return plMinorVersion
    }

    /**
     * Retrieves a collection on the COM+ catalog given the key property values for all of its parent items.
     * @param {BSTR} bstrCollName The name of the collection to be retrieved.
     * @param {Pointer<Pointer<SAFEARRAY>>} ppsaVarQuery A reference to an array consisting of key property values for all parent items of the collection to be retrieved.
     * @returns {IDispatch} The <a href="https://docs.microsoft.com/windows/desktop/api/comadmin/nn-comadmin-icatalogcollection">ICatalogCollection</a> interface for the collection.
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog-getcollectionbyquery
     */
    GetCollectionByQuery(bstrCollName, ppsaVarQuery) {
        bstrCollName := bstrCollName is String ? BSTR.Alloc(bstrCollName).Value : bstrCollName

        ppsaVarQueryMarshal := ppsaVarQuery is VarRef ? "ptr*" : "ptr"

        result := ComCall(11, this, "ptr", bstrCollName, ppsaVarQueryMarshal, ppsaVarQuery, "ptr*", &ppCatalogCollection := 0, "HRESULT")
        return IDispatch(ppCatalogCollection)
    }

    /**
     * Imports a component already registered as an in-process server into a COM+ application.
     * @param {BSTR} bstrApplIDOrName The GUID or name of the application.
     * @param {BSTR} bstrCLSIDOrProgID The CLSID or ProgID for the component to import.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog-importcomponent
     */
    ImportComponent(bstrApplIDOrName, bstrCLSIDOrProgID) {
        bstrApplIDOrName := bstrApplIDOrName is String ? BSTR.Alloc(bstrApplIDOrName).Value : bstrApplIDOrName
        bstrCLSIDOrProgID := bstrCLSIDOrProgID is String ? BSTR.Alloc(bstrCLSIDOrProgID).Value : bstrCLSIDOrProgID

        result := ComCall(12, this, "ptr", bstrApplIDOrName, "ptr", bstrCLSIDOrProgID, "HRESULT")
        return result
    }

    /**
     * Installs all components (COM classes) from a DLL file into a COM+ application and registers the components in the COM+ class registration database.
     * @param {BSTR} bstrApplIDOrName The GUID or name of the application.
     * @param {BSTR} bstrDLL The name of the DLL file containing the component to be installed.
     * @param {BSTR} bstrTLB The name of the external type library file. If the type library file is embedded in the DLL, pass in an empty string for this parameter.
     * @param {BSTR} bstrPSDLL The name of the proxy-stub DLL file. If there is no proxy-stub DLL associated with the component, pass in an empty string for this parameter.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog-installcomponent
     */
    InstallComponent(bstrApplIDOrName, bstrDLL, bstrTLB, bstrPSDLL) {
        bstrApplIDOrName := bstrApplIDOrName is String ? BSTR.Alloc(bstrApplIDOrName).Value : bstrApplIDOrName
        bstrDLL := bstrDLL is String ? BSTR.Alloc(bstrDLL).Value : bstrDLL
        bstrTLB := bstrTLB is String ? BSTR.Alloc(bstrTLB).Value : bstrTLB
        bstrPSDLL := bstrPSDLL is String ? BSTR.Alloc(bstrPSDLL).Value : bstrPSDLL

        result := ComCall(13, this, "ptr", bstrApplIDOrName, "ptr", bstrDLL, "ptr", bstrTLB, "ptr", bstrPSDLL, "HRESULT")
        return result
    }

    /**
     * Initiates shutdown of a COM+ server application process.
     * @param {BSTR} bstrApplIDOrName The GUID or name of the application.
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
     * The application does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog-shutdownapplication
     */
    ShutdownApplication(bstrApplIDOrName) {
        bstrApplIDOrName := bstrApplIDOrName is String ? BSTR.Alloc(bstrApplIDOrName).Value : bstrApplIDOrName

        result := ComCall(14, this, "ptr", bstrApplIDOrName, "HRESULT")
        return result
    }

    /**
     * Exports a COM+ application or application proxy to a file, ready for installation on different computers.
     * @param {BSTR} bstrApplIDOrName The GUID or application name of the application to be exported.
     * @param {BSTR} bstrApplicationFile The name of the file to export the application to, including the file path. If this parameter is <b>NULL</b> or an empty string, the <b>ExportApplication</b> method returns E_INVALIDARG.
     * If the path is not specified, the current directory is used.
     * If a relative path is entered, the path is relative to the current directory.
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
     * The application does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog-exportapplication
     */
    ExportApplication(bstrApplIDOrName, bstrApplicationFile, lOptions) {
        bstrApplIDOrName := bstrApplIDOrName is String ? BSTR.Alloc(bstrApplIDOrName).Value : bstrApplIDOrName
        bstrApplicationFile := bstrApplicationFile is String ? BSTR.Alloc(bstrApplicationFile).Value : bstrApplicationFile

        result := ComCall(15, this, "ptr", bstrApplIDOrName, "ptr", bstrApplicationFile, "int", lOptions, "HRESULT")
        return result
    }

    /**
     * Installs a COM+ application or application proxy from the specified file.
     * @param {BSTR} bstrApplicationFile The name of the file containing the application to be installed.
     * @param {BSTR} bstrDestinationDirectory Where to install the components. If this parameter is blank, the default directory is used.
     * @param {Integer} lOptions 
     * @param {BSTR} bstrUserId The user ID under which to run the application.
     * @param {BSTR} bstrPassword The password under which to run the application.
     * @param {BSTR} bstrRSN A remote server name to use for an application proxy.
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
     * <dt><b>ERROR_INSTALL_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A fatal error occurred during installation.
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
     * The application does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COMADMIN_E_OBJECTERRORS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred accessing one or more objects.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog-installapplication
     */
    InstallApplication(bstrApplicationFile, bstrDestinationDirectory, lOptions, bstrUserId, bstrPassword, bstrRSN) {
        bstrApplicationFile := bstrApplicationFile is String ? BSTR.Alloc(bstrApplicationFile).Value : bstrApplicationFile
        bstrDestinationDirectory := bstrDestinationDirectory is String ? BSTR.Alloc(bstrDestinationDirectory).Value : bstrDestinationDirectory
        bstrUserId := bstrUserId is String ? BSTR.Alloc(bstrUserId).Value : bstrUserId
        bstrPassword := bstrPassword is String ? BSTR.Alloc(bstrPassword).Value : bstrPassword
        bstrRSN := bstrRSN is String ? BSTR.Alloc(bstrRSN).Value : bstrRSN

        result := ComCall(16, this, "ptr", bstrApplicationFile, "ptr", bstrDestinationDirectory, "int", lOptions, "ptr", bstrUserId, "ptr", bstrPassword, "ptr", bstrRSN, "HRESULT")
        return result
    }

    /**
     * Stops the component load balancing service if the service is currently installed.
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
     * <dt><b>COMADMIN_E_SERVICENOTINSTALLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The component load balancing service is not currently installed on the computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COMADMIN_E_OBJECTERRORS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors occurred while accessing one or more objects.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog-stoprouter
     */
    StopRouter() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * This method is obsolete.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog-refreshrouter
     */
    RefreshRouter() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * Starts the component load balancing service if the service is currently installed.
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
     * <dt><b>COMADMIN_E_SERVICENOTINSTALLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The component load balancing service is not currently installed on the computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COMADMIN_E_OBJECTERRORS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors occurred while accessing one or more objects.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog-startrouter
     */
    StartRouter() {
        result := ComCall(19, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nn-comadmin-icomadmincatalog
     */
    Reserved1() {
        result := ComCall(20, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nn-comadmin-icomadmincatalog
     */
    Reserved2() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * Installs components from multiple files into a COM+ application.
     * @param {BSTR} bstrApplIDOrName The GUID or name of the application.
     * @param {Pointer<Pointer<SAFEARRAY>>} ppsaVarFileNames An array of the names of the DLL files that contains the components to be installed.
     * @param {Pointer<Pointer<SAFEARRAY>>} ppsaVarCLSIDs An array of CLSIDs for the components to be installed.
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
     * <dt><b>COMADMIN_E_OBJECTERRORS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors occurred while accessing one or more objects.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog-installmultiplecomponents
     */
    InstallMultipleComponents(bstrApplIDOrName, ppsaVarFileNames, ppsaVarCLSIDs) {
        bstrApplIDOrName := bstrApplIDOrName is String ? BSTR.Alloc(bstrApplIDOrName).Value : bstrApplIDOrName

        ppsaVarFileNamesMarshal := ppsaVarFileNames is VarRef ? "ptr*" : "ptr"
        ppsaVarCLSIDsMarshal := ppsaVarCLSIDs is VarRef ? "ptr*" : "ptr"

        result := ComCall(22, this, "ptr", bstrApplIDOrName, ppsaVarFileNamesMarshal, ppsaVarFileNames, ppsaVarCLSIDsMarshal, ppsaVarCLSIDs, "HRESULT")
        return result
    }

    /**
     * Retrieves information about the components found in the specified files.
     * @param {BSTR} bstrApplIdOrName The GUID or application name representing the application.
     * @param {Pointer<Pointer<SAFEARRAY>>} ppsaVarFileNames An array of names of files containing the components.
     * @param {Pointer<Pointer<SAFEARRAY>>} ppsaVarCLSIDs An array of component CLSIDs.
     * @param {Pointer<Pointer<SAFEARRAY>>} ppsaVarClassNames An array of component class names.
     * @param {Pointer<Pointer<SAFEARRAY>>} ppsaVarFileFlags An array for file flags containing information about the files.
     * @param {Pointer<Pointer<SAFEARRAY>>} ppsaVarComponentFlags An array for the component flags used to represent information about components in files.
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
     * <dt><b>COMADMIN_E_OBJECTERRORS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors occurred while accessing one or more objects.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog-getmultiplecomponentsinfo
     */
    GetMultipleComponentsInfo(bstrApplIdOrName, ppsaVarFileNames, ppsaVarCLSIDs, ppsaVarClassNames, ppsaVarFileFlags, ppsaVarComponentFlags) {
        bstrApplIdOrName := bstrApplIdOrName is String ? BSTR.Alloc(bstrApplIdOrName).Value : bstrApplIdOrName

        ppsaVarFileNamesMarshal := ppsaVarFileNames is VarRef ? "ptr*" : "ptr"
        ppsaVarCLSIDsMarshal := ppsaVarCLSIDs is VarRef ? "ptr*" : "ptr"
        ppsaVarClassNamesMarshal := ppsaVarClassNames is VarRef ? "ptr*" : "ptr"
        ppsaVarFileFlagsMarshal := ppsaVarFileFlags is VarRef ? "ptr*" : "ptr"
        ppsaVarComponentFlagsMarshal := ppsaVarComponentFlags is VarRef ? "ptr*" : "ptr"

        result := ComCall(23, this, "ptr", bstrApplIdOrName, ppsaVarFileNamesMarshal, ppsaVarFileNames, ppsaVarCLSIDsMarshal, ppsaVarCLSIDs, ppsaVarClassNamesMarshal, ppsaVarClassNames, ppsaVarFileFlagsMarshal, ppsaVarFileFlags, ppsaVarComponentFlagsMarshal, ppsaVarComponentFlags, "HRESULT")
        return result
    }

    /**
     * Updates component registration information from the registry.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog-refreshcomponents
     */
    RefreshComponents() {
        result := ComCall(24, this, "HRESULT")
        return result
    }

    /**
     * Backs up the COM+ class registration database to a specified file.
     * @param {BSTR} bstrBackupFilePath The path for the file in which the registration database is to be backed up.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog-backupregdb
     */
    BackupREGDB(bstrBackupFilePath) {
        bstrBackupFilePath := bstrBackupFilePath is String ? BSTR.Alloc(bstrBackupFilePath).Value : bstrBackupFilePath

        result := ComCall(25, this, "ptr", bstrBackupFilePath, "HRESULT")
        return result
    }

    /**
     * Restores the COM+ class registration database (RegDB) from the specified file. For this to take effect, a system reboot is required.
     * @param {BSTR} bstrBackupFilePath The name of the file to which the database was backed up.
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
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method is not implemented.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COMADMIN_E_OBJECTERRORS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors occurred while accessing one or more objects.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog-restoreregdb
     */
    RestoreREGDB(bstrBackupFilePath) {
        bstrBackupFilePath := bstrBackupFilePath is String ? BSTR.Alloc(bstrBackupFilePath).Value : bstrBackupFilePath

        result := ComCall(26, this, "ptr", bstrBackupFilePath, "HRESULT")
        return result
    }

    /**
     * Retrieves information about a COM+ application from an application file.
     * @param {BSTR} bstrApplicationFile The application file from which information is to be retrieved.
     * @param {Pointer<BSTR>} pbstrApplicationName The application name in the specified file.
     * @param {Pointer<BSTR>} pbstrApplicationDescription The application description.
     * @param {Pointer<VARIANT_BOOL>} pbHasUsers Indicates whether the application has user information associated with its roles.
     * @param {Pointer<VARIANT_BOOL>} pbIsProxy Indicates whether the file contains an application proxy.
     * @param {Pointer<Pointer<SAFEARRAY>>} ppsaVarFileNames An array of names of the DLL files for the components installed in the application.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog-queryapplicationfile
     */
    QueryApplicationFile(bstrApplicationFile, pbstrApplicationName, pbstrApplicationDescription, pbHasUsers, pbIsProxy, ppsaVarFileNames) {
        bstrApplicationFile := bstrApplicationFile is String ? BSTR.Alloc(bstrApplicationFile).Value : bstrApplicationFile

        pbHasUsersMarshal := pbHasUsers is VarRef ? "short*" : "ptr"
        pbIsProxyMarshal := pbIsProxy is VarRef ? "short*" : "ptr"
        ppsaVarFileNamesMarshal := ppsaVarFileNames is VarRef ? "ptr*" : "ptr"

        result := ComCall(27, this, "ptr", bstrApplicationFile, "ptr", pbstrApplicationName, "ptr", pbstrApplicationDescription, pbHasUsersMarshal, pbHasUsers, pbIsProxyMarshal, pbIsProxy, ppsaVarFileNamesMarshal, ppsaVarFileNames, "HRESULT")
        return result
    }

    /**
     * Starts the specified COM+ server application. The application components are launched in a dedicated server process.
     * @param {BSTR} bstrApplIdOrName The GUID or name of the application. If a GUID is used, it must be surrounded by braces.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog-startapplication
     */
    StartApplication(bstrApplIdOrName) {
        bstrApplIdOrName := bstrApplIdOrName is String ? BSTR.Alloc(bstrApplIdOrName).Value : bstrApplIdOrName

        result := ComCall(28, this, "ptr", bstrApplIdOrName, "HRESULT")
        return result
    }

    /**
     * Retrieves the current status of the specified COM+ service.
     * @param {Integer} lService The service for which status is to be checked. This parameter can be COMAdminServiceLoadBalanceRouter
     * (1) to check the component load balancing service.
     * @returns {Integer} The status for the specified service.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="COMAdminServiceStopped"></a><a id="comadminservicestopped"></a><a id="COMADMINSERVICESTOPPED"></a><dl>
     * <dt><b>COMAdminServiceStopped</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service is stopped.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="COMAdminServiceStartPending"></a><a id="comadminservicestartpending"></a><a id="COMADMINSERVICESTARTPENDING"></a><dl>
     * <dt><b>COMAdminServiceStartPending</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service is due to start.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="COMAdminServiceStopPending"></a><a id="comadminservicestoppending"></a><a id="COMADMINSERVICESTOPPENDING"></a><dl>
     * <dt><b>COMAdminServiceStopPending</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service is due to stop.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="COMAdminServiceRunning"></a><a id="comadminservicerunning"></a><a id="COMADMINSERVICERUNNING"></a><dl>
     * <dt><b>COMAdminServiceRunning</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service is running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="COMAdminServiceContinuePending"></a><a id="comadminservicecontinuepending"></a><a id="COMADMINSERVICECONTINUEPENDING"></a><dl>
     * <dt><b>COMAdminServiceContinuePending</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service is due to continue.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="COMAdminServicePausePending"></a><a id="comadminservicepausepending"></a><a id="COMADMINSERVICEPAUSEPENDING"></a><dl>
     * <dt><b>COMAdminServicePausePending</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service is due to pause.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="COMAdminServicePaused"></a><a id="comadminservicepaused"></a><a id="COMADMINSERVICEPAUSED"></a><dl>
     * <dt><b>COMAdminServicePaused</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service is paused.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="COMAdminServiceUnknownState"></a><a id="comadminserviceunknownstate"></a><a id="COMADMINSERVICEUNKNOWNSTATE"></a><dl>
     * <dt><b>COMAdminServiceUnknownState</b></dt>
     * <dt>7</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service status is unknown.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog-servicecheck
     */
    ServiceCheck(lService) {
        result := ComCall(29, this, "int", lService, "int*", &plStatus := 0, "HRESULT")
        return plStatus
    }

    /**
     * Installs event classes from multiple files into a COM+ application.
     * @param {BSTR} bstrApplIdOrName The GUID or name of the application.
     * @param {Pointer<Pointer<SAFEARRAY>>} ppsaVarFileNames An array of the names of the DLL files that contains the event classes to be installed.
     * @param {Pointer<Pointer<SAFEARRAY>>} ppsaVarCLSIDS An array of CLSIDs for the event classes to be installed.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog-installmultipleeventclasses
     */
    InstallMultipleEventClasses(bstrApplIdOrName, ppsaVarFileNames, ppsaVarCLSIDS) {
        bstrApplIdOrName := bstrApplIdOrName is String ? BSTR.Alloc(bstrApplIdOrName).Value : bstrApplIdOrName

        ppsaVarFileNamesMarshal := ppsaVarFileNames is VarRef ? "ptr*" : "ptr"
        ppsaVarCLSIDSMarshal := ppsaVarCLSIDS is VarRef ? "ptr*" : "ptr"

        result := ComCall(30, this, "ptr", bstrApplIdOrName, ppsaVarFileNamesMarshal, ppsaVarFileNames, ppsaVarCLSIDSMarshal, ppsaVarCLSIDS, "HRESULT")
        return result
    }

    /**
     * Installs event classes from a file into a COM+ application.
     * @param {BSTR} bstrApplIdOrName The GUID or name of the application.
     * @param {BSTR} bstrDLL The file name of the DLL containing the event classes to be installed.
     * @param {BSTR} bstrTLB The name of an external type library file. If the type library file is embedded in the DLL, pass in an empty string for this parameter.
     * @param {BSTR} bstrPSDLL The name of the proxy-stub DLL file. If there is no proxy-stub DLL associated with the event class, pass in an empty string for this parameter.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog-installeventclass
     */
    InstallEventClass(bstrApplIdOrName, bstrDLL, bstrTLB, bstrPSDLL) {
        bstrApplIdOrName := bstrApplIdOrName is String ? BSTR.Alloc(bstrApplIdOrName).Value : bstrApplIdOrName
        bstrDLL := bstrDLL is String ? BSTR.Alloc(bstrDLL).Value : bstrDLL
        bstrTLB := bstrTLB is String ? BSTR.Alloc(bstrTLB).Value : bstrTLB
        bstrPSDLL := bstrPSDLL is String ? BSTR.Alloc(bstrPSDLL).Value : bstrPSDLL

        result := ComCall(31, this, "ptr", bstrApplIdOrName, "ptr", bstrDLL, "ptr", bstrTLB, "ptr", bstrPSDLL, "HRESULT")
        return result
    }

    /**
     * Retrieves a list of the event classes registered on the computer that implement a specified interface.
     * @param {BSTR} bstrIID A GUID representing the interface for which event classes should be found. If this parameter is <b>NULL</b>, the method retrieves all event classes registered on the computer.
     * @param {Pointer<Pointer<SAFEARRAY>>} ppsaVarCLSIDs An array of CLSIDs for the event classes implementing the interface specified in <i>bstrIID</i>.
     * @param {Pointer<Pointer<SAFEARRAY>>} ppsaVarProgIDs An array of ProgIDs for the event classes implementing the interface specified in <i>bstrIID</i>.
     * @param {Pointer<Pointer<SAFEARRAY>>} ppsaVarDescriptions An array of descriptions for the event classes implementing the interface specified in <i>bstrIID</i>.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comadmin/nf-comadmin-icomadmincatalog-geteventclassesforiid
     */
    GetEventClassesForIID(bstrIID, ppsaVarCLSIDs, ppsaVarProgIDs, ppsaVarDescriptions) {
        bstrIID := bstrIID is String ? BSTR.Alloc(bstrIID).Value : bstrIID

        ppsaVarCLSIDsMarshal := ppsaVarCLSIDs is VarRef ? "ptr*" : "ptr"
        ppsaVarProgIDsMarshal := ppsaVarProgIDs is VarRef ? "ptr*" : "ptr"
        ppsaVarDescriptionsMarshal := ppsaVarDescriptions is VarRef ? "ptr*" : "ptr"

        result := ComCall(32, this, "ptr", bstrIID, ppsaVarCLSIDsMarshal, ppsaVarCLSIDs, ppsaVarProgIDsMarshal, ppsaVarProgIDs, ppsaVarDescriptionsMarshal, ppsaVarDescriptions, "HRESULT")
        return result
    }
}
