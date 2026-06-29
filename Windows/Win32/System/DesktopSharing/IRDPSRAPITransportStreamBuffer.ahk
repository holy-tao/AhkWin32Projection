#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Created and used by the IRDPSRAPITransportStream interface for sending and receiving data.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nn-rdpencomapi-irdpsrapitransportstreambuffer
 * @namespace Windows.Win32.System.DesktopSharing
 */
export default struct IRDPSRAPITransportStreamBuffer extends IUnknown {
    /**
     * The interface identifier for IRDPSRAPITransportStreamBuffer
     * @type {Guid}
     */
    static IID := Guid("{81c80290-5085-44b0-b460-f865c39cb4a9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRDPSRAPITransportStreamBuffer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_Storage       : IntPtr
        get_StorageSize   : IntPtr
        get_PayloadSize   : IntPtr
        put_PayloadSize   : IntPtr
        get_PayloadOffset : IntPtr
        put_PayloadOffset : IntPtr
        get_Flags         : IntPtr
        put_Flags         : IntPtr
        get_Context       : IntPtr
        put_Context       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRDPSRAPITransportStreamBuffer.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * This property is reserved for use by the Remote Desktop Protocol (RDP) stack. Do not modify it. (Get)
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapitransportstreambuffer-get_context
     */
    get_Context() {
        result := ComCall(11, this, "ptr*", &ppContext := 0, "HRESULT")
        return IUnknown(ppContext)
    }

    /**
     * This property is reserved for use by the Remote Desktop Protocol (RDP) stack. Do not modify it. (Put)
     * @param {IUnknown} pContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapitransportstreambuffer-put_context
     */
    put_Context(pContext) {
        result := ComCall(12, this, "ptr", pContext, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRDPSRAPITransportStreamBuffer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Storage := CallbackCreate(GetMethod(implObj, "get_Storage"), flags, 2)
        this.vtbl.get_StorageSize := CallbackCreate(GetMethod(implObj, "get_StorageSize"), flags, 2)
        this.vtbl.get_PayloadSize := CallbackCreate(GetMethod(implObj, "get_PayloadSize"), flags, 2)
        this.vtbl.put_PayloadSize := CallbackCreate(GetMethod(implObj, "put_PayloadSize"), flags, 2)
        this.vtbl.get_PayloadOffset := CallbackCreate(GetMethod(implObj, "get_PayloadOffset"), flags, 2)
        this.vtbl.put_PayloadOffset := CallbackCreate(GetMethod(implObj, "put_PayloadOffset"), flags, 2)
        this.vtbl.get_Flags := CallbackCreate(GetMethod(implObj, "get_Flags"), flags, 2)
        this.vtbl.put_Flags := CallbackCreate(GetMethod(implObj, "put_Flags"), flags, 2)
        this.vtbl.get_Context := CallbackCreate(GetMethod(implObj, "get_Context"), flags, 2)
        this.vtbl.put_Context := CallbackCreate(GetMethod(implObj, "put_Context"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Storage)
        CallbackFree(this.vtbl.get_StorageSize)
        CallbackFree(this.vtbl.get_PayloadSize)
        CallbackFree(this.vtbl.put_PayloadSize)
        CallbackFree(this.vtbl.get_PayloadOffset)
        CallbackFree(this.vtbl.put_PayloadOffset)
        CallbackFree(this.vtbl.get_Flags)
        CallbackFree(this.vtbl.put_Flags)
        CallbackFree(this.vtbl.get_Context)
        CallbackFree(this.vtbl.put_Context)
    }
}
