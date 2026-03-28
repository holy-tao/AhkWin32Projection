#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class _EventConnector extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for _EventConnector
     * @type {Guid}
     */
    static IID => Guid("{c0bccd30-de44-4528-8403-a05a6a1cc8ea}")

    /**
     * The class identifier for _EventConnector
     * @type {Guid}
     */
    static CLSID => Guid("{c0bccd30-de44-4528-8403-a05a6a1cc8ea}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ConnectTo", "Disconnect"]

    /**
     * Establishes or terminates a connection between a client's sink and a connection point container.
     * @param {_Application} _Application 
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-connecttoconnectionpoint
     */
    ConnectTo(_Application) {
        result := ComCall(7, this, "ptr", _Application, "HRESULT")
        return result
    }

    /**
     * The Disconnect event is reserved for future use.
     * @remarks
     * This event is reserved for future use.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WMP/axwmplib-axwindowsmediaplayer-disconnect
     */
    Disconnect() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
