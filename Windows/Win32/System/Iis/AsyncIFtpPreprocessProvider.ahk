#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class AsyncIFtpPreprocessProvider extends IUnknown{
    /**
     * The interface identifier for AsyncIFtpPreprocessProvider
     * @type {Guid}
     */
    static IID => Guid("{6ff5fd8f-fd8e-48b1-a3e0-bf7073db4db5}")

    /**
     * The class identifier for AsyncIFtpPreprocessProvider
     * @type {Guid}
     */
    static CLSID => Guid("{6ff5fd8f-fd8e-48b1-a3e0-bf7073db4db5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PRE_PROCESS_PARAMETERS>} pPreProcessParameters 
     * @returns {HRESULT} 
     */
    Begin_HandlePreprocess(pPreProcessParameters) {
        result := ComCall(3, this, "ptr", pPreProcessParameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pFtpProcessStatus 
     * @returns {HRESULT} 
     */
    Finish_HandlePreprocess(pFtpProcessStatus) {
        result := ComCall(4, this, "int*", pFtpProcessStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
