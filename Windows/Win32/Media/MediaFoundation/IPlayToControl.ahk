#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables the PlayToConnection object to connect to a media element.
 * @see https://docs.microsoft.com/windows/win32/api//mfsharingengine/nn-mfsharingengine-iplaytocontrol
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IPlayToControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlayToControl
     * @type {Guid}
     */
    static IID => Guid("{607574eb-f4b6-45c1-b08c-cb715122901d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Connect", "Disconnect"]

    /**
     * 
     * @param {IMFSharingEngineClassFactory} pFactory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfsharingengine/nf-mfsharingengine-iplaytocontrol-connect
     */
    Connect(pFactory) {
        result := ComCall(3, this, "ptr", pFactory, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfsharingengine/nf-mfsharingengine-iplaytocontrol-disconnect
     */
    Disconnect() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
