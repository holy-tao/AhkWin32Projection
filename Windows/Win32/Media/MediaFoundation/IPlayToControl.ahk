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
     * 
     * @param {Pointer<IMFSharingEngineClassFactory>} pFactory 
     * @returns {HRESULT} 
     */
    Connect(pFactory) {
        result := ComCall(3, this, "ptr", pFactory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Disconnect() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
