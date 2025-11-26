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
     * 
     * @param {BSTR} bstrCollName 
     * @returns {IDispatch} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog-getcollection
     */
    GetCollection(bstrCollName) {
        bstrCollName := bstrCollName is String ? BSTR.Alloc(bstrCollName).Value : bstrCollName

        result := ComCall(7, this, "ptr", bstrCollName, "ptr*", &ppCatalogCollection := 0, "HRESULT")
        return IDispatch(ppCatalogCollection)
    }

    /**
     * 
     * @param {BSTR} bstrCatalogServerName 
     * @returns {IDispatch} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog-connect
     */
    Connect(bstrCatalogServerName) {
        bstrCatalogServerName := bstrCatalogServerName is String ? BSTR.Alloc(bstrCatalogServerName).Value : bstrCatalogServerName

        result := ComCall(8, this, "ptr", bstrCatalogServerName, "ptr*", &ppCatalogCollection := 0, "HRESULT")
        return IDispatch(ppCatalogCollection)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog-get_majorversion
     */
    get_MajorVersion() {
        result := ComCall(9, this, "int*", &plMajorVersion := 0, "HRESULT")
        return plMajorVersion
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog-get_minorversion
     */
    get_MinorVersion() {
        result := ComCall(10, this, "int*", &plMinorVersion := 0, "HRESULT")
        return plMinorVersion
    }

    /**
     * 
     * @param {BSTR} bstrCollName 
     * @param {Pointer<Pointer<SAFEARRAY>>} ppsaVarQuery 
     * @returns {IDispatch} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog-getcollectionbyquery
     */
    GetCollectionByQuery(bstrCollName, ppsaVarQuery) {
        bstrCollName := bstrCollName is String ? BSTR.Alloc(bstrCollName).Value : bstrCollName

        ppsaVarQueryMarshal := ppsaVarQuery is VarRef ? "ptr*" : "ptr"

        result := ComCall(11, this, "ptr", bstrCollName, ppsaVarQueryMarshal, ppsaVarQuery, "ptr*", &ppCatalogCollection := 0, "HRESULT")
        return IDispatch(ppCatalogCollection)
    }

    /**
     * 
     * @param {BSTR} bstrApplIDOrName 
     * @param {BSTR} bstrCLSIDOrProgID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog-importcomponent
     */
    ImportComponent(bstrApplIDOrName, bstrCLSIDOrProgID) {
        bstrApplIDOrName := bstrApplIDOrName is String ? BSTR.Alloc(bstrApplIDOrName).Value : bstrApplIDOrName
        bstrCLSIDOrProgID := bstrCLSIDOrProgID is String ? BSTR.Alloc(bstrCLSIDOrProgID).Value : bstrCLSIDOrProgID

        result := ComCall(12, this, "ptr", bstrApplIDOrName, "ptr", bstrCLSIDOrProgID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrApplIDOrName 
     * @param {BSTR} bstrDLL 
     * @param {BSTR} bstrTLB 
     * @param {BSTR} bstrPSDLL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog-installcomponent
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
     * 
     * @param {BSTR} bstrApplIDOrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog-shutdownapplication
     */
    ShutdownApplication(bstrApplIDOrName) {
        bstrApplIDOrName := bstrApplIDOrName is String ? BSTR.Alloc(bstrApplIDOrName).Value : bstrApplIDOrName

        result := ComCall(14, this, "ptr", bstrApplIDOrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrApplIDOrName 
     * @param {BSTR} bstrApplicationFile 
     * @param {Integer} lOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog-exportapplication
     */
    ExportApplication(bstrApplIDOrName, bstrApplicationFile, lOptions) {
        bstrApplIDOrName := bstrApplIDOrName is String ? BSTR.Alloc(bstrApplIDOrName).Value : bstrApplIDOrName
        bstrApplicationFile := bstrApplicationFile is String ? BSTR.Alloc(bstrApplicationFile).Value : bstrApplicationFile

        result := ComCall(15, this, "ptr", bstrApplIDOrName, "ptr", bstrApplicationFile, "int", lOptions, "HRESULT")
        return result
    }

    /**
     * The InstallApplication function can install applications that have been deployed to target users that belong to a domain.
     * @param {BSTR} bstrApplicationFile 
     * @param {BSTR} bstrDestinationDirectory 
     * @param {Integer} lOptions 
     * @param {BSTR} bstrUserId 
     * @param {BSTR} bstrPassword 
     * @param {BSTR} bstrRSN 
     * @returns {HRESULT} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. Otherwise, the function returns one of the system error codes. For a complete list of error codes, see 
     * <a href="/windows/desktop/Debug/system-error-codes">System Error Codes</a> or the header file WinError.h.
     * @see https://docs.microsoft.com/windows/win32/api//appmgmt/nf-appmgmt-installapplication
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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog-stoprouter
     */
    StopRouter() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog-refreshrouter
     */
    RefreshRouter() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog-startrouter
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
     * 
     * @param {BSTR} bstrApplIDOrName 
     * @param {Pointer<Pointer<SAFEARRAY>>} ppsaVarFileNames 
     * @param {Pointer<Pointer<SAFEARRAY>>} ppsaVarCLSIDs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog-installmultiplecomponents
     */
    InstallMultipleComponents(bstrApplIDOrName, ppsaVarFileNames, ppsaVarCLSIDs) {
        bstrApplIDOrName := bstrApplIDOrName is String ? BSTR.Alloc(bstrApplIDOrName).Value : bstrApplIDOrName

        ppsaVarFileNamesMarshal := ppsaVarFileNames is VarRef ? "ptr*" : "ptr"
        ppsaVarCLSIDsMarshal := ppsaVarCLSIDs is VarRef ? "ptr*" : "ptr"

        result := ComCall(22, this, "ptr", bstrApplIDOrName, ppsaVarFileNamesMarshal, ppsaVarFileNames, ppsaVarCLSIDsMarshal, ppsaVarCLSIDs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrApplIdOrName 
     * @param {Pointer<Pointer<SAFEARRAY>>} ppsaVarFileNames 
     * @param {Pointer<Pointer<SAFEARRAY>>} ppsaVarCLSIDs 
     * @param {Pointer<Pointer<SAFEARRAY>>} ppsaVarClassNames 
     * @param {Pointer<Pointer<SAFEARRAY>>} ppsaVarFileFlags 
     * @param {Pointer<Pointer<SAFEARRAY>>} ppsaVarComponentFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog-getmultiplecomponentsinfo
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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog-refreshcomponents
     */
    RefreshComponents() {
        result := ComCall(24, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrBackupFilePath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog-backupregdb
     */
    BackupREGDB(bstrBackupFilePath) {
        bstrBackupFilePath := bstrBackupFilePath is String ? BSTR.Alloc(bstrBackupFilePath).Value : bstrBackupFilePath

        result := ComCall(25, this, "ptr", bstrBackupFilePath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrBackupFilePath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog-restoreregdb
     */
    RestoreREGDB(bstrBackupFilePath) {
        bstrBackupFilePath := bstrBackupFilePath is String ? BSTR.Alloc(bstrBackupFilePath).Value : bstrBackupFilePath

        result := ComCall(26, this, "ptr", bstrBackupFilePath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrApplicationFile 
     * @param {Pointer<BSTR>} pbstrApplicationName 
     * @param {Pointer<BSTR>} pbstrApplicationDescription 
     * @param {Pointer<VARIANT_BOOL>} pbHasUsers 
     * @param {Pointer<VARIANT_BOOL>} pbIsProxy 
     * @param {Pointer<Pointer<SAFEARRAY>>} ppsaVarFileNames 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog-queryapplicationfile
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
     * 
     * @param {BSTR} bstrApplIdOrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog-startapplication
     */
    StartApplication(bstrApplIdOrName) {
        bstrApplIdOrName := bstrApplIdOrName is String ? BSTR.Alloc(bstrApplIdOrName).Value : bstrApplIdOrName

        result := ComCall(28, this, "ptr", bstrApplIdOrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lService 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog-servicecheck
     */
    ServiceCheck(lService) {
        result := ComCall(29, this, "int", lService, "int*", &plStatus := 0, "HRESULT")
        return plStatus
    }

    /**
     * 
     * @param {BSTR} bstrApplIdOrName 
     * @param {Pointer<Pointer<SAFEARRAY>>} ppsaVarFileNames 
     * @param {Pointer<Pointer<SAFEARRAY>>} ppsaVarCLSIDS 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog-installmultipleeventclasses
     */
    InstallMultipleEventClasses(bstrApplIdOrName, ppsaVarFileNames, ppsaVarCLSIDS) {
        bstrApplIdOrName := bstrApplIdOrName is String ? BSTR.Alloc(bstrApplIdOrName).Value : bstrApplIdOrName

        ppsaVarFileNamesMarshal := ppsaVarFileNames is VarRef ? "ptr*" : "ptr"
        ppsaVarCLSIDSMarshal := ppsaVarCLSIDS is VarRef ? "ptr*" : "ptr"

        result := ComCall(30, this, "ptr", bstrApplIdOrName, ppsaVarFileNamesMarshal, ppsaVarFileNames, ppsaVarCLSIDSMarshal, ppsaVarCLSIDS, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrApplIdOrName 
     * @param {BSTR} bstrDLL 
     * @param {BSTR} bstrTLB 
     * @param {BSTR} bstrPSDLL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog-installeventclass
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
     * 
     * @param {BSTR} bstrIID 
     * @param {Pointer<Pointer<SAFEARRAY>>} ppsaVarCLSIDs 
     * @param {Pointer<Pointer<SAFEARRAY>>} ppsaVarProgIDs 
     * @param {Pointer<Pointer<SAFEARRAY>>} ppsaVarDescriptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog-geteventclassesforiid
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
