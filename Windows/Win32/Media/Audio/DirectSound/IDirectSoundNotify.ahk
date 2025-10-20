#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class IDirectSoundNotify extends IUnknown{
    /**
     * The interface identifier for IDirectSoundNotify
     * @type {Guid}
     */
    static IID => Guid("{b0210783-89cd-11d0-af08-00a0c925cd16}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwPositionNotifies 
     * @param {Pointer<DSBPOSITIONNOTIFY>} pcPositionNotifies 
     * @returns {HRESULT} 
     */
    SetNotificationPositions(dwPositionNotifies, pcPositionNotifies) {
        result := ComCall(3, this, "uint", dwPositionNotifies, "ptr", pcPositionNotifies, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
