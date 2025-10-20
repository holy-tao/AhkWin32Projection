#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class IFtpPreprocessProvider extends IUnknown{
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
     * 
     * @param {Pointer<PRE_PROCESS_PARAMETERS>} pPreProcessParameters 
     * @param {Pointer<Int32>} pFtpProcessStatus 
     * @returns {HRESULT} 
     */
    HandlePreprocess(pPreProcessParameters, pFtpProcessStatus) {
        result := ComCall(3, this, "ptr", pPreProcessParameters, "int*", pFtpProcessStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
