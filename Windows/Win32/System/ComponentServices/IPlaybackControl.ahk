#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables participation in the abnormal handling of server-side playback errors and client-side failures of the Message Queuing delivery mechanism.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-iplaybackcontrol
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IPlaybackControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlaybackControl
     * @type {Guid}
     */
    static IID => Guid("{51372afd-cae7-11cf-be81-00aa00a2fa25}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FinalClientRetry", "FinalServerRetry"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iplaybackcontrol-finalclientretry
     */
    FinalClientRetry() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iplaybackcontrol-finalserverretry
     */
    FinalServerRetry() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
