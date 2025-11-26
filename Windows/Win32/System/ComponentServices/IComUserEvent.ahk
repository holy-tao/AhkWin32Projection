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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnUserEvent"]

    /**
     * Provided for user components to generate user-defined events.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<VARIANT>} pvarEvent The user-defined information.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomuserevent-onuserevent
     */
    OnUserEvent(pInfo, pvarEvent) {
        result := ComCall(3, this, "ptr", pInfo, "ptr", pvarEvent, "HRESULT")
        return result
    }
}
