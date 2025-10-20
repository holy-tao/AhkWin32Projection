#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class AsyncIFtpLogProvider extends IUnknown{
    /**
     * The interface identifier for AsyncIFtpLogProvider
     * @type {Guid}
     */
    static IID => Guid("{00a0ae46-2498-48b2-95e6-df678ed7d49f}")

    /**
     * The class identifier for AsyncIFtpLogProvider
     * @type {Guid}
     */
    static CLSID => Guid("{00a0ae46-2498-48b2-95e6-df678ed7d49f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<LOGGING_PARAMETERS>} pLoggingParameters 
     * @returns {HRESULT} 
     */
    Begin_Log(pLoggingParameters) {
        result := ComCall(3, this, "ptr", pLoggingParameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_Log() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
