#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncFilterDeserializer extends IUnknown{
    /**
     * The interface identifier for ISyncFilterDeserializer
     * @type {Guid}
     */
    static IID => Guid("{b45b7a72-e5c7-46be-9c82-77b8b15dab8a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Byte>} pbSyncFilter 
     * @param {Integer} dwCbSyncFilter 
     * @param {Pointer<ISyncFilter>} ppISyncFilter 
     * @returns {HRESULT} 
     */
    DeserializeSyncFilter(pbSyncFilter, dwCbSyncFilter, ppISyncFilter) {
        result := ComCall(3, this, "char*", pbSyncFilter, "uint", dwCbSyncFilter, "ptr", ppISyncFilter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
