#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IHttpNegotiate.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IHttpNegotiate2 extends IHttpNegotiate{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpNegotiate2
     * @type {Guid}
     */
    static IID => Guid("{4f9f9fcb-e0f4-48eb-b7ab-fa2ea9365cb4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRootSecurityId"]

    /**
     * 
     * @param {Pointer<Integer>} pbSecurityId 
     * @param {Pointer<Integer>} pcbSecurityId 
     * @param {Pointer} dwReserved 
     * @returns {HRESULT} 
     */
    GetRootSecurityId(pbSecurityId, pcbSecurityId, dwReserved) {
        pbSecurityIdMarshal := pbSecurityId is VarRef ? "char*" : "ptr"
        pcbSecurityIdMarshal := pcbSecurityId is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pbSecurityIdMarshal, pbSecurityId, pcbSecurityIdMarshal, pcbSecurityId, "ptr", dwReserved, "HRESULT")
        return result
    }
}
