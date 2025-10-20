#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IRpcHelper extends IUnknown{
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
     * 
     * @param {Pointer<UInt32>} pComVersion 
     * @returns {HRESULT} 
     */
    GetDCOMProtocolVersion(pComVersion) {
        result := ComCall(3, this, "uint*", pComVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pObjRef 
     * @param {Pointer<Guid>} piid 
     * @returns {HRESULT} 
     */
    GetIIDFromOBJREF(pObjRef, piid) {
        result := ComCall(4, this, "ptr", pObjRef, "ptr", piid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
