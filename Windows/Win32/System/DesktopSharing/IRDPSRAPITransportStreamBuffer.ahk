#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Created and used by the IRDPSRAPITransportStream interface for sending and receiving data.
 * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nn-rdpencomapi-irdpsrapitransportstreambuffer
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class IRDPSRAPITransportStreamBuffer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRDPSRAPITransportStreamBuffer
     * @type {Guid}
     */
    static IID => Guid("{81c80290-5085-44b0-b460-f865c39cb4a9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Storage", "get_StorageSize", "get_PayloadSize", "put_PayloadSize", "get_PayloadOffset", "put_PayloadOffset", "get_Flags", "put_Flags", "get_Context", "put_Context"]

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} ppbStorage 
     * @returns {HRESULT} 
     */
    get_Storage(ppbStorage) {
        result := ComCall(3, this, "ptr*", ppbStorage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plMaxStore 
     * @returns {HRESULT} 
     */
    get_StorageSize(plMaxStore) {
        plMaxStoreMarshal := plMaxStore is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, plMaxStoreMarshal, plMaxStore, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plRetVal 
     * @returns {HRESULT} 
     */
    get_PayloadSize(plRetVal) {
        plRetValMarshal := plRetVal is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, plRetValMarshal, plRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lVal 
     * @returns {HRESULT} 
     */
    put_PayloadSize(lVal) {
        result := ComCall(6, this, "int", lVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plRetVal 
     * @returns {HRESULT} 
     */
    get_PayloadOffset(plRetVal) {
        plRetValMarshal := plRetVal is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, plRetValMarshal, plRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lRetVal 
     * @returns {HRESULT} 
     */
    put_PayloadOffset(lRetVal) {
        result := ComCall(8, this, "int", lRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plFlags 
     * @returns {HRESULT} 
     */
    get_Flags(plFlags) {
        plFlagsMarshal := plFlags is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, plFlagsMarshal, plFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     */
    put_Flags(lFlags) {
        result := ComCall(10, this, "int", lFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapitransportstreambuffer-get_context
     */
    get_Context(ppContext) {
        result := ComCall(11, this, "ptr*", ppContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapitransportstreambuffer-put_context
     */
    put_Context(pContext) {
        result := ComCall(12, this, "ptr", pContext, "HRESULT")
        return result
    }
}
