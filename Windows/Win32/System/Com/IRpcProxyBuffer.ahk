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
     * 
     * @param {Pointer<IRpcChannelBuffer>} pRpcChannelBuffer 
     * @returns {HRESULT} 
     */
    Connect(pRpcChannelBuffer) {
        result := ComCall(3, this, "ptr", pRpcChannelBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Disconnect() {
        ComCall(4, this)
        return result
    }
}
