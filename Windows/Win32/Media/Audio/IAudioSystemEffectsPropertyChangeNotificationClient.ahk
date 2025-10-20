#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioSystemEffectsPropertyChangeNotificationClient extends IUnknown{
    /**
     * The interface identifier for IAudioSystemEffectsPropertyChangeNotificationClient
     * @type {Guid}
     */
    static IID => Guid("{20049d40-56d5-400e-a2ef-385599feed49}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} type 
     * @param {PROPERTYKEY} key 
     * @returns {HRESULT} 
     */
    OnPropertyChanged(type, key) {
        result := ComCall(3, this, "int", type, "ptr", key, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
