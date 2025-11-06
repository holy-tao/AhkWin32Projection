#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IPMApplicationInfoEnumerator.ahk
#Include .\IPMTileInfoEnumerator.ahk
#Include .\IPMTaskInfoEnumerator.ahk
#Include .\IPMExtensionInfoEnumerator.ahk
#Include .\IPMBackgroundServiceAgentInfoEnumerator.ahk
#Include .\IPMBackgroundWorkerInfoEnumerator.ahk
#Include .\IPMApplicationInfo.ahk
#Include .\IPMTileInfo.ahk
#Include .\IPMTaskInfo.ahk
#Include .\IPMBackgroundServiceAgentInfo.ahk
#Include .\IPMLiveTileJobInfoEnumerator.ahk
#Include .\IPMLiveTileJobInfo.ahk
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
     * @param {PM_ENUM_FILTER} Filter 
     * @returns {IPMApplicationInfoEnumerator} 
     */
    get_AllApplications(Filter) {
        result := ComCall(3, this, "ptr*", &ppAppEnum := 0, "ptr", Filter, "HRESULT")
        return IPMApplicationInfoEnumerator(ppAppEnum)
    }

    /**
     * 
     * @param {PM_ENUM_FILTER} Filter 
     * @returns {IPMTileInfoEnumerator} 
     */
    get_AllTiles(Filter) {
        result := ComCall(4, this, "ptr*", &ppTileEnum := 0, "ptr", Filter, "HRESULT")
        return IPMTileInfoEnumerator(ppTileEnum)
    }

    /**
     * 
     * @param {PM_ENUM_FILTER} Filter 
     * @returns {IPMTaskInfoEnumerator} 
     */
    get_AllTasks(Filter) {
        result := ComCall(5, this, "ptr*", &ppTaskEnum := 0, "ptr", Filter, "HRESULT")
        return IPMTaskInfoEnumerator(ppTaskEnum)
    }

    /**
     * 
     * @param {PM_ENUM_FILTER} Filter 
     * @returns {IPMExtensionInfoEnumerator} 
     */
    get_AllExtensions(Filter) {
        result := ComCall(6, this, "ptr*", &ppExtensionEnum := 0, "ptr", Filter, "HRESULT")
        return IPMExtensionInfoEnumerator(ppExtensionEnum)
    }

    /**
     * 
     * @param {PM_ENUM_FILTER} Filter 
     * @returns {IPMBackgroundServiceAgentInfoEnumerator} 
     */
    get_AllBackgroundServiceAgents(Filter) {
        result := ComCall(7, this, "ptr*", &ppBSAEnum := 0, "ptr", Filter, "HRESULT")
        return IPMBackgroundServiceAgentInfoEnumerator(ppBSAEnum)
    }

    /**
     * 
     * @param {PM_ENUM_FILTER} Filter 
     * @returns {IPMBackgroundWorkerInfoEnumerator} 
     */
    get_AllBackgroundWorkers(Filter) {
        result := ComCall(8, this, "ptr*", &ppBSWEnum := 0, "ptr", Filter, "HRESULT")
        return IPMBackgroundWorkerInfoEnumerator(ppBSWEnum)
    }

    /**
     * 
     * @param {Guid} ProductID 
     * @returns {IPMApplicationInfo} 
     */
    get_ApplicationInfo(ProductID) {
        result := ComCall(9, this, "ptr", ProductID, "ptr*", &ppAppInfo := 0, "HRESULT")
        return IPMApplicationInfo(ppAppInfo)
    }

    /**
     * 
     * @param {Guid} ProductID 
     * @param {BSTR} TileID 
     * @returns {IPMTileInfo} 
     */
    get_TileInfo(ProductID, TileID) {
        TileID := TileID is String ? BSTR.Alloc(TileID).Value : TileID

        result := ComCall(10, this, "ptr", ProductID, "ptr", TileID, "ptr*", &ppTileInfo := 0, "HRESULT")
        return IPMTileInfo(ppTileInfo)
    }

    /**
     * 
     * @param {Guid} ProductID 
     * @param {BSTR} TaskID 
     * @returns {IPMTaskInfo} 
     */
    get_TaskInfo(ProductID, TaskID) {
        TaskID := TaskID is String ? BSTR.Alloc(TaskID).Value : TaskID

        result := ComCall(11, this, "ptr", ProductID, "ptr", TaskID, "ptr*", &ppTaskInfo := 0, "HRESULT")
        return IPMTaskInfo(ppTaskInfo)
    }

    /**
     * 
     * @param {Guid} ProductID 
     * @param {PWSTR} TaskID 
     * @returns {IPMTaskInfo} 
     */
    get_TaskInfoEx(ProductID, TaskID) {
        TaskID := TaskID is String ? StrPtr(TaskID) : TaskID

        result := ComCall(12, this, "ptr", ProductID, "ptr", TaskID, "ptr*", &ppTaskInfo := 0, "HRESULT")
        return IPMTaskInfo(ppTaskInfo)
    }

    /**
     * 
     * @param {Integer} BSAID 
     * @returns {IPMBackgroundServiceAgentInfo} 
     */
    get_BackgroundServiceAgentInfo(BSAID) {
        result := ComCall(13, this, "uint", BSAID, "ptr*", &ppTaskInfo := 0, "HRESULT")
        return IPMBackgroundServiceAgentInfo(ppTaskInfo)
    }

    /**
     * 
     * @returns {IPMLiveTileJobInfoEnumerator} 
     */
    get_AllLiveTileJobs() {
        result := ComCall(14, this, "ptr*", &ppLiveTileJobEnum := 0, "HRESULT")
        return IPMLiveTileJobInfoEnumerator(ppLiveTileJobEnum)
    }

    /**
     * 
     * @param {Guid} ProductID 
     * @param {BSTR} TileID 
     * @param {Integer} RecurrenceType 
     * @returns {IPMLiveTileJobInfo} 
     */
    get_LiveTileJob(ProductID, TileID, RecurrenceType) {
        TileID := TileID is String ? BSTR.Alloc(TileID).Value : TileID

        result := ComCall(15, this, "ptr", ProductID, "ptr", TileID, "int", RecurrenceType, "ptr*", &ppLiveTileJobInfo := 0, "HRESULT")
        return IPMLiveTileJobInfo(ppLiveTileJobInfo)
    }

    /**
     * 
     * @param {Guid} ProductID 
     * @returns {IPMApplicationInfo} 
     */
    get_ApplicationInfoExternal(ProductID) {
        result := ComCall(16, this, "ptr", ProductID, "ptr*", &ppAppInfo := 0, "HRESULT")
        return IPMApplicationInfo(ppAppInfo)
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
     * @returns {IPMApplicationInfo} 
     */
    get_ApplicationInfoFromAccessClaims(SysAppID0, SysAppID1) {
        SysAppID0 := SysAppID0 is String ? BSTR.Alloc(SysAppID0).Value : SysAppID0
        SysAppID1 := SysAppID1 is String ? BSTR.Alloc(SysAppID1).Value : SysAppID1

        result := ComCall(18, this, "ptr", SysAppID0, "ptr", SysAppID1, "ptr*", &ppAppInfo := 0, "HRESULT")
        return IPMApplicationInfo(ppAppInfo)
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
        ppTileBlobsMarshal := ppTileBlobs is VarRef ? "ptr*" : "ptr"

        result := ComCall(19, this, "ptr", Filter, pcTilesMarshal, pcTiles, ppTileBlobsMarshal, ppTileBlobs, "HRESULT")
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
        ppAppBlobsMarshal := ppAppBlobs is VarRef ? "ptr*" : "ptr"

        result := ComCall(20, this, "ptr", Filter, pcAppsMarshal, pcApps, ppAppBlobsMarshal, ppAppBlobs, "HRESULT")
        return result
    }
}
