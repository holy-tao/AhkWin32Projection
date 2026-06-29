#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPMLiveTileJobInfoEnumerator.ahk" { IPMLiveTileJobInfoEnumerator }
#Import ".\IPMLiveTileJobInfo.ahk" { IPMLiveTileJobInfo }
#Import ".\IPMApplicationInfoEnumerator.ahk" { IPMApplicationInfoEnumerator }
#Import ".\IPMApplicationInfo.ahk" { IPMApplicationInfo }
#Import ".\IPMBackgroundServiceAgentInfoEnumerator.ahk" { IPMBackgroundServiceAgentInfoEnumerator }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IPMTaskInfoEnumerator.ahk" { IPMTaskInfoEnumerator }
#Import ".\PM_LOGO_SIZE.ahk" { PM_LOGO_SIZE }
#Import ".\IPMTileInfoEnumerator.ahk" { IPMTileInfoEnumerator }
#Import ".\PM_LIVETILE_RECURRENCE_TYPE.ahk" { PM_LIVETILE_RECURRENCE_TYPE }
#Import ".\PM_STARTAPPBLOB.ahk" { PM_STARTAPPBLOB }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IPMBackgroundWorkerInfoEnumerator.ahk" { IPMBackgroundWorkerInfoEnumerator }
#Import ".\IPMTileInfo.ahk" { IPMTileInfo }
#Import ".\IPMBackgroundServiceAgentInfo.ahk" { IPMBackgroundServiceAgentInfo }
#Import ".\PM_STARTTILEBLOB.ahk" { PM_STARTTILEBLOB }
#Import ".\PM_ENUM_FILTER.ahk" { PM_ENUM_FILTER }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IPMExtensionInfoEnumerator.ahk" { IPMExtensionInfoEnumerator }
#Import ".\IPMTaskInfo.ahk" { IPMTaskInfo }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct IPMEnumerationManager extends IUnknown {
    /**
     * The interface identifier for IPMEnumerationManager
     * @type {Guid}
     */
    static IID := Guid("{698d57c2-292d-4cf3-b73c-d95a6922ed9a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPMEnumerationManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_AllApplications                 : IntPtr
        get_AllTiles                        : IntPtr
        get_AllTasks                        : IntPtr
        get_AllExtensions                   : IntPtr
        get_AllBackgroundServiceAgents      : IntPtr
        get_AllBackgroundWorkers            : IntPtr
        get_ApplicationInfo                 : IntPtr
        get_TileInfo                        : IntPtr
        get_TaskInfo                        : IntPtr
        get_TaskInfoEx                      : IntPtr
        get_BackgroundServiceAgentInfo      : IntPtr
        get_AllLiveTileJobs                 : IntPtr
        get_LiveTileJob                     : IntPtr
        get_ApplicationInfoExternal         : IntPtr
        get_FileHandlerGenericLogo          : IntPtr
        get_ApplicationInfoFromAccessClaims : IntPtr
        get_StartTileEnumeratorBlob         : IntPtr
        get_StartAppEnumeratorBlob          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPMEnumerationManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IPMLiveTileJobInfoEnumerator} 
     */
    AllLiveTileJobs {
        get => this.get_AllLiveTileJobs()
    }

    /**
     * 
     * @param {PM_ENUM_FILTER} Filter 
     * @returns {IPMApplicationInfoEnumerator} 
     */
    get_AllApplications(Filter) {
        result := ComCall(3, this, "ptr*", &ppAppEnum := 0, PM_ENUM_FILTER, Filter, "HRESULT")
        return IPMApplicationInfoEnumerator(ppAppEnum)
    }

    /**
     * 
     * @param {PM_ENUM_FILTER} Filter 
     * @returns {IPMTileInfoEnumerator} 
     */
    get_AllTiles(Filter) {
        result := ComCall(4, this, "ptr*", &ppTileEnum := 0, PM_ENUM_FILTER, Filter, "HRESULT")
        return IPMTileInfoEnumerator(ppTileEnum)
    }

    /**
     * 
     * @param {PM_ENUM_FILTER} Filter 
     * @returns {IPMTaskInfoEnumerator} 
     */
    get_AllTasks(Filter) {
        result := ComCall(5, this, "ptr*", &ppTaskEnum := 0, PM_ENUM_FILTER, Filter, "HRESULT")
        return IPMTaskInfoEnumerator(ppTaskEnum)
    }

    /**
     * 
     * @param {PM_ENUM_FILTER} Filter 
     * @returns {IPMExtensionInfoEnumerator} 
     */
    get_AllExtensions(Filter) {
        result := ComCall(6, this, "ptr*", &ppExtensionEnum := 0, PM_ENUM_FILTER, Filter, "HRESULT")
        return IPMExtensionInfoEnumerator(ppExtensionEnum)
    }

    /**
     * 
     * @param {PM_ENUM_FILTER} Filter 
     * @returns {IPMBackgroundServiceAgentInfoEnumerator} 
     */
    get_AllBackgroundServiceAgents(Filter) {
        result := ComCall(7, this, "ptr*", &ppBSAEnum := 0, PM_ENUM_FILTER, Filter, "HRESULT")
        return IPMBackgroundServiceAgentInfoEnumerator(ppBSAEnum)
    }

    /**
     * 
     * @param {PM_ENUM_FILTER} Filter 
     * @returns {IPMBackgroundWorkerInfoEnumerator} 
     */
    get_AllBackgroundWorkers(Filter) {
        result := ComCall(8, this, "ptr*", &ppBSWEnum := 0, PM_ENUM_FILTER, Filter, "HRESULT")
        return IPMBackgroundWorkerInfoEnumerator(ppBSWEnum)
    }

    /**
     * 
     * @param {Guid} ProductID 
     * @returns {IPMApplicationInfo} 
     */
    get_ApplicationInfo(ProductID) {
        result := ComCall(9, this, Guid, ProductID, "ptr*", &ppAppInfo := 0, "HRESULT")
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

        result := ComCall(10, this, Guid, ProductID, BSTR, TileID, "ptr*", &ppTileInfo := 0, "HRESULT")
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

        result := ComCall(11, this, Guid, ProductID, BSTR, TaskID, "ptr*", &ppTaskInfo := 0, "HRESULT")
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

        result := ComCall(12, this, Guid, ProductID, "ptr", TaskID, "ptr*", &ppTaskInfo := 0, "HRESULT")
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
     * @param {PM_LIVETILE_RECURRENCE_TYPE} RecurrenceType 
     * @returns {IPMLiveTileJobInfo} 
     */
    get_LiveTileJob(ProductID, TileID, RecurrenceType) {
        TileID := TileID is String ? BSTR.Alloc(TileID).Value : TileID

        result := ComCall(15, this, Guid, ProductID, BSTR, TileID, PM_LIVETILE_RECURRENCE_TYPE, RecurrenceType, "ptr*", &ppLiveTileJobInfo := 0, "HRESULT")
        return IPMLiveTileJobInfo(ppLiveTileJobInfo)
    }

    /**
     * 
     * @param {Guid} ProductID 
     * @returns {IPMApplicationInfo} 
     */
    get_ApplicationInfoExternal(ProductID) {
        result := ComCall(16, this, Guid, ProductID, "ptr*", &ppAppInfo := 0, "HRESULT")
        return IPMApplicationInfo(ppAppInfo)
    }

    /**
     * 
     * @param {BSTR} FileType 
     * @param {PM_LOGO_SIZE} LogoSize 
     * @param {Pointer<BSTR>} pLogo 
     * @returns {HRESULT} 
     */
    get_FileHandlerGenericLogo(FileType, LogoSize, pLogo) {
        FileType := FileType is String ? BSTR.Alloc(FileType).Value : FileType

        result := ComCall(17, this, BSTR, FileType, PM_LOGO_SIZE, LogoSize, BSTR.Ptr, pLogo, "HRESULT")
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

        result := ComCall(18, this, BSTR, SysAppID0, BSTR, SysAppID1, "ptr*", &ppAppInfo := 0, "HRESULT")
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

        result := ComCall(19, this, PM_ENUM_FILTER, Filter, pcTilesMarshal, pcTiles, ppTileBlobsMarshal, ppTileBlobs, "HRESULT")
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

        result := ComCall(20, this, PM_ENUM_FILTER, Filter, pcAppsMarshal, pcApps, ppAppBlobsMarshal, ppAppBlobs, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPMEnumerationManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_AllApplications := CallbackCreate(GetMethod(implObj, "get_AllApplications"), flags, 3)
        this.vtbl.get_AllTiles := CallbackCreate(GetMethod(implObj, "get_AllTiles"), flags, 3)
        this.vtbl.get_AllTasks := CallbackCreate(GetMethod(implObj, "get_AllTasks"), flags, 3)
        this.vtbl.get_AllExtensions := CallbackCreate(GetMethod(implObj, "get_AllExtensions"), flags, 3)
        this.vtbl.get_AllBackgroundServiceAgents := CallbackCreate(GetMethod(implObj, "get_AllBackgroundServiceAgents"), flags, 3)
        this.vtbl.get_AllBackgroundWorkers := CallbackCreate(GetMethod(implObj, "get_AllBackgroundWorkers"), flags, 3)
        this.vtbl.get_ApplicationInfo := CallbackCreate(GetMethod(implObj, "get_ApplicationInfo"), flags, 3)
        this.vtbl.get_TileInfo := CallbackCreate(GetMethod(implObj, "get_TileInfo"), flags, 4)
        this.vtbl.get_TaskInfo := CallbackCreate(GetMethod(implObj, "get_TaskInfo"), flags, 4)
        this.vtbl.get_TaskInfoEx := CallbackCreate(GetMethod(implObj, "get_TaskInfoEx"), flags, 4)
        this.vtbl.get_BackgroundServiceAgentInfo := CallbackCreate(GetMethod(implObj, "get_BackgroundServiceAgentInfo"), flags, 3)
        this.vtbl.get_AllLiveTileJobs := CallbackCreate(GetMethod(implObj, "get_AllLiveTileJobs"), flags, 2)
        this.vtbl.get_LiveTileJob := CallbackCreate(GetMethod(implObj, "get_LiveTileJob"), flags, 5)
        this.vtbl.get_ApplicationInfoExternal := CallbackCreate(GetMethod(implObj, "get_ApplicationInfoExternal"), flags, 3)
        this.vtbl.get_FileHandlerGenericLogo := CallbackCreate(GetMethod(implObj, "get_FileHandlerGenericLogo"), flags, 4)
        this.vtbl.get_ApplicationInfoFromAccessClaims := CallbackCreate(GetMethod(implObj, "get_ApplicationInfoFromAccessClaims"), flags, 4)
        this.vtbl.get_StartTileEnumeratorBlob := CallbackCreate(GetMethod(implObj, "get_StartTileEnumeratorBlob"), flags, 4)
        this.vtbl.get_StartAppEnumeratorBlob := CallbackCreate(GetMethod(implObj, "get_StartAppEnumeratorBlob"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_AllApplications)
        CallbackFree(this.vtbl.get_AllTiles)
        CallbackFree(this.vtbl.get_AllTasks)
        CallbackFree(this.vtbl.get_AllExtensions)
        CallbackFree(this.vtbl.get_AllBackgroundServiceAgents)
        CallbackFree(this.vtbl.get_AllBackgroundWorkers)
        CallbackFree(this.vtbl.get_ApplicationInfo)
        CallbackFree(this.vtbl.get_TileInfo)
        CallbackFree(this.vtbl.get_TaskInfo)
        CallbackFree(this.vtbl.get_TaskInfoEx)
        CallbackFree(this.vtbl.get_BackgroundServiceAgentInfo)
        CallbackFree(this.vtbl.get_AllLiveTileJobs)
        CallbackFree(this.vtbl.get_LiveTileJob)
        CallbackFree(this.vtbl.get_ApplicationInfoExternal)
        CallbackFree(this.vtbl.get_FileHandlerGenericLogo)
        CallbackFree(this.vtbl.get_ApplicationInfoFromAccessClaims)
        CallbackFree(this.vtbl.get_StartTileEnumeratorBlob)
        CallbackFree(this.vtbl.get_StartAppEnumeratorBlob)
    }
}
