#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfMouseTrackerACP interface is implemented by an application to support mouse event sinks.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfmousetrackeracp
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfMouseTrackerACP extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfMouseTrackerACP
     * @type {Guid}
     */
    static IID => Guid("{3bdd78e2-c16e-47fd-b883-ce6facc1a208}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AdviseMouseSink", "UnadviseMouseSink"]

    /**
     * 
     * @param {ITfRangeACP} range 
     * @param {ITfMouseSink} pSink 
     * @param {Pointer<Integer>} pdwCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfmousetrackeracp-advisemousesink
     */
    AdviseMouseSink(range, pSink, pdwCookie) {
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", range, "ptr", pSink, pdwCookieMarshal, pdwCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfmousetrackeracp-unadvisemousesink
     */
    UnadviseMouseSink(dwCookie) {
        result := ComCall(4, this, "uint", dwCookie, "HRESULT")
        return result
    }
}
