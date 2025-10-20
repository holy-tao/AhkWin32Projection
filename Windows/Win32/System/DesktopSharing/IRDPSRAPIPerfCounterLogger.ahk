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
     * 
     * @param {Integer} lValue 
     * @returns {HRESULT} 
     */
    LogValue(lValue) {
        result := ComCall(3, this, "int64", lValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
