#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaKeys.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaKeys2 extends IMFMediaKeys{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaKeys2
     * @type {Guid}
     */
    static IID => Guid("{45892507-ad66-4de2-83a2-acbb13cd8d43}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSession2", "SetServerCertificate", "GetDOMException"]

    /**
     * 
     * @param {Integer} eSessionType 
     * @param {IMFMediaKeySessionNotify2} pMFMediaKeySessionNotify2 
     * @param {Pointer<IMFMediaKeySession2>} ppSession 
     * @returns {HRESULT} 
     */
    CreateSession2(eSessionType, pMFMediaKeySessionNotify2, ppSession) {
        result := ComCall(7, this, "int", eSessionType, "ptr", pMFMediaKeySessionNotify2, "ptr*", ppSession, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} pbServerCertificate 
     * @param {Integer} cb 
     * @returns {HRESULT} 
     */
    SetServerCertificate(pbServerCertificate, cb) {
        result := ComCall(8, this, "ptr", pbServerCertificate, "uint", cb, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} systemCode 
     * @param {Pointer<HRESULT>} code 
     * @returns {HRESULT} 
     */
    GetDOMException(systemCode, code) {
        result := ComCall(9, this, "int", systemCode, "ptr", code, "HRESULT")
        return result
    }
}
