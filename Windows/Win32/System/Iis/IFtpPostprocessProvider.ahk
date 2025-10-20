#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class IFtpPostprocessProvider extends IUnknown{
    /**
     * The interface identifier for IFtpPostprocessProvider
     * @type {Guid}
     */
    static IID => Guid("{4522cbc6-16cd-49ad-8653-9a2c579e4280}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<POST_PROCESS_PARAMETERS>} pPostProcessParameters 
     * @param {Pointer<Int32>} pFtpProcessStatus 
     * @returns {HRESULT} 
     */
    HandlePostprocess(pPostProcessParameters, pFtpProcessStatus) {
        result := ComCall(3, this, "ptr", pPostProcessParameters, "int*", pFtpProcessStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
