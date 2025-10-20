#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Controls the RPC stub used to marshal data between COM components.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-irpcstubbuffer
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IRpcStubBuffer extends IUnknown{
    /**
     * The interface identifier for IRpcStubBuffer
     * @type {Guid}
     */
    static IID => Guid("{d5f56afc-593b-101a-b569-08002b2dbf7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} pUnkServer 
     * @returns {HRESULT} 
     */
    Connect(pUnkServer) {
        result := ComCall(3, this, "ptr", pUnkServer, "int")
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

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} _prpcmsg 
     * @param {Pointer<IRpcChannelBuffer>} _pRpcChannelBuffer 
     * @returns {HRESULT} 
     */
    Invoke(_prpcmsg, _pRpcChannelBuffer) {
        result := ComCall(5, this, "ptr", _prpcmsg, "ptr", _pRpcChannelBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<IRpcStubBuffer>} 
     */
    IsIIDSupported(riid) {
        result := ComCall(6, this, "ptr", riid, "ptr")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    CountRefs() {
        result := ComCall(7, this, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    DebugServerQueryInterface(ppv) {
        result := ComCall(8, this, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pv 
     * @returns {String} Nothing - always returns an empty string
     */
    DebugServerRelease(pv) {
        ComCall(9, this, "ptr", pv)
        return result
    }
}
