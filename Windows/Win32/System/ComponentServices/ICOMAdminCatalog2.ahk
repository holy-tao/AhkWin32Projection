#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {BSTR} bstrCollectionName 
     * @param {Pointer<VARIANT>} pVarQueryStrings 
     * @param {Pointer<IDispatch>} ppCatalogCollection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-getcollectionbyquery2
     */
    GetCollectionByQuery2(bstrCollectionName, pVarQueryStrings, ppCatalogCollection) {
        bstrCollectionName := bstrCollectionName is String ? BSTR.Alloc(bstrCollectionName).Value : bstrCollectionName

        result := ComCall(33, this, "ptr", bstrCollectionName, "ptr", pVarQueryStrings, "ptr*", ppCatalogCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lProcessID 
     * @param {Pointer<BSTR>} pbstrApplicationInstanceID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-getapplicationinstanceidfromprocessid
     */
    GetApplicationInstanceIDFromProcessID(lProcessID, pbstrApplicationInstanceID) {
        result := ComCall(34, this, "int", lProcessID, "ptr", pbstrApplicationInstanceID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVarApplicationInstanceID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-shutdownapplicationinstances
     */
    ShutdownApplicationInstances(pVarApplicationInstanceID) {
        result := ComCall(35, this, "ptr", pVarApplicationInstanceID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVarApplicationInstanceID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-pauseapplicationinstances
     */
    PauseApplicationInstances(pVarApplicationInstanceID) {
        result := ComCall(36, this, "ptr", pVarApplicationInstanceID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVarApplicationInstanceID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-resumeapplicationinstances
     */
    ResumeApplicationInstances(pVarApplicationInstanceID) {
        result := ComCall(37, this, "ptr", pVarApplicationInstanceID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVarApplicationInstanceID 
     * @param {Integer} lReasonCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-recycleapplicationinstances
     */
    RecycleApplicationInstances(pVarApplicationInstanceID, lReasonCode) {
        result := ComCall(38, this, "ptr", pVarApplicationInstanceID, "int", lReasonCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVarApplicationInstanceID 
     * @param {Pointer<VARIANT_BOOL>} pVarBoolPaused 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-areapplicationinstancespaused
     */
    AreApplicationInstancesPaused(pVarApplicationInstanceID, pVarBoolPaused) {
        result := ComCall(39, this, "ptr", pVarApplicationInstanceID, "ptr", pVarBoolPaused, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrApplicationInstanceID 
     * @param {BSTR} bstrDirectory 
     * @param {Integer} lMaxImages 
     * @param {Pointer<BSTR>} pbstrDumpFile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-dumpapplicationinstance
     */
    DumpApplicationInstance(bstrApplicationInstanceID, bstrDirectory, lMaxImages, pbstrDumpFile) {
        bstrApplicationInstanceID := bstrApplicationInstanceID is String ? BSTR.Alloc(bstrApplicationInstanceID).Value : bstrApplicationInstanceID
        bstrDirectory := bstrDirectory is String ? BSTR.Alloc(bstrDirectory).Value : bstrDirectory

        result := ComCall(40, this, "ptr", bstrApplicationInstanceID, "ptr", bstrDirectory, "int", lMaxImages, "ptr", pbstrDumpFile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pVarBoolDumpSupported 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-get_isapplicationinstancedumpsupported
     */
    get_IsApplicationInstanceDumpSupported(pVarBoolDumpSupported) {
        result := ComCall(41, this, "ptr", pVarBoolDumpSupported, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrApplicationIDOrName 
     * @param {BSTR} bstrServiceName 
     * @param {BSTR} bstrStartType 
     * @param {BSTR} bstrErrorControl 
     * @param {BSTR} bstrDependencies 
     * @param {BSTR} bstrRunAs 
     * @param {BSTR} bstrPassword 
     * @param {VARIANT_BOOL} bDesktopOk 
     * @returns {HRESULT} 
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

        result := ComCall(42, this, "ptr", bstrApplicationIDOrName, "ptr", bstrServiceName, "ptr", bstrStartType, "ptr", bstrErrorControl, "ptr", bstrDependencies, "ptr", bstrRunAs, "ptr", bstrPassword, "short", bDesktopOk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrApplicationIDOrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-deleteserviceforapplication
     */
    DeleteServiceForApplication(bstrApplicationIDOrName) {
        bstrApplicationIDOrName := bstrApplicationIDOrName is String ? BSTR.Alloc(bstrApplicationIDOrName).Value : bstrApplicationIDOrName

        result := ComCall(43, this, "ptr", bstrApplicationIDOrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrApplicationIDOrName 
     * @param {Pointer<BSTR>} pbstrPartitionID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-getpartitionid
     */
    GetPartitionID(bstrApplicationIDOrName, pbstrPartitionID) {
        bstrApplicationIDOrName := bstrApplicationIDOrName is String ? BSTR.Alloc(bstrApplicationIDOrName).Value : bstrApplicationIDOrName

        result := ComCall(44, this, "ptr", bstrApplicationIDOrName, "ptr", pbstrPartitionID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrApplicationIDOrName 
     * @param {Pointer<BSTR>} pbstrPartitionName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-getpartitionname
     */
    GetPartitionName(bstrApplicationIDOrName, pbstrPartitionName) {
        bstrApplicationIDOrName := bstrApplicationIDOrName is String ? BSTR.Alloc(bstrApplicationIDOrName).Value : bstrApplicationIDOrName

        result := ComCall(45, this, "ptr", bstrApplicationIDOrName, "ptr", pbstrPartitionName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPartitionIDOrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-put_currentpartition
     */
    put_CurrentPartition(bstrPartitionIDOrName) {
        bstrPartitionIDOrName := bstrPartitionIDOrName is String ? BSTR.Alloc(bstrPartitionIDOrName).Value : bstrPartitionIDOrName

        result := ComCall(46, this, "ptr", bstrPartitionIDOrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrPartitionID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-get_currentpartitionid
     */
    get_CurrentPartitionID(pbstrPartitionID) {
        result := ComCall(47, this, "ptr", pbstrPartitionID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrPartitionName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-get_currentpartitionname
     */
    get_CurrentPartitionName(pbstrPartitionName) {
        result := ComCall(48, this, "ptr", pbstrPartitionName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrGlobalPartitionID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-get_globalpartitionid
     */
    get_GlobalPartitionID(pbstrGlobalPartitionID) {
        result := ComCall(49, this, "ptr", pbstrGlobalPartitionID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-flushpartitioncache
     */
    FlushPartitionCache() {
        result := ComCall(50, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrSourcePartitionIDOrName 
     * @param {Pointer<VARIANT>} pVarApplicationID 
     * @param {BSTR} bstrDestinationPartitionIDOrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-copyapplications
     */
    CopyApplications(bstrSourcePartitionIDOrName, pVarApplicationID, bstrDestinationPartitionIDOrName) {
        bstrSourcePartitionIDOrName := bstrSourcePartitionIDOrName is String ? BSTR.Alloc(bstrSourcePartitionIDOrName).Value : bstrSourcePartitionIDOrName
        bstrDestinationPartitionIDOrName := bstrDestinationPartitionIDOrName is String ? BSTR.Alloc(bstrDestinationPartitionIDOrName).Value : bstrDestinationPartitionIDOrName

        result := ComCall(51, this, "ptr", bstrSourcePartitionIDOrName, "ptr", pVarApplicationID, "ptr", bstrDestinationPartitionIDOrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrSourceApplicationIDOrName 
     * @param {Pointer<VARIANT>} pVarCLSIDOrProgID 
     * @param {BSTR} bstrDestinationApplicationIDOrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-copycomponents
     */
    CopyComponents(bstrSourceApplicationIDOrName, pVarCLSIDOrProgID, bstrDestinationApplicationIDOrName) {
        bstrSourceApplicationIDOrName := bstrSourceApplicationIDOrName is String ? BSTR.Alloc(bstrSourceApplicationIDOrName).Value : bstrSourceApplicationIDOrName
        bstrDestinationApplicationIDOrName := bstrDestinationApplicationIDOrName is String ? BSTR.Alloc(bstrDestinationApplicationIDOrName).Value : bstrDestinationApplicationIDOrName

        result := ComCall(52, this, "ptr", bstrSourceApplicationIDOrName, "ptr", pVarCLSIDOrProgID, "ptr", bstrDestinationApplicationIDOrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrSourceApplicationIDOrName 
     * @param {Pointer<VARIANT>} pVarCLSIDOrProgID 
     * @param {BSTR} bstrDestinationApplicationIDOrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-movecomponents
     */
    MoveComponents(bstrSourceApplicationIDOrName, pVarCLSIDOrProgID, bstrDestinationApplicationIDOrName) {
        bstrSourceApplicationIDOrName := bstrSourceApplicationIDOrName is String ? BSTR.Alloc(bstrSourceApplicationIDOrName).Value : bstrSourceApplicationIDOrName
        bstrDestinationApplicationIDOrName := bstrDestinationApplicationIDOrName is String ? BSTR.Alloc(bstrDestinationApplicationIDOrName).Value : bstrDestinationApplicationIDOrName

        result := ComCall(53, this, "ptr", bstrSourceApplicationIDOrName, "ptr", pVarCLSIDOrProgID, "ptr", bstrDestinationApplicationIDOrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrSrcApplicationIDOrName 
     * @param {BSTR} bstrCLSIDOrProgID 
     * @param {BSTR} bstrDestApplicationIDOrName 
     * @param {BSTR} bstrNewProgId 
     * @param {BSTR} bstrNewClsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-aliascomponent
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
     * 
     * @param {BSTR} bstrDllName 
     * @param {Pointer<Integer>} pCOMAdminInUse 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-issafetodelete
     */
    IsSafeToDelete(bstrDllName, pCOMAdminInUse) {
        bstrDllName := bstrDllName is String ? BSTR.Alloc(bstrDllName).Value : bstrDllName

        result := ComCall(55, this, "ptr", bstrDllName, "int*", pCOMAdminInUse, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrApplicationIDOrName 
     * @param {Pointer<VARIANT>} pVarCLSIDOrProgID 
     * @param {Pointer<VARIANT>} pVarComponentType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-importunconfiguredcomponents
     */
    ImportUnconfiguredComponents(bstrApplicationIDOrName, pVarCLSIDOrProgID, pVarComponentType) {
        bstrApplicationIDOrName := bstrApplicationIDOrName is String ? BSTR.Alloc(bstrApplicationIDOrName).Value : bstrApplicationIDOrName

        result := ComCall(56, this, "ptr", bstrApplicationIDOrName, "ptr", pVarCLSIDOrProgID, "ptr", pVarComponentType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrApplicationIDOrName 
     * @param {Pointer<VARIANT>} pVarCLSIDOrProgID 
     * @param {Pointer<VARIANT>} pVarComponentType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-promoteunconfiguredcomponents
     */
    PromoteUnconfiguredComponents(bstrApplicationIDOrName, pVarCLSIDOrProgID, pVarComponentType) {
        bstrApplicationIDOrName := bstrApplicationIDOrName is String ? BSTR.Alloc(bstrApplicationIDOrName).Value : bstrApplicationIDOrName

        result := ComCall(57, this, "ptr", bstrApplicationIDOrName, "ptr", pVarCLSIDOrProgID, "ptr", pVarComponentType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrApplicationIDOrName 
     * @param {Pointer<VARIANT>} pVarCLSIDOrProgID 
     * @param {Pointer<VARIANT>} pVarComponentType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-importcomponents
     */
    ImportComponents(bstrApplicationIDOrName, pVarCLSIDOrProgID, pVarComponentType) {
        bstrApplicationIDOrName := bstrApplicationIDOrName is String ? BSTR.Alloc(bstrApplicationIDOrName).Value : bstrApplicationIDOrName

        result := ComCall(58, this, "ptr", bstrApplicationIDOrName, "ptr", pVarCLSIDOrProgID, "ptr", pVarComponentType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbIs64Bit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-get_is64bitcatalogserver
     */
    get_Is64BitCatalogServer(pbIs64Bit) {
        result := ComCall(59, this, "ptr", pbIs64Bit, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPartitionIDOrName 
     * @param {BSTR} bstrPartitionFileName 
     * @param {Integer} lOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-exportpartition
     */
    ExportPartition(bstrPartitionIDOrName, bstrPartitionFileName, lOptions) {
        bstrPartitionIDOrName := bstrPartitionIDOrName is String ? BSTR.Alloc(bstrPartitionIDOrName).Value : bstrPartitionIDOrName
        bstrPartitionFileName := bstrPartitionFileName is String ? BSTR.Alloc(bstrPartitionFileName).Value : bstrPartitionFileName

        result := ComCall(60, this, "ptr", bstrPartitionIDOrName, "ptr", bstrPartitionFileName, "int", lOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrFileName 
     * @param {BSTR} bstrDestDirectory 
     * @param {Integer} lOptions 
     * @param {BSTR} bstrUserID 
     * @param {BSTR} bstrPassword 
     * @param {BSTR} bstrRSN 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-installpartition
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
     * 
     * @param {BSTR} bstrApplicationFile 
     * @param {Pointer<IDispatch>} ppFilesForImport 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-queryapplicationfile2
     */
    QueryApplicationFile2(bstrApplicationFile, ppFilesForImport) {
        bstrApplicationFile := bstrApplicationFile is String ? BSTR.Alloc(bstrApplicationFile).Value : bstrApplicationFile

        result := ComCall(62, this, "ptr", bstrApplicationFile, "ptr*", ppFilesForImport, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrCLSIDOrProgID 
     * @param {Pointer<Integer>} plVersionCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comadmin/nf-comadmin-icomadmincatalog2-getcomponentversioncount
     */
    GetComponentVersionCount(bstrCLSIDOrProgID, plVersionCount) {
        bstrCLSIDOrProgID := bstrCLSIDOrProgID is String ? BSTR.Alloc(bstrCLSIDOrProgID).Value : bstrCLSIDOrProgID

        result := ComCall(63, this, "ptr", bstrCLSIDOrProgID, "int*", plVersionCount, "HRESULT")
        return result
    }
}
