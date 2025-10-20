#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMPSyncDevice2.ahk

/**
 * The IWMPSyncDevice3 interface provides methods for estimating the size required to synchronize a playlist to a device.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpsyncdevice3
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPSyncDevice3 extends IWMPSyncDevice2{
    /**
     * The interface identifier for IWMPSyncDevice3
     * @type {Guid}
     */
    static IID => Guid("{b22c85f9-263c-4372-a0da-b518db9b4098}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * 
     * @param {Pointer<IWMPPlaylist>} pNonRulePlaylist 
     * @param {Pointer<IWMPPlaylist>} pRulesPlaylist 
     * @returns {HRESULT} 
     */
    estimateSyncSize(pNonRulePlaylist, pRulesPlaylist) {
        result := ComCall(20, this, "ptr", pNonRulePlaylist, "ptr", pRulesPlaylist, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    cancelEstimation() {
        result := ComCall(21, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
