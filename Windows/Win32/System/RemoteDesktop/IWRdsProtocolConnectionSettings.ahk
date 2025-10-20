#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWRdsProtocolConnectionSettings extends IUnknown{
    /**
     * The interface identifier for IWRdsProtocolConnectionSettings
     * @type {Guid}
     */
    static IID => Guid("{83fcf5d3-f6f4-ea94-9cd2-32f280e1e510}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} PropertyID 
     * @param {Pointer<WTS_PROPERTY_VALUE>} pPropertyEntriesIn 
     * @returns {HRESULT} 
     */
    SetConnectionSetting(PropertyID, pPropertyEntriesIn) {
        result := ComCall(3, this, "ptr", PropertyID, "ptr", pPropertyEntriesIn, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} PropertyID 
     * @param {Pointer<WTS_PROPERTY_VALUE>} pPropertyEntriesOut 
     * @returns {HRESULT} 
     */
    GetConnectionSetting(PropertyID, pPropertyEntriesOut) {
        result := ComCall(4, this, "ptr", PropertyID, "ptr", pPropertyEntriesOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
