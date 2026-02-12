#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IPMTilePropertyInfo.ahk
#Include .\IPMTilePropertyEnumerator.ahk
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
     * @type {Integer} 
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
     * @type {Integer} 
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
        result := ComCall(3, this, "ptr", pProductID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pProductID
    }

    /**
     * 
     * @param {Pointer<BSTR>} pTileID 
     * @returns {HRESULT} 
     */
    get_TileID(pTileID) {
        result := ComCall(4, this, "ptr", pTileID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TemplateType() {
        result := ComCall(5, this, "int*", &pTemplateType := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pTemplateType
    }

    /**
     * 
     * @param {Integer} HubType 
     * @returns {BOOL} 
     */
    get_HubPinnedState(HubType) {
        result := ComCall(6, this, "int", HubType, "int*", &pPinned := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pPinned
    }

    /**
     * 
     * @param {Integer} HubType 
     * @returns {Integer} 
     */
    get_HubPosition(HubType) {
        result := ComCall(7, this, "int", HubType, "uint*", &pPosition := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pPosition
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsNotified() {
        result := ComCall(8, this, "int*", &pIsNotified := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pIsNotified
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsDefault() {
        result := ComCall(9, this, "int*", &pIsDefault := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pIsDefault
    }

    /**
     * 
     * @param {Pointer<BSTR>} pTaskID 
     * @returns {HRESULT} 
     */
    get_TaskID(pTaskID) {
        result := ComCall(10, this, "ptr", pTaskID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TileType() {
        result := ComCall(11, this, "int*", &pStartTileType := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pStartTileType
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsThemable() {
        result := ComCall(12, this, "int*", &pIsThemable := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pIsThemable
    }

    /**
     * 
     * @param {Integer} PropID 
     * @returns {IPMTilePropertyInfo} 
     */
    get_PropertyById(PropID) {
        result := ComCall(13, this, "uint", PropID, "ptr*", &ppPropInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPMTilePropertyInfo(ppPropInfo)
    }

    /**
     * 
     * @param {Pointer<BSTR>} pImageUrn 
     * @param {Pointer<BSTR>} pParameters 
     * @returns {HRESULT} 
     */
    get_InvocationInfo(pImageUrn, pParameters) {
        result := ComCall(14, this, "ptr", pImageUrn, "ptr", pParameters, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IPMTilePropertyEnumerator} 
     */
    get_PropertyEnum() {
        result := ComCall(15, this, "ptr*", &ppTilePropEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPMTilePropertyEnumerator(ppTilePropEnum)
    }

    /**
     * 
     * @param {Integer} HubType 
     * @returns {Integer} 
     */
    get_HubTileSize(HubType) {
        result := ComCall(16, this, "int", HubType, "int*", &pSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pSize
    }

    /**
     * 
     * @param {Integer} HubType 
     * @param {Integer} Position 
     * @returns {HRESULT} 
     */
    set_HubPosition(HubType, Position) {
        result := ComCall(17, this, "int", HubType, "uint", Position, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BOOL} Notified 
     * @returns {HRESULT} 
     */
    set_NotifiedState(Notified) {
        result := ComCall(18, this, "int", Notified, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} HubType 
     * @param {BOOL} Pinned 
     * @returns {HRESULT} 
     */
    set_HubPinnedState(HubType, Pinned) {
        result := ComCall(19, this, "int", HubType, "int", Pinned, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} HubType 
     * @param {Integer} Size_ 
     * @returns {HRESULT} 
     */
    set_HubTileSize(HubType, Size_) {
        result := ComCall(20, this, "int", HubType, "int", Size_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} TaskName 
     * @param {BSTR} TaskParameters 
     * @returns {HRESULT} 
     */
    set_InvocationInfo(TaskName, TaskParameters) {
        if(TaskName is String) {
            pin := BSTR.Alloc(TaskName)
            TaskName := pin.Value
        }
        if(TaskParameters is String) {
            pin := BSTR.Alloc(TaskParameters)
            TaskParameters := pin.Value
        }

        result := ComCall(21, this, "ptr", TaskName, "ptr", TaskParameters, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<PM_STARTTILEBLOB>} pBlob 
     * @returns {HRESULT} 
     */
    get_StartTileBlob(pBlob) {
        result := ComCall(22, this, "ptr", pBlob, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsRestoring() {
        result := ComCall(23, this, "int*", &pIsRestoring := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pIsRestoring
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsAutoRestoreDisabled() {
        result := ComCall(24, this, "int*", &pIsAutoRestoreDisabled := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pIsAutoRestoreDisabled
    }

    /**
     * 
     * @param {BOOL} Restoring 
     * @returns {HRESULT} 
     */
    set_IsRestoring(Restoring) {
        result := ComCall(25, this, "int", Restoring, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BOOL} AutoRestoreDisabled 
     * @returns {HRESULT} 
     */
    set_IsAutoRestoreDisabled(AutoRestoreDisabled) {
        result := ComCall(26, this, "int", AutoRestoreDisabled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
