#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IPMEnumerationManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPMEnumerationManager
     * @type {Guid}
     */
    static IID => Guid("{698d57c2-292d-4cf3-b73c-d95a6922ed9a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AllApplications", "get_AllTiles", "get_AllTasks", "get_AllExtensions", "get_AllBackgroundServiceAgents", "get_AllBackgroundWorkers", "get_ApplicationInfo", "get_TileInfo", "get_TaskInfo", "get_TaskInfoEx", "get_BackgroundServiceAgentInfo", "get_AllLiveTileJobs", "get_LiveTileJob", "get_ApplicationInfoExternal", "get_FileHandlerGenericLogo", "get_ApplicationInfoFromAccessClaims", "get_StartTileEnumeratorBlob", "get_StartAppEnumeratorBlob"]

    /**
     * 
     * @param {Pointer<IPMApplicationInfoEnumerator>} ppAppEnum 
     * @param {PM_ENUM_FILTER} Filter 
     * @returns {HRESULT} 
     */
    get_AllApplications(ppAppEnum, Filter) {
        result := ComCall(3, this, "ptr*", ppAppEnum, "ptr", Filter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IPMTileInfoEnumerator>} ppTileEnum 
     * @param {PM_ENUM_FILTER} Filter 
     * @returns {HRESULT} 
     */
    get_AllTiles(ppTileEnum, Filter) {
        result := ComCall(4, this, "ptr*", ppTileEnum, "ptr", Filter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IPMTaskInfoEnumerator>} ppTaskEnum 
     * @param {PM_ENUM_FILTER} Filter 
     * @returns {HRESULT} 
     */
    get_AllTasks(ppTaskEnum, Filter) {
        result := ComCall(5, this, "ptr*", ppTaskEnum, "ptr", Filter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IPMExtensionInfoEnumerator>} ppExtensionEnum 
     * @param {PM_ENUM_FILTER} Filter 
     * @returns {HRESULT} 
     */
    get_AllExtensions(ppExtensionEnum, Filter) {
        result := ComCall(6, this, "ptr*", ppExtensionEnum, "ptr", Filter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IPMBackgroundServiceAgentInfoEnumerator>} ppBSAEnum 
     * @param {PM_ENUM_FILTER} Filter 
     * @returns {HRESULT} 
     */
    get_AllBackgroundServiceAgents(ppBSAEnum, Filter) {
        result := ComCall(7, this, "ptr*", ppBSAEnum, "ptr", Filter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IPMBackgroundWorkerInfoEnumerator>} ppBSWEnum 
     * @param {PM_ENUM_FILTER} Filter 
     * @returns {HRESULT} 
     */
    get_AllBackgroundWorkers(ppBSWEnum, Filter) {
        result := ComCall(8, this, "ptr*", ppBSWEnum, "ptr", Filter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} ProductID 
     * @param {Pointer<IPMApplicationInfo>} ppAppInfo 
     * @returns {HRESULT} 
     */
    get_ApplicationInfo(ProductID, ppAppInfo) {
        result := ComCall(9, this, "ptr", ProductID, "ptr*", ppAppInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} ProductID 
     * @param {BSTR} TileID 
     * @param {Pointer<IPMTileInfo>} ppTileInfo 
     * @returns {HRESULT} 
     */
    get_TileInfo(ProductID, TileID, ppTileInfo) {
        TileID := TileID is String ? BSTR.Alloc(TileID).Value : TileID

        result := ComCall(10, this, "ptr", ProductID, "ptr", TileID, "ptr*", ppTileInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} ProductID 
     * @param {BSTR} TaskID 
     * @param {Pointer<IPMTaskInfo>} ppTaskInfo 
     * @returns {HRESULT} 
     */
    get_TaskInfo(ProductID, TaskID, ppTaskInfo) {
        TaskID := TaskID is String ? BSTR.Alloc(TaskID).Value : TaskID

        result := ComCall(11, this, "ptr", ProductID, "ptr", TaskID, "ptr*", ppTaskInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} ProductID 
     * @param {PWSTR} TaskID 
     * @param {Pointer<IPMTaskInfo>} ppTaskInfo 
     * @returns {HRESULT} 
     */
    get_TaskInfoEx(ProductID, TaskID, ppTaskInfo) {
        TaskID := TaskID is String ? StrPtr(TaskID) : TaskID

        result := ComCall(12, this, "ptr", ProductID, "ptr", TaskID, "ptr*", ppTaskInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} BSAID 
     * @param {Pointer<IPMBackgroundServiceAgentInfo>} ppTaskInfo 
     * @returns {HRESULT} 
     */
    get_BackgroundServiceAgentInfo(BSAID, ppTaskInfo) {
        result := ComCall(13, this, "uint", BSAID, "ptr*", ppTaskInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IPMLiveTileJobInfoEnumerator>} ppLiveTileJobEnum 
     * @returns {HRESULT} 
     */
    get_AllLiveTileJobs(ppLiveTileJobEnum) {
        result := ComCall(14, this, "ptr*", ppLiveTileJobEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} ProductID 
     * @param {BSTR} TileID 
     * @param {Integer} RecurrenceType 
     * @param {Pointer<IPMLiveTileJobInfo>} ppLiveTileJobInfo 
     * @returns {HRESULT} 
     */
    get_LiveTileJob(ProductID, TileID, RecurrenceType, ppLiveTileJobInfo) {
        TileID := TileID is String ? BSTR.Alloc(TileID).Value : TileID

        result := ComCall(15, this, "ptr", ProductID, "ptr", TileID, "int", RecurrenceType, "ptr*", ppLiveTileJobInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} ProductID 
     * @param {Pointer<IPMApplicationInfo>} ppAppInfo 
     * @returns {HRESULT} 
     */
    get_ApplicationInfoExternal(ProductID, ppAppInfo) {
        result := ComCall(16, this, "ptr", ProductID, "ptr*", ppAppInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} FileType 
     * @param {Integer} LogoSize 
     * @param {Pointer<BSTR>} pLogo 
     * @returns {HRESULT} 
     */
    get_FileHandlerGenericLogo(FileType, LogoSize, pLogo) {
        FileType := FileType is String ? BSTR.Alloc(FileType).Value : FileType

        result := ComCall(17, this, "ptr", FileType, "int", LogoSize, "ptr", pLogo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} SysAppID0 
     * @param {BSTR} SysAppID1 
     * @param {Pointer<IPMApplicationInfo>} ppAppInfo 
     * @returns {HRESULT} 
     */
    get_ApplicationInfoFromAccessClaims(SysAppID0, SysAppID1, ppAppInfo) {
        SysAppID0 := SysAppID0 is String ? BSTR.Alloc(SysAppID0).Value : SysAppID0
        SysAppID1 := SysAppID1 is String ? BSTR.Alloc(SysAppID1).Value : SysAppID1

        result := ComCall(18, this, "ptr", SysAppID0, "ptr", SysAppID1, "ptr*", ppAppInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PM_ENUM_FILTER} Filter 
     * @param {Pointer<Integer>} pcTiles 
     * @param {Pointer<Pointer<PM_STARTTILEBLOB>>} ppTileBlobs 
     * @returns {HRESULT} 
     */
    get_StartTileEnumeratorBlob(Filter, pcTiles, ppTileBlobs) {
        pcTilesMarshal := pcTiles is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, "ptr", Filter, pcTilesMarshal, pcTiles, "ptr*", ppTileBlobs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PM_ENUM_FILTER} Filter 
     * @param {Pointer<Integer>} pcApps 
     * @param {Pointer<Pointer<PM_STARTAPPBLOB>>} ppAppBlobs 
     * @returns {HRESULT} 
     */
    get_StartAppEnumeratorBlob(Filter, pcApps, ppAppBlobs) {
        pcAppsMarshal := pcApps is VarRef ? "uint*" : "ptr"

        result := ComCall(20, this, "ptr", Filter, pcAppsMarshal, pcApps, "ptr*", ppAppBlobs, "HRESULT")
        return result
    }
}
