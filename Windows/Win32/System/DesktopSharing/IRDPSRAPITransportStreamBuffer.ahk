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
     * @type {Pointer<Integer>} 
     */
    Storage {
        get => this.get_Storage()
    }

    /**
     * @type {Integer} 
     */
    StorageSize {
        get => this.get_StorageSize()
    }

    /**
     * @type {Integer} 
     */
    PayloadSize {
        get => this.get_PayloadSize()
        set => this.put_PayloadSize(value)
    }

    /**
     * @type {Integer} 
     */
    PayloadOffset {
        get => this.get_PayloadOffset()
        set => this.put_PayloadOffset(value)
    }

    /**
     * @type {Integer} 
     */
    Flags {
        get => this.get_Flags()
        set => this.put_Flags(value)
    }

    /**
     * @type {IUnknown} 
     */
    Context {
        get => this.get_Context()
        set => this.put_Context(value)
    }

    /**
     * 
     * @returns {Pointer<Integer>} 
     */
    get_Storage() {
        result := ComCall(3, this, "ptr*", &ppbStorage := 0, "HRESULT")
        return ppbStorage
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StorageSize() {
        result := ComCall(4, this, "int*", &plMaxStore := 0, "HRESULT")
        return plMaxStore
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PayloadSize() {
        result := ComCall(5, this, "int*", &plRetVal := 0, "HRESULT")
        return plRetVal
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
     * @returns {Integer} 
     */
    get_PayloadOffset() {
        result := ComCall(7, this, "int*", &plRetVal := 0, "HRESULT")
        return plRetVal
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
     * @returns {Integer} 
     */
    get_Flags() {
        result := ComCall(9, this, "int*", &plFlags := 0, "HRESULT")
        return plFlags
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
     * This property is reserved for use by the Remote Desktop Protocol (RDP) stack. Do not modify it.
     * @returns {IUnknown} 
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapitransportstreambuffer-get_context
     */
    get_Context() {
        result := ComCall(11, this, "ptr*", &ppContext := 0, "HRESULT")
        return IUnknown(ppContext)
    }

    /**
     * This property is reserved for use by the Remote Desktop Protocol (RDP) stack. Do not modify it.
     * @param {IUnknown} pContext 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapitransportstreambuffer-put_context
     */
    put_Context(pContext) {
        result := ComCall(12, this, "ptr", pContext, "HRESULT")
        return result
    }
}
