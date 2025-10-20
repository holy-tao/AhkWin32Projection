#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPPlugin interface is implemented by the plug-in. It manages the connection to Windows Media Player.Note  The interface identifier GUID for this interface changed between the beta release and the final release. .
 * @see https://docs.microsoft.com/windows/win32/api//wmpservices/nn-wmpservices-iwmpplugin
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPPlugin extends IUnknown{
    /**
     * The interface identifier for IWMPPlugin
     * @type {Guid}
     */
    static IID => Guid("{f1392a70-024c-42bb-a998-73dfdfe7d5a7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer} dwPlaybackContext 
     * @returns {HRESULT} 
     */
    Init(dwPlaybackContext) {
        result := ComCall(3, this, "ptr", dwPlaybackContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Shutdown() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pGUID 
     * @returns {HRESULT} 
     */
    GetID(pGUID) {
        result := ComCall(5, this, "ptr", pGUID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwFlags 
     * @returns {HRESULT} 
     */
    GetCaps(pdwFlags) {
        result := ComCall(6, this, "uint*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMPServices>} pWMPServices 
     * @returns {HRESULT} 
     */
    AdviseWMPServices(pWMPServices) {
        result := ComCall(7, this, "ptr", pWMPServices, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UnAdviseWMPServices() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
