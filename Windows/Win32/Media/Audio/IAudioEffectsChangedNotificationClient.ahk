#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioEffectsChangedNotificationClient extends IUnknown{
    /**
     * The interface identifier for IAudioEffectsChangedNotificationClient
     * @type {Guid}
     */
    static IID => Guid("{a5ded44f-3c5d-4b2b-bd1e-5dc1ee20bbf6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    OnAudioEffectsChanged() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
