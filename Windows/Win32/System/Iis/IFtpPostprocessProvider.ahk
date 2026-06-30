#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\FTP_PROCESS_STATUS.ahk
#Include ..\Com\IUnknown.ahk
#Include .\POST_PROCESS_PARAMETERS.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.System.Iis
 */
class IFtpPostprocessProvider extends IUnknown {

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["HandlePostprocess"]

    /**
     * 
     * @param {Pointer<POST_PROCESS_PARAMETERS>} pPostProcessParameters 
     * @returns {FTP_PROCESS_STATUS} 
     */
    HandlePostprocess(pPostProcessParameters) {
        result := ComCall(3, this, "ptr", pPostProcessParameters, "int*", &pFtpProcessStatus := 0, "HRESULT")
        return pFtpProcessStatus
    }
}
