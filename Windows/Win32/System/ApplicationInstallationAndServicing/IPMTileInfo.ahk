#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IPMTileInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPMTileInfo
     * @type {Guid}
     */
    static IID => Guid("{d1604833-2b08-4001-82cd-183ad734f752}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ProductID", "get_TileID", "get_TemplateType", "get_HubPinnedState", "get_HubPosition", "get_IsNotified", "get_IsDefault", "get_TaskID", "get_TileType", "get_IsThemable", "get_PropertyById", "get_InvocationInfo", "get_PropertyEnum", "get_HubTileSize", "set_HubPosition", "set_NotifiedState", "set_HubPinnedState", "set_HubTileSize", "set_InvocationInfo", "get_StartTileBlob", "get_IsRestoring", "get_IsAutoRestoreDisabled", "set_IsRestoring", "set_IsAutoRestoreDisabled"]

    /**
     * 
     * @param {Pointer<Guid>} pProductID 
     * @returns {HRESULT} 
     */
    get_ProductID(pProductID) {
        result := ComCall(3, this, "ptr", pProductID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pTileID 
     * @returns {HRESULT} 
     */
    get_TileID(pTileID) {
        result := ComCall(4, this, "ptr", pTileID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pTemplateType 
     * @returns {HRESULT} 
     */
    get_TemplateType(pTemplateType) {
        pTemplateTypeMarshal := pTemplateType is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, pTemplateTypeMarshal, pTemplateType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} HubType 
     * @param {Pointer<BOOL>} pPinned 
     * @returns {HRESULT} 
     */
    get_HubPinnedState(HubType, pPinned) {
        result := ComCall(6, this, "int", HubType, "ptr", pPinned, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} HubType 
     * @param {Pointer<Integer>} pPosition 
     * @returns {HRESULT} 
     */
    get_HubPosition(HubType, pPosition) {
        pPositionMarshal := pPosition is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "int", HubType, pPositionMarshal, pPosition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsNotified 
     * @returns {HRESULT} 
     */
    get_IsNotified(pIsNotified) {
        result := ComCall(8, this, "ptr", pIsNotified, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsDefault 
     * @returns {HRESULT} 
     */
    get_IsDefault(pIsDefault) {
        result := ComCall(9, this, "ptr", pIsDefault, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pTaskID 
     * @returns {HRESULT} 
     */
    get_TaskID(pTaskID) {
        result := ComCall(10, this, "ptr", pTaskID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pStartTileType 
     * @returns {HRESULT} 
     */
    get_TileType(pStartTileType) {
        pStartTileTypeMarshal := pStartTileType is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, pStartTileTypeMarshal, pStartTileType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsThemable 
     * @returns {HRESULT} 
     */
    get_IsThemable(pIsThemable) {
        result := ComCall(12, this, "ptr", pIsThemable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} PropID 
     * @param {Pointer<IPMTilePropertyInfo>} ppPropInfo 
     * @returns {HRESULT} 
     */
    get_PropertyById(PropID, ppPropInfo) {
        result := ComCall(13, this, "uint", PropID, "ptr*", ppPropInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pImageUrn 
     * @param {Pointer<BSTR>} pParameters 
     * @returns {HRESULT} 
     */
    get_InvocationInfo(pImageUrn, pParameters) {
        result := ComCall(14, this, "ptr", pImageUrn, "ptr", pParameters, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IPMTilePropertyEnumerator>} ppTilePropEnum 
     * @returns {HRESULT} 
     */
    get_PropertyEnum(ppTilePropEnum) {
        result := ComCall(15, this, "ptr*", ppTilePropEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} HubType 
     * @param {Pointer<Integer>} pSize 
     * @returns {HRESULT} 
     */
    get_HubTileSize(HubType, pSize) {
        pSizeMarshal := pSize is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, "int", HubType, pSizeMarshal, pSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} HubType 
     * @param {Integer} Position 
     * @returns {HRESULT} 
     */
    set_HubPosition(HubType, Position) {
        result := ComCall(17, this, "int", HubType, "uint", Position, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} Notified 
     * @returns {HRESULT} 
     */
    set_NotifiedState(Notified) {
        result := ComCall(18, this, "int", Notified, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} HubType 
     * @param {BOOL} Pinned 
     * @returns {HRESULT} 
     */
    set_HubPinnedState(HubType, Pinned) {
        result := ComCall(19, this, "int", HubType, "int", Pinned, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} HubType 
     * @param {Integer} Size 
     * @returns {HRESULT} 
     */
    set_HubTileSize(HubType, Size) {
        result := ComCall(20, this, "int", HubType, "int", Size, "HRESULT")
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

        result := ComCall(21, this, "ptr", TaskName, "ptr", TaskParameters, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PM_STARTTILEBLOB>} pBlob 
     * @returns {HRESULT} 
     */
    get_StartTileBlob(pBlob) {
        result := ComCall(22, this, "ptr", pBlob, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsRestoring 
     * @returns {HRESULT} 
     */
    get_IsRestoring(pIsRestoring) {
        result := ComCall(23, this, "ptr", pIsRestoring, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsAutoRestoreDisabled 
     * @returns {HRESULT} 
     */
    get_IsAutoRestoreDisabled(pIsAutoRestoreDisabled) {
        result := ComCall(24, this, "ptr", pIsAutoRestoreDisabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} Restoring 
     * @returns {HRESULT} 
     */
    set_IsRestoring(Restoring) {
        result := ComCall(25, this, "int", Restoring, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} AutoRestoreDisabled 
     * @returns {HRESULT} 
     */
    set_IsAutoRestoreDisabled(AutoRestoreDisabled) {
        result := ComCall(26, this, "int", AutoRestoreDisabled, "HRESULT")
        return result
    }
}
