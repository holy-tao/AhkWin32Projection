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
     * 
     * @param {Pointer<Byte>} ppbStorage 
     * @returns {HRESULT} 
     */
    get_Storage(ppbStorage) {
        result := ComCall(3, this, "char*", ppbStorage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plMaxStore 
     * @returns {HRESULT} 
     */
    get_StorageSize(plMaxStore) {
        result := ComCall(4, this, "int*", plMaxStore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plRetVal 
     * @returns {HRESULT} 
     */
    get_PayloadSize(plRetVal) {
        result := ComCall(5, this, "int*", plRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lVal 
     * @returns {HRESULT} 
     */
    put_PayloadSize(lVal) {
        result := ComCall(6, this, "int", lVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plRetVal 
     * @returns {HRESULT} 
     */
    get_PayloadOffset(plRetVal) {
        result := ComCall(7, this, "int*", plRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lRetVal 
     * @returns {HRESULT} 
     */
    put_PayloadOffset(lRetVal) {
        result := ComCall(8, this, "int", lRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plFlags 
     * @returns {HRESULT} 
     */
    get_Flags(plFlags) {
        result := ComCall(9, this, "int*", plFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     */
    put_Flags(lFlags) {
        result := ComCall(10, this, "int", lFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppContext 
     * @returns {HRESULT} 
     */
    get_Context(ppContext) {
        result := ComCall(11, this, "ptr", ppContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pContext 
     * @returns {HRESULT} 
     */
    put_Context(pContext) {
        result := ComCall(12, this, "ptr", pContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
