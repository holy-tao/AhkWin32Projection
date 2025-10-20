#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMDSPStorage interface provides an instanced-based association with a storage medium on a device.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-imdspstorage
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IMDSPStorage extends IUnknown{
    /**
     * The interface identifier for IMDSPStorage
     * @type {Guid}
     */
    static IID => Guid("{1dcb3a16-33ed-11d3-8470-00c04f79dbc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwAttributes 
     * @param {Pointer<WAVEFORMATEX>} pFormat 
     * @returns {HRESULT} 
     */
    SetAttributes(dwAttributes, pFormat) {
        result := ComCall(3, this, "uint", dwAttributes, "ptr", pFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMDSPStorageGlobals>} ppStorageGlobals 
     * @returns {HRESULT} 
     */
    GetStorageGlobals(ppStorageGlobals) {
        result := ComCall(4, this, "ptr", ppStorageGlobals, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwAttributes 
     * @param {Pointer<WAVEFORMATEX>} pFormat 
     * @returns {HRESULT} 
     */
    GetAttributes(pdwAttributes, pFormat) {
        result := ComCall(5, this, "uint*", pdwAttributes, "ptr", pFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszName 
     * @param {Integer} nMaxChars 
     * @returns {HRESULT} 
     */
    GetName(pwszName, nMaxChars) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(6, this, "ptr", pwszName, "uint", nMaxChars, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WMDMDATETIME>} pDateTimeUTC 
     * @returns {HRESULT} 
     */
    GetDate(pDateTimeUTC) {
        result := ComCall(7, this, "ptr", pDateTimeUTC, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwSizeLow 
     * @param {Pointer<UInt32>} pdwSizeHigh 
     * @returns {HRESULT} 
     */
    GetSize(pdwSizeLow, pdwSizeHigh) {
        result := ComCall(8, this, "uint*", pdwSizeLow, "uint*", pdwSizeHigh, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WMDMRIGHTS>} ppRights 
     * @param {Pointer<UInt32>} pnRightsCount 
     * @param {Pointer<Byte>} abMac 
     * @returns {HRESULT} 
     */
    GetRights(ppRights, pnRightsCount, abMac) {
        result := ComCall(9, this, "ptr", ppRights, "uint*", pnRightsCount, "char*", abMac, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwAttributes 
     * @param {Pointer<WAVEFORMATEX>} pFormat 
     * @param {PWSTR} pwszName 
     * @param {Pointer<IMDSPStorage>} ppNewStorage 
     * @returns {HRESULT} 
     */
    CreateStorage(dwAttributes, pFormat, pwszName, ppNewStorage) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(10, this, "uint", dwAttributes, "ptr", pFormat, "ptr", pwszName, "ptr", ppNewStorage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMDSPEnumStorage>} ppEnumStorage 
     * @returns {HRESULT} 
     */
    EnumStorage(ppEnumStorage) {
        result := ComCall(11, this, "ptr", ppEnumStorage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<OPAQUECOMMAND>} pCommand 
     * @returns {HRESULT} 
     */
    SendOpaqueCommand(pCommand) {
        result := ComCall(12, this, "ptr", pCommand, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
