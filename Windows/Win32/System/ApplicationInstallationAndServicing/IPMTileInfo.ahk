#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\TILE_TEMPLATE_TYPE.ahk" { TILE_TEMPLATE_TYPE }
#Import ".\PM_TILE_HUBTYPE.ahk" { PM_TILE_HUBTYPE }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\PM_TILE_SIZE.ahk" { PM_TILE_SIZE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IPMTilePropertyInfo.ahk" { IPMTilePropertyInfo }
#Import ".\PM_STARTTILEBLOB.ahk" { PM_STARTTILEBLOB }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IPMTilePropertyEnumerator.ahk" { IPMTilePropertyEnumerator }
#Import ".\PM_STARTTILE_TYPE.ahk" { PM_STARTTILE_TYPE }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct IPMTileInfo extends IUnknown {
    /**
     * The interface identifier for IPMTileInfo
     * @type {Guid}
     */
    static IID := Guid("{d1604833-2b08-4001-82cd-183ad734f752}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPMTileInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_ProductID             : IntPtr
        get_TileID                : IntPtr
        get_TemplateType          : IntPtr
        get_HubPinnedState        : IntPtr
        get_HubPosition           : IntPtr
        get_IsNotified            : IntPtr
        get_IsDefault             : IntPtr
        get_TaskID                : IntPtr
        get_TileType              : IntPtr
        get_IsThemable            : IntPtr
        get_PropertyById          : IntPtr
        get_InvocationInfo        : IntPtr
        get_PropertyEnum          : IntPtr
        get_HubTileSize           : IntPtr
        set_HubPosition           : IntPtr
        set_NotifiedState         : IntPtr
        set_HubPinnedState        : IntPtr
        set_HubTileSize           : IntPtr
        set_InvocationInfo        : IntPtr
        get_StartTileBlob         : IntPtr
        get_IsRestoring           : IntPtr
        get_IsAutoRestoreDisabled : IntPtr
        set_IsRestoring           : IntPtr
        set_IsAutoRestoreDisabled : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPMTileInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Guid} 
     */
    ProductID {
        get => this.get_ProductID()
    }

    /**
     */
    TileID {
        get => this.get_TileID()
    }

    /**
     * @type {TILE_TEMPLATE_TYPE} 
     */
    TemplateType {
        get => this.get_TemplateType()
    }

    /**
     * @type {BOOL} 
     */
    IsNotified {
        get => this.get_IsNotified()
    }

    /**
     * @type {BOOL} 
     */
    IsDefault {
        get => this.get_IsDefault()
    }

    /**
     */
    TaskID {
        get => this.get_TaskID()
    }

    /**
     * @type {PM_STARTTILE_TYPE} 
     */
    TileType {
        get => this.get_TileType()
    }

    /**
     * @type {BOOL} 
     */
    IsThemable {
        get => this.get_IsThemable()
    }

    /**
     * @type {IPMTilePropertyEnumerator} 
     */
    PropertyEnum {
        get => this.get_PropertyEnum()
    }

    /**
     */
    NotifiedState {
    }

    /**
     */
    StartTileBlob {
        get => this.get_StartTileBlob()
    }

    /**
     * @type {BOOL} 
     */
    IsRestoring {
        get => this.get_IsRestoring()
    }

    /**
     * @type {BOOL} 
     */
    IsAutoRestoreDisabled {
        get => this.get_IsAutoRestoreDisabled()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ProductID() {
        pProductID := Guid()
        result := ComCall(3, this, Guid.Ptr, pProductID, "HRESULT")
        return pProductID
    }

    /**
     * 
     * @param {Pointer<BSTR>} pTileID 
     * @returns {HRESULT} 
     */
    get_TileID(pTileID) {
        result := ComCall(4, this, BSTR.Ptr, pTileID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {TILE_TEMPLATE_TYPE} 
     */
    get_TemplateType() {
        result := ComCall(5, this, "int*", &pTemplateType := 0, "HRESULT")
        return pTemplateType
    }

    /**
     * 
     * @param {PM_TILE_HUBTYPE} HubType 
     * @returns {BOOL} 
     */
    get_HubPinnedState(HubType) {
        result := ComCall(6, this, PM_TILE_HUBTYPE, HubType, BOOL.Ptr, &pPinned := 0, "HRESULT")
        return pPinned
    }

    /**
     * 
     * @param {PM_TILE_HUBTYPE} HubType 
     * @returns {Integer} 
     */
    get_HubPosition(HubType) {
        result := ComCall(7, this, PM_TILE_HUBTYPE, HubType, "uint*", &pPosition := 0, "HRESULT")
        return pPosition
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsNotified() {
        result := ComCall(8, this, BOOL.Ptr, &pIsNotified := 0, "HRESULT")
        return pIsNotified
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsDefault() {
        result := ComCall(9, this, BOOL.Ptr, &pIsDefault := 0, "HRESULT")
        return pIsDefault
    }

    /**
     * 
     * @param {Pointer<BSTR>} pTaskID 
     * @returns {HRESULT} 
     */
    get_TaskID(pTaskID) {
        result := ComCall(10, this, BSTR.Ptr, pTaskID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PM_STARTTILE_TYPE} 
     */
    get_TileType() {
        result := ComCall(11, this, "int*", &pStartTileType := 0, "HRESULT")
        return pStartTileType
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsThemable() {
        result := ComCall(12, this, BOOL.Ptr, &pIsThemable := 0, "HRESULT")
        return pIsThemable
    }

    /**
     * 
     * @param {Integer} PropID 
     * @returns {IPMTilePropertyInfo} 
     */
    get_PropertyById(PropID) {
        result := ComCall(13, this, "uint", PropID, "ptr*", &ppPropInfo := 0, "HRESULT")
        return IPMTilePropertyInfo(ppPropInfo)
    }

    /**
     * 
     * @param {Pointer<BSTR>} pImageUrn 
     * @param {Pointer<BSTR>} pParameters 
     * @returns {HRESULT} 
     */
    get_InvocationInfo(pImageUrn, pParameters) {
        result := ComCall(14, this, BSTR.Ptr, pImageUrn, BSTR.Ptr, pParameters, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IPMTilePropertyEnumerator} 
     */
    get_PropertyEnum() {
        result := ComCall(15, this, "ptr*", &ppTilePropEnum := 0, "HRESULT")
        return IPMTilePropertyEnumerator(ppTilePropEnum)
    }

    /**
     * 
     * @param {PM_TILE_HUBTYPE} HubType 
     * @returns {PM_TILE_SIZE} 
     */
    get_HubTileSize(HubType) {
        result := ComCall(16, this, PM_TILE_HUBTYPE, HubType, "int*", &pSize := 0, "HRESULT")
        return pSize
    }

    /**
     * 
     * @param {PM_TILE_HUBTYPE} HubType 
     * @param {Integer} Position 
     * @returns {HRESULT} 
     */
    set_HubPosition(HubType, Position) {
        result := ComCall(17, this, PM_TILE_HUBTYPE, HubType, "uint", Position, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} Notified 
     * @returns {HRESULT} 
     */
    set_NotifiedState(Notified) {
        result := ComCall(18, this, BOOL, Notified, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PM_TILE_HUBTYPE} HubType 
     * @param {BOOL} Pinned 
     * @returns {HRESULT} 
     */
    set_HubPinnedState(HubType, Pinned) {
        result := ComCall(19, this, PM_TILE_HUBTYPE, HubType, BOOL, Pinned, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PM_TILE_HUBTYPE} HubType 
     * @param {PM_TILE_SIZE} _Size 
     * @returns {HRESULT} 
     */
    set_HubTileSize(HubType, _Size) {
        result := ComCall(20, this, PM_TILE_HUBTYPE, HubType, PM_TILE_SIZE, _Size, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} TaskName 
     * @param {BSTR} TaskParameters 
     * @returns {HRESULT} 
     */
    set_InvocationInfo(TaskName, TaskParameters) {
        TaskName := TaskName is String ? BSTR.Alloc(TaskName).Value : TaskName
        TaskParameters := TaskParameters is String ? BSTR.Alloc(TaskParameters).Value : TaskParameters

        result := ComCall(21, this, BSTR, TaskName, BSTR, TaskParameters, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PM_STARTTILEBLOB>} pBlob 
     * @returns {HRESULT} 
     */
    get_StartTileBlob(pBlob) {
        result := ComCall(22, this, PM_STARTTILEBLOB.Ptr, pBlob, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsRestoring() {
        result := ComCall(23, this, BOOL.Ptr, &pIsRestoring := 0, "HRESULT")
        return pIsRestoring
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsAutoRestoreDisabled() {
        result := ComCall(24, this, BOOL.Ptr, &pIsAutoRestoreDisabled := 0, "HRESULT")
        return pIsAutoRestoreDisabled
    }

    /**
     * 
     * @param {BOOL} Restoring 
     * @returns {HRESULT} 
     */
    set_IsRestoring(Restoring) {
        result := ComCall(25, this, BOOL, Restoring, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} AutoRestoreDisabled 
     * @returns {HRESULT} 
     */
    set_IsAutoRestoreDisabled(AutoRestoreDisabled) {
        result := ComCall(26, this, BOOL, AutoRestoreDisabled, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPMTileInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ProductID := CallbackCreate(GetMethod(implObj, "get_ProductID"), flags, 2)
        this.vtbl.get_TileID := CallbackCreate(GetMethod(implObj, "get_TileID"), flags, 2)
        this.vtbl.get_TemplateType := CallbackCreate(GetMethod(implObj, "get_TemplateType"), flags, 2)
        this.vtbl.get_HubPinnedState := CallbackCreate(GetMethod(implObj, "get_HubPinnedState"), flags, 3)
        this.vtbl.get_HubPosition := CallbackCreate(GetMethod(implObj, "get_HubPosition"), flags, 3)
        this.vtbl.get_IsNotified := CallbackCreate(GetMethod(implObj, "get_IsNotified"), flags, 2)
        this.vtbl.get_IsDefault := CallbackCreate(GetMethod(implObj, "get_IsDefault"), flags, 2)
        this.vtbl.get_TaskID := CallbackCreate(GetMethod(implObj, "get_TaskID"), flags, 2)
        this.vtbl.get_TileType := CallbackCreate(GetMethod(implObj, "get_TileType"), flags, 2)
        this.vtbl.get_IsThemable := CallbackCreate(GetMethod(implObj, "get_IsThemable"), flags, 2)
        this.vtbl.get_PropertyById := CallbackCreate(GetMethod(implObj, "get_PropertyById"), flags, 3)
        this.vtbl.get_InvocationInfo := CallbackCreate(GetMethod(implObj, "get_InvocationInfo"), flags, 3)
        this.vtbl.get_PropertyEnum := CallbackCreate(GetMethod(implObj, "get_PropertyEnum"), flags, 2)
        this.vtbl.get_HubTileSize := CallbackCreate(GetMethod(implObj, "get_HubTileSize"), flags, 3)
        this.vtbl.set_HubPosition := CallbackCreate(GetMethod(implObj, "set_HubPosition"), flags, 3)
        this.vtbl.set_NotifiedState := CallbackCreate(GetMethod(implObj, "set_NotifiedState"), flags, 2)
        this.vtbl.set_HubPinnedState := CallbackCreate(GetMethod(implObj, "set_HubPinnedState"), flags, 3)
        this.vtbl.set_HubTileSize := CallbackCreate(GetMethod(implObj, "set_HubTileSize"), flags, 3)
        this.vtbl.set_InvocationInfo := CallbackCreate(GetMethod(implObj, "set_InvocationInfo"), flags, 3)
        this.vtbl.get_StartTileBlob := CallbackCreate(GetMethod(implObj, "get_StartTileBlob"), flags, 2)
        this.vtbl.get_IsRestoring := CallbackCreate(GetMethod(implObj, "get_IsRestoring"), flags, 2)
        this.vtbl.get_IsAutoRestoreDisabled := CallbackCreate(GetMethod(implObj, "get_IsAutoRestoreDisabled"), flags, 2)
        this.vtbl.set_IsRestoring := CallbackCreate(GetMethod(implObj, "set_IsRestoring"), flags, 2)
        this.vtbl.set_IsAutoRestoreDisabled := CallbackCreate(GetMethod(implObj, "set_IsAutoRestoreDisabled"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ProductID)
        CallbackFree(this.vtbl.get_TileID)
        CallbackFree(this.vtbl.get_TemplateType)
        CallbackFree(this.vtbl.get_HubPinnedState)
        CallbackFree(this.vtbl.get_HubPosition)
        CallbackFree(this.vtbl.get_IsNotified)
        CallbackFree(this.vtbl.get_IsDefault)
        CallbackFree(this.vtbl.get_TaskID)
        CallbackFree(this.vtbl.get_TileType)
        CallbackFree(this.vtbl.get_IsThemable)
        CallbackFree(this.vtbl.get_PropertyById)
        CallbackFree(this.vtbl.get_InvocationInfo)
        CallbackFree(this.vtbl.get_PropertyEnum)
        CallbackFree(this.vtbl.get_HubTileSize)
        CallbackFree(this.vtbl.set_HubPosition)
        CallbackFree(this.vtbl.set_NotifiedState)
        CallbackFree(this.vtbl.set_HubPinnedState)
        CallbackFree(this.vtbl.set_HubTileSize)
        CallbackFree(this.vtbl.set_InvocationInfo)
        CallbackFree(this.vtbl.get_StartTileBlob)
        CallbackFree(this.vtbl.get_IsRestoring)
        CallbackFree(this.vtbl.get_IsAutoRestoreDisabled)
        CallbackFree(this.vtbl.set_IsRestoring)
        CallbackFree(this.vtbl.set_IsAutoRestoreDisabled)
    }
}
