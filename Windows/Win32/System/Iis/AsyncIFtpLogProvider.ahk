#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class AsyncIFtpLogProvider extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Begin_Log", "Finish_Log"]

    /**
     * 
     * @param {Pointer<LOGGING_PARAMETERS>} pLoggingParameters 
     * @returns {HRESULT} 
     */
    Begin_Log(pLoggingParameters) {
        result := ComCall(3, this, "ptr", pLoggingParameters, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_Log() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
