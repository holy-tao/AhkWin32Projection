#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class AsyncIFtpPostprocessProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for AsyncIFtpPostprocessProvider
     * @type {Guid}
     */
    static IID => Guid("{a16b2542-9694-4eb1-a564-6c2e91fdc133}")

    /**
     * The class identifier for AsyncIFtpPostprocessProvider
     * @type {Guid}
     */
    static CLSID => Guid("{a16b2542-9694-4eb1-a564-6c2e91fdc133}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Begin_HandlePostprocess", "Finish_HandlePostprocess"]

    /**
     * 
     * @param {Pointer<POST_PROCESS_PARAMETERS>} pPostProcessParameters 
     * @returns {HRESULT} 
     */
    Begin_HandlePostprocess(pPostProcessParameters) {
        result := ComCall(3, this, "ptr", pPostProcessParameters, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    Finish_HandlePostprocess() {
        result := ComCall(4, this, "int*", &pFtpProcessStatus := 0, "HRESULT")
        return pFtpProcessStatus
    }
}
