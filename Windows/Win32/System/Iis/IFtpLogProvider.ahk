#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class IFtpLogProvider extends IUnknown{
    /**
     * The interface identifier for IFtpLogProvider
     * @type {Guid}
     */
    static IID => Guid("{a18a94cc-8299-4408-816c-7c3baca1a40e}")

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
    Log(pLoggingParameters) {
        result := ComCall(3, this, "ptr", pLoggingParameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
