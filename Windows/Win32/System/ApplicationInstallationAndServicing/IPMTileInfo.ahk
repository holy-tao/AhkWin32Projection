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
     * 
     * @param {Pointer<Guid>} pProductID 
     * @returns {HRESULT} 
     */
    get_ProductID(pProductID) {
        result := ComCall(3, this, "ptr", pProductID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pTileID 
     * @returns {HRESULT} 
     */
    get_TileID(pTileID) {
        result := ComCall(4, this, "ptr", pTileID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pTemplateType 
     * @returns {HRESULT} 
     */
    get_TemplateType(pTemplateType) {
        result := ComCall(5, this, "int*", pTemplateType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} HubType 
     * @param {Pointer<BOOL>} pPinned 
     * @returns {HRESULT} 
     */
    get_HubPinnedState(HubType, pPinned) {
        result := ComCall(6, this, "int", HubType, "ptr", pPinned, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} HubType 
     * @param {Pointer<UInt32>} pPosition 
     * @returns {HRESULT} 
     */
    get_HubPosition(HubType, pPosition) {
        result := ComCall(7, this, "int", HubType, "uint*", pPosition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsNotified 
     * @returns {HRESULT} 
     */
    get_IsNotified(pIsNotified) {
        result := ComCall(8, this, "ptr", pIsNotified, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsDefault 
     * @returns {HRESULT} 
     */
    get_IsDefault(pIsDefault) {
        result := ComCall(9, this, "ptr", pIsDefault, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pTaskID 
     * @returns {HRESULT} 
     */
    get_TaskID(pTaskID) {
        result := ComCall(10, this, "ptr", pTaskID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pStartTileType 
     * @returns {HRESULT} 
     */
    get_TileType(pStartTileType) {
        result := ComCall(11, this, "int*", pStartTileType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsThemable 
     * @returns {HRESULT} 
     */
    get_IsThemable(pIsThemable) {
        result := ComCall(12, this, "ptr", pIsThemable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} PropID 
     * @param {Pointer<IPMTilePropertyInfo>} ppPropInfo 
     * @returns {HRESULT} 
     */
    get_PropertyById(PropID, ppPropInfo) {
        result := ComCall(13, this, "uint", PropID, "ptr", ppPropInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pImageUrn 
     * @param {Pointer<BSTR>} pParameters 
     * @returns {HRESULT} 
     */
    get_InvocationInfo(pImageUrn, pParameters) {
        result := ComCall(14, this, "ptr", pImageUrn, "ptr", pParameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPMTilePropertyEnumerator>} ppTilePropEnum 
     * @returns {HRESULT} 
     */
    get_PropertyEnum(ppTilePropEnum) {
        result := ComCall(15, this, "ptr", ppTilePropEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} HubType 
     * @param {Pointer<Int32>} pSize 
     * @returns {HRESULT} 
     */
    get_HubTileSize(HubType, pSize) {
        result := ComCall(16, this, "int", HubType, "int*", pSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} HubType 
     * @param {Integer} Position 
     * @returns {HRESULT} 
     */
    set_HubPosition(HubType, Position) {
        result := ComCall(17, this, "int", HubType, "uint", Position, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} Notified 
     * @returns {HRESULT} 
     */
    set_NotifiedState(Notified) {
        result := ComCall(18, this, "int", Notified, "int")
        if(result != 0)
            throw OSError(result)

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
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} HubType 
     * @param {Integer} Size 
     * @returns {HRESULT} 
     */
    set_HubTileSize(HubType, Size) {
        result := ComCall(20, this, "int", HubType, "int", Size, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(21, this, "ptr", TaskName, "ptr", TaskParameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PM_STARTTILEBLOB>} pBlob 
     * @returns {HRESULT} 
     */
    get_StartTileBlob(pBlob) {
        result := ComCall(22, this, "ptr", pBlob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsRestoring 
     * @returns {HRESULT} 
     */
    get_IsRestoring(pIsRestoring) {
        result := ComCall(23, this, "ptr", pIsRestoring, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsAutoRestoreDisabled 
     * @returns {HRESULT} 
     */
    get_IsAutoRestoreDisabled(pIsAutoRestoreDisabled) {
        result := ComCall(24, this, "ptr", pIsAutoRestoreDisabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} Restoring 
     * @returns {HRESULT} 
     */
    set_IsRestoring(Restoring) {
        result := ComCall(25, this, "int", Restoring, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} AutoRestoreDisabled 
     * @returns {HRESULT} 
     */
    set_IsAutoRestoreDisabled(AutoRestoreDisabled) {
        result := ComCall(26, this, "int", AutoRestoreDisabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
