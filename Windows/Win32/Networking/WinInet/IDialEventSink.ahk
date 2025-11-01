#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class IDialEventSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDialEventSink
     * @type {Guid}
     */
    static IID => Guid("{2d86f4ff-6e2d-4488-b2e9-6934afd41bea}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnEvent"]

    /**
     * 
     * @param {Integer} dwEvent 
     * @param {Integer} dwStatus 
     * @returns {HRESULT} 
     */
    OnEvent(dwEvent, dwStatus) {
        result := ComCall(3, this, "uint", dwEvent, "uint", dwStatus, "HRESULT")
        return result
    }
}
