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
     * 
     * @param {BSTR} bstrCollName 
     * @param {Pointer<IDispatch>} ppCatalogCollection 
     * @returns {HRESULT} 
     */
    GetCollection(bstrCollName, ppCatalogCollection) {
        bstrCollName := bstrCollName is String ? BSTR.Alloc(bstrCollName).Value : bstrCollName

        result := ComCall(7, this, "ptr", bstrCollName, "ptr", ppCatalogCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrCatalogServerName 
     * @param {Pointer<IDispatch>} ppCatalogCollection 
     * @returns {HRESULT} 
     */
    Connect(bstrCatalogServerName, ppCatalogCollection) {
        bstrCatalogServerName := bstrCatalogServerName is String ? BSTR.Alloc(bstrCatalogServerName).Value : bstrCatalogServerName

        result := ComCall(8, this, "ptr", bstrCatalogServerName, "ptr", ppCatalogCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plMajorVersion 
     * @returns {HRESULT} 
     */
    get_MajorVersion(plMajorVersion) {
        result := ComCall(9, this, "int*", plMajorVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plMinorVersion 
     * @returns {HRESULT} 
     */
    get_MinorVersion(plMinorVersion) {
        result := ComCall(10, this, "int*", plMinorVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrCollName 
     * @param {Pointer<SAFEARRAY>} ppsaVarQuery 
     * @param {Pointer<IDispatch>} ppCatalogCollection 
     * @returns {HRESULT} 
     */
    GetCollectionByQuery(bstrCollName, ppsaVarQuery, ppCatalogCollection) {
        bstrCollName := bstrCollName is String ? BSTR.Alloc(bstrCollName).Value : bstrCollName

        result := ComCall(11, this, "ptr", bstrCollName, "ptr", ppsaVarQuery, "ptr", ppCatalogCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrApplIDOrName 
     * @param {BSTR} bstrCLSIDOrProgID 
     * @returns {HRESULT} 
     */
    ImportComponent(bstrApplIDOrName, bstrCLSIDOrProgID) {
        bstrApplIDOrName := bstrApplIDOrName is String ? BSTR.Alloc(bstrApplIDOrName).Value : bstrApplIDOrName
        bstrCLSIDOrProgID := bstrCLSIDOrProgID is String ? BSTR.Alloc(bstrCLSIDOrProgID).Value : bstrCLSIDOrProgID

        result := ComCall(12, this, "ptr", bstrApplIDOrName, "ptr", bstrCLSIDOrProgID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrApplIDOrName 
     * @param {BSTR} bstrDLL 
     * @param {BSTR} bstrTLB 
     * @param {BSTR} bstrPSDLL 
     * @returns {HRESULT} 
     */
    InstallComponent(bstrApplIDOrName, bstrDLL, bstrTLB, bstrPSDLL) {
        bstrApplIDOrName := bstrApplIDOrName is String ? BSTR.Alloc(bstrApplIDOrName).Value : bstrApplIDOrName
        bstrDLL := bstrDLL is String ? BSTR.Alloc(bstrDLL).Value : bstrDLL
        bstrTLB := bstrTLB is String ? BSTR.Alloc(bstrTLB).Value : bstrTLB
        bstrPSDLL := bstrPSDLL is String ? BSTR.Alloc(bstrPSDLL).Value : bstrPSDLL

        result := ComCall(13, this, "ptr", bstrApplIDOrName, "ptr", bstrDLL, "ptr", bstrTLB, "ptr", bstrPSDLL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrApplIDOrName 
     * @returns {HRESULT} 
     */
    ShutdownApplication(bstrApplIDOrName) {
        bstrApplIDOrName := bstrApplIDOrName is String ? BSTR.Alloc(bstrApplIDOrName).Value : bstrApplIDOrName

        result := ComCall(14, this, "ptr", bstrApplIDOrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrApplIDOrName 
     * @param {BSTR} bstrApplicationFile 
     * @param {Integer} lOptions 
     * @returns {HRESULT} 
     */
    ExportApplication(bstrApplIDOrName, bstrApplicationFile, lOptions) {
        bstrApplIDOrName := bstrApplIDOrName is String ? BSTR.Alloc(bstrApplIDOrName).Value : bstrApplIDOrName
        bstrApplicationFile := bstrApplicationFile is String ? BSTR.Alloc(bstrApplicationFile).Value : bstrApplicationFile

        result := ComCall(15, this, "ptr", bstrApplIDOrName, "ptr", bstrApplicationFile, "int", lOptions, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(16, this, "ptr", bstrApplicationFile, "ptr", bstrDestinationDirectory, "int", lOptions, "ptr", bstrUserId, "ptr", bstrPassword, "ptr", bstrRSN, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopRouter() {
        result := ComCall(17, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RefreshRouter() {
        result := ComCall(18, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StartRouter() {
        result := ComCall(19, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reserved1() {
        result := ComCall(20, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reserved2() {
        result := ComCall(21, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrApplIDOrName 
     * @param {Pointer<SAFEARRAY>} ppsaVarFileNames 
     * @param {Pointer<SAFEARRAY>} ppsaVarCLSIDs 
     * @returns {HRESULT} 
     */
    InstallMultipleComponents(bstrApplIDOrName, ppsaVarFileNames, ppsaVarCLSIDs) {
        bstrApplIDOrName := bstrApplIDOrName is String ? BSTR.Alloc(bstrApplIDOrName).Value : bstrApplIDOrName

        result := ComCall(22, this, "ptr", bstrApplIDOrName, "ptr", ppsaVarFileNames, "ptr", ppsaVarCLSIDs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrApplIdOrName 
     * @param {Pointer<SAFEARRAY>} ppsaVarFileNames 
     * @param {Pointer<SAFEARRAY>} ppsaVarCLSIDs 
     * @param {Pointer<SAFEARRAY>} ppsaVarClassNames 
     * @param {Pointer<SAFEARRAY>} ppsaVarFileFlags 
     * @param {Pointer<SAFEARRAY>} ppsaVarComponentFlags 
     * @returns {HRESULT} 
     */
    GetMultipleComponentsInfo(bstrApplIdOrName, ppsaVarFileNames, ppsaVarCLSIDs, ppsaVarClassNames, ppsaVarFileFlags, ppsaVarComponentFlags) {
        bstrApplIdOrName := bstrApplIdOrName is String ? BSTR.Alloc(bstrApplIdOrName).Value : bstrApplIdOrName

        result := ComCall(23, this, "ptr", bstrApplIdOrName, "ptr", ppsaVarFileNames, "ptr", ppsaVarCLSIDs, "ptr", ppsaVarClassNames, "ptr", ppsaVarFileFlags, "ptr", ppsaVarComponentFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RefreshComponents() {
        result := ComCall(24, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrBackupFilePath 
     * @returns {HRESULT} 
     */
    BackupREGDB(bstrBackupFilePath) {
        bstrBackupFilePath := bstrBackupFilePath is String ? BSTR.Alloc(bstrBackupFilePath).Value : bstrBackupFilePath

        result := ComCall(25, this, "ptr", bstrBackupFilePath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrBackupFilePath 
     * @returns {HRESULT} 
     */
    RestoreREGDB(bstrBackupFilePath) {
        bstrBackupFilePath := bstrBackupFilePath is String ? BSTR.Alloc(bstrBackupFilePath).Value : bstrBackupFilePath

        result := ComCall(26, this, "ptr", bstrBackupFilePath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrApplicationFile 
     * @param {Pointer<BSTR>} pbstrApplicationName 
     * @param {Pointer<BSTR>} pbstrApplicationDescription 
     * @param {Pointer<VARIANT_BOOL>} pbHasUsers 
     * @param {Pointer<VARIANT_BOOL>} pbIsProxy 
     * @param {Pointer<SAFEARRAY>} ppsaVarFileNames 
     * @returns {HRESULT} 
     */
    QueryApplicationFile(bstrApplicationFile, pbstrApplicationName, pbstrApplicationDescription, pbHasUsers, pbIsProxy, ppsaVarFileNames) {
        bstrApplicationFile := bstrApplicationFile is String ? BSTR.Alloc(bstrApplicationFile).Value : bstrApplicationFile

        result := ComCall(27, this, "ptr", bstrApplicationFile, "ptr", pbstrApplicationName, "ptr", pbstrApplicationDescription, "ptr", pbHasUsers, "ptr", pbIsProxy, "ptr", ppsaVarFileNames, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrApplIdOrName 
     * @returns {HRESULT} 
     */
    StartApplication(bstrApplIdOrName) {
        bstrApplIdOrName := bstrApplIdOrName is String ? BSTR.Alloc(bstrApplIdOrName).Value : bstrApplIdOrName

        result := ComCall(28, this, "ptr", bstrApplIdOrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lService 
     * @param {Pointer<Int32>} plStatus 
     * @returns {HRESULT} 
     */
    ServiceCheck(lService, plStatus) {
        result := ComCall(29, this, "int", lService, "int*", plStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrApplIdOrName 
     * @param {Pointer<SAFEARRAY>} ppsaVarFileNames 
     * @param {Pointer<SAFEARRAY>} ppsaVarCLSIDS 
     * @returns {HRESULT} 
     */
    InstallMultipleEventClasses(bstrApplIdOrName, ppsaVarFileNames, ppsaVarCLSIDS) {
        bstrApplIdOrName := bstrApplIdOrName is String ? BSTR.Alloc(bstrApplIdOrName).Value : bstrApplIdOrName

        result := ComCall(30, this, "ptr", bstrApplIdOrName, "ptr", ppsaVarFileNames, "ptr", ppsaVarCLSIDS, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrApplIdOrName 
     * @param {BSTR} bstrDLL 
     * @param {BSTR} bstrTLB 
     * @param {BSTR} bstrPSDLL 
     * @returns {HRESULT} 
     */
    InstallEventClass(bstrApplIdOrName, bstrDLL, bstrTLB, bstrPSDLL) {
        bstrApplIdOrName := bstrApplIdOrName is String ? BSTR.Alloc(bstrApplIdOrName).Value : bstrApplIdOrName
        bstrDLL := bstrDLL is String ? BSTR.Alloc(bstrDLL).Value : bstrDLL
        bstrTLB := bstrTLB is String ? BSTR.Alloc(bstrTLB).Value : bstrTLB
        bstrPSDLL := bstrPSDLL is String ? BSTR.Alloc(bstrPSDLL).Value : bstrPSDLL

        result := ComCall(31, this, "ptr", bstrApplIdOrName, "ptr", bstrDLL, "ptr", bstrTLB, "ptr", bstrPSDLL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrIID 
     * @param {Pointer<SAFEARRAY>} ppsaVarCLSIDs 
     * @param {Pointer<SAFEARRAY>} ppsaVarProgIDs 
     * @param {Pointer<SAFEARRAY>} ppsaVarDescriptions 
     * @returns {HRESULT} 
     */
    GetEventClassesForIID(bstrIID, ppsaVarCLSIDs, ppsaVarProgIDs, ppsaVarDescriptions) {
        bstrIID := bstrIID is String ? BSTR.Alloc(bstrIID).Value : bstrIID

        result := ComCall(32, this, "ptr", bstrIID, "ptr", ppsaVarCLSIDs, "ptr", ppsaVarProgIDs, "ptr", ppsaVarDescriptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
