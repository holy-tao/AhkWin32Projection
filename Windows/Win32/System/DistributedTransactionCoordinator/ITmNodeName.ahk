#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ITmNodeName extends IUnknown{
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
     * 
     * @param {Pointer<UInt32>} pcbNodeNameSize 
     * @returns {HRESULT} 
     */
    GetNodeNameSize(pcbNodeNameSize) {
        result := ComCall(3, this, "uint*", pcbNodeNameSize, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(4, this, "uint", cbNodeNameBufferSize, "ptr", pNodeNameBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
