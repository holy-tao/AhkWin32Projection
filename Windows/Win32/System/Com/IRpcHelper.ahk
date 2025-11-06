#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IRpcHelper extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRpcHelper
     * @type {Guid}
     */
    static IID => Guid("{00000149-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDCOMProtocolVersion", "GetIIDFromOBJREF"]

    /**
     * 
     * @returns {Integer} 
     */
    GetDCOMProtocolVersion() {
        result := ComCall(3, this, "uint*", &pComVersion := 0, "HRESULT")
        return pComVersion
    }

    /**
     * 
     * @param {Pointer<Void>} pObjRef 
     * @returns {Pointer<Guid>} 
     */
    GetIIDFromOBJREF(pObjRef) {
        pObjRefMarshal := pObjRef is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, pObjRefMarshal, pObjRef, "ptr*", &piid := 0, "HRESULT")
        return piid
    }
}
