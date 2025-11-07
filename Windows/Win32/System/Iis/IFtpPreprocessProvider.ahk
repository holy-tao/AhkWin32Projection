#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class IFtpPreprocessProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFtpPreprocessProvider
     * @type {Guid}
     */
    static IID => Guid("{a3c19b60-5a28-471a-8f93-ab30411cee82}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["HandlePreprocess"]

    /**
     * 
     * @param {Pointer<PRE_PROCESS_PARAMETERS>} pPreProcessParameters 
     * @returns {Integer} 
     */
    HandlePreprocess(pPreProcessParameters) {
        result := ComCall(3, this, "ptr", pPreProcessParameters, "int*", &pFtpProcessStatus := 0, "HRESULT")
        return pFtpProcessStatus
    }
}
