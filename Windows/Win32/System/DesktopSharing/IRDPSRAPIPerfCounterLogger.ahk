#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables a client application to implement custom performance logging.
 * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nn-rdpencomapi-irdpsrapiperfcounterlogger
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class IRDPSRAPIPerfCounterLogger extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRDPSRAPIPerfCounterLogger
     * @type {Guid}
     */
    static IID => Guid("{071c2533-0fa4-4e8f-ae83-9c10b4305ab5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LogValue"]

    /**
     * 
     * @param {Integer} lValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiperfcounterlogger-logvalue
     */
    LogValue(lValue) {
        result := ComCall(3, this, "int64", lValue, "HRESULT")
        return result
    }
}
