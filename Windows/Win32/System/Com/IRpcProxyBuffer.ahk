#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Controls the RPC proxy used to marshal data between COM components.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-irpcproxybuffer
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IRpcProxyBuffer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRpcProxyBuffer
     * @type {Guid}
     */
    static IID => Guid("{d5f56a34-593b-101a-b569-08002b2dbf7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Connect", "Disconnect"]

    /**
     * 
     * @param {IRpcChannelBuffer} pRpcChannelBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-irpcproxybuffer-connect
     */
    Connect(pRpcChannelBuffer) {
        result := ComCall(3, this, "ptr", pRpcChannelBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-irpcproxybuffer-disconnect
     */
    Disconnect() {
        ComCall(4, this)
    }
}
