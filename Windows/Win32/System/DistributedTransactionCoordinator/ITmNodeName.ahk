#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ITmNodeName extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITmNodeName
     * @type {Guid}
     */
    static IID => Guid("{30274f88-6ee4-474e-9b95-7807bc9ef8cf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNodeNameSize", "GetNodeName"]

    /**
     * 
     * @param {Pointer<Integer>} pcbNodeNameSize 
     * @returns {HRESULT} 
     */
    GetNodeNameSize(pcbNodeNameSize) {
        result := ComCall(3, this, "uint*", pcbNodeNameSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cbNodeNameBufferSize 
     * @param {PWSTR} pNodeNameBuffer 
     * @returns {HRESULT} 
     */
    GetNodeName(cbNodeNameBufferSize, pNodeNameBuffer) {
        pNodeNameBuffer := pNodeNameBuffer is String ? StrPtr(pNodeNameBuffer) : pNodeNameBuffer

        result := ComCall(4, this, "uint", cbNodeNameBufferSize, "ptr", pNodeNameBuffer, "HRESULT")
        return result
    }
}
