#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IHttpNegotiate2.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IHttpNegotiate3 extends IHttpNegotiate2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpNegotiate3
     * @type {Guid}
     */
    static IID => Guid("{57b6c80a-34c2-4602-bc26-66a02fc57153}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSerializedClientCertContext"]

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} ppbCert 
     * @param {Pointer<Integer>} pcbCert 
     * @returns {HRESULT} 
     */
    GetSerializedClientCertContext(ppbCert, pcbCert) {
        ppbCertMarshal := ppbCert is VarRef ? "ptr*" : "ptr"
        pcbCertMarshal := pcbCert is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, ppbCertMarshal, ppbCert, pcbCertMarshal, pcbCert, "HRESULT")
        return result
    }
}
