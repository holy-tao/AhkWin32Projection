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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Connect", "Disconnect", "Invoke", "IsIIDSupported", "CountRefs", "DebugServerQueryInterface", "DebugServerRelease"]

    /**
     * 
     * @param {IUnknown} pUnkServer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-irpcstubbuffer-connect
     */
    Connect(pUnkServer) {
        result := ComCall(3, this, "ptr", pUnkServer, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-irpcstubbuffer-disconnect
     */
    Disconnect() {
        ComCall(4, this)
    }

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} _prpcmsg 
     * @param {IRpcChannelBuffer} _pRpcChannelBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-irpcstubbuffer-invoke
     */
    Invoke(_prpcmsg, _pRpcChannelBuffer) {
        result := ComCall(5, this, "ptr", _prpcmsg, "ptr", _pRpcChannelBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {IRpcStubBuffer} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-irpcstubbuffer-isiidsupported
     */
    IsIIDSupported(riid) {
        result := ComCall(6, this, "ptr", riid, "ptr")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-irpcstubbuffer-countrefs
     */
    CountRefs() {
        result := ComCall(7, this, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-irpcstubbuffer-debugserverqueryinterface
     */
    DebugServerQueryInterface(ppv) {
        result := ComCall(8, this, "ptr*", ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pv 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-irpcstubbuffer-debugserverrelease
     */
    DebugServerRelease(pv) {
        ComCall(9, this, "ptr", pv)
    }
}
