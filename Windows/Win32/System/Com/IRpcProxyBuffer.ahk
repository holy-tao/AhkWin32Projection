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
     * Initializes a client proxy, binding it to the specified RPC channel.
     * @param {IRpcChannelBuffer} pRpcChannelBuffer A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-irpcchannelbuffer">IRpcChannelBuffer</a> interface that the proxy uses to marshal data.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-irpcproxybuffer-connect
     */
    Connect(pRpcChannelBuffer) {
        result := ComCall(3, this, "ptr", pRpcChannelBuffer, "HRESULT")
        return result
    }

    /**
     * Disconnects a client proxy from any RPC channel to which it is connected.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-irpcproxybuffer-disconnect
     */
    Disconnect() {
        ComCall(4, this)
    }
}
