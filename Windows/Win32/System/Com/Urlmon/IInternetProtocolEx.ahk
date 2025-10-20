#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IInternetProtocol.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IInternetProtocolEx extends IInternetProtocol{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInternetProtocolEx
     * @type {Guid}
     */
    static IID => Guid("{c7a98e66-1010-492c-a1c8-c809e1f75905}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartEx"]

    /**
     * 
     * @param {IUri} pUri 
     * @param {IInternetProtocolSink} pOIProtSink 
     * @param {IInternetBindInfo} pOIBindInfo 
     * @param {Integer} grfPI 
     * @param {HANDLE_PTR} dwReserved 
     * @returns {HRESULT} 
     */
    StartEx(pUri, pOIProtSink, pOIBindInfo, grfPI, dwReserved) {
        result := ComCall(13, this, "ptr", pUri, "ptr", pOIProtSink, "ptr", pOIBindInfo, "uint", grfPI, "ptr", dwReserved, "HRESULT")
        return result
    }
}
