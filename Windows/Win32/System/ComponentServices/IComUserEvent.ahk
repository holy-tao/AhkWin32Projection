#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Notifies the subscriber of the specified user-defined metrics.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icomuserevent
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IComUserEvent extends IUnknown{
    /**
     * The interface identifier for IComUserEvent
     * @type {Guid}
     */
    static IID => Guid("{683130a4-2e50-11d2-98a5-00c04f8ee1c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<VARIANT>} pvarEvent 
     * @returns {HRESULT} 
     */
    OnUserEvent(pInfo, pvarEvent) {
        result := ComCall(3, this, "ptr", pInfo, "ptr", pvarEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
