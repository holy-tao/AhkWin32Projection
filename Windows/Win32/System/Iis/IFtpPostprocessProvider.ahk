#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class IFtpPostprocessProvider extends IUnknown{

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
     * @param {Pointer<Integer>} pFtpProcessStatus 
     * @returns {HRESULT} 
     */
    HandlePostprocess(pPostProcessParameters, pFtpProcessStatus) {
        pFtpProcessStatusMarshal := pFtpProcessStatus is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", pPostProcessParameters, pFtpProcessStatusMarshal, pFtpProcessStatus, "HRESULT")
        return result
    }
}
