#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMSMQApplication2.ahk" { IMSMQApplication2 }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct IMSMQApplication3 extends IMSMQApplication2 {
    /**
     * The interface identifier for IMSMQApplication3
     * @type {Guid}
     */
    static IID := Guid("{eba96b1f-2168-11d3-898c-00e02c074f6b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSMQApplication3 interfaces
    */
    struct Vtbl extends IMSMQApplication2.Vtbl {
        get_ActiveQueues           : IntPtr
        get_PrivateQueues          : IntPtr
        get_DirectoryServiceServer : IntPtr
        get_IsConnected            : IntPtr
        get_BytesInAllQueues       : IntPtr
        put_Machine                : IntPtr
        get_Machine                : IntPtr
        Connect                    : IntPtr
        Disconnect                 : IntPtr
        Tidy                       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSMQApplication3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    ActiveQueues {
        get => this.get_ActiveQueues()
    }

    /**
     * @type {VARIANT} 
     */
    PrivateQueues {
        get => this.get_PrivateQueues()
    }

    /**
     * @type {BSTR} 
     */
    DirectoryServiceServer {
        get => this.get_DirectoryServiceServer()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsConnected {
        get => this.get_IsConnected()
    }

    /**
     * @type {VARIANT} 
     */
    BytesInAllQueues {
        get => this.get_BytesInAllQueues()
    }

    /**
     * @type {BSTR} 
     */
    Machine {
        get => this.get_Machine()
        set => this.put_Machine(value)
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ActiveQueues() {
        pvActiveQueues := VARIANT()
        result := ComCall(15, this, VARIANT.Ptr, pvActiveQueues, "HRESULT")
        return pvActiveQueues
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_PrivateQueues() {
        pvPrivateQueues := VARIANT()
        result := ComCall(16, this, VARIANT.Ptr, pvPrivateQueues, "HRESULT")
        return pvPrivateQueues
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DirectoryServiceServer() {
        pbstrDirectoryServiceServer := BSTR.Owned()
        result := ComCall(17, this, BSTR.Ptr, pbstrDirectoryServiceServer, "HRESULT")
        return pbstrDirectoryServiceServer
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsConnected() {
        result := ComCall(18, this, VARIANT_BOOL.Ptr, &pfIsConnected := 0, "HRESULT")
        return pfIsConnected
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_BytesInAllQueues() {
        pvBytesInAllQueues := VARIANT()
        result := ComCall(19, this, VARIANT.Ptr, pvBytesInAllQueues, "HRESULT")
        return pvBytesInAllQueues
    }

    /**
     * 
     * @param {BSTR} bstrMachine 
     * @returns {HRESULT} 
     */
    put_Machine(bstrMachine) {
        bstrMachine := bstrMachine is String ? BSTR.Alloc(bstrMachine).Value : bstrMachine

        result := ComCall(20, this, BSTR, bstrMachine, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Machine() {
        pbstrMachine := BSTR.Owned()
        result := ComCall(21, this, BSTR.Ptr, pbstrMachine, "HRESULT")
        return pbstrMachine
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Connect() {
        result := ComCall(22, this, "HRESULT")
        return result
    }

    /**
     * The Disconnect event is reserved for future use.
     * @remarks
     * This event is reserved for future use.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WMP/axwmplib-axwindowsmediaplayer-disconnect
     */
    Disconnect() {
        result := ComCall(23, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Tidy() {
        result := ComCall(24, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSMQApplication3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ActiveQueues := CallbackCreate(GetMethod(implObj, "get_ActiveQueues"), flags, 2)
        this.vtbl.get_PrivateQueues := CallbackCreate(GetMethod(implObj, "get_PrivateQueues"), flags, 2)
        this.vtbl.get_DirectoryServiceServer := CallbackCreate(GetMethod(implObj, "get_DirectoryServiceServer"), flags, 2)
        this.vtbl.get_IsConnected := CallbackCreate(GetMethod(implObj, "get_IsConnected"), flags, 2)
        this.vtbl.get_BytesInAllQueues := CallbackCreate(GetMethod(implObj, "get_BytesInAllQueues"), flags, 2)
        this.vtbl.put_Machine := CallbackCreate(GetMethod(implObj, "put_Machine"), flags, 2)
        this.vtbl.get_Machine := CallbackCreate(GetMethod(implObj, "get_Machine"), flags, 2)
        this.vtbl.Connect := CallbackCreate(GetMethod(implObj, "Connect"), flags, 1)
        this.vtbl.Disconnect := CallbackCreate(GetMethod(implObj, "Disconnect"), flags, 1)
        this.vtbl.Tidy := CallbackCreate(GetMethod(implObj, "Tidy"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ActiveQueues)
        CallbackFree(this.vtbl.get_PrivateQueues)
        CallbackFree(this.vtbl.get_DirectoryServiceServer)
        CallbackFree(this.vtbl.get_IsConnected)
        CallbackFree(this.vtbl.get_BytesInAllQueues)
        CallbackFree(this.vtbl.put_Machine)
        CallbackFree(this.vtbl.get_Machine)
        CallbackFree(this.vtbl.Connect)
        CallbackFree(this.vtbl.Disconnect)
        CallbackFree(this.vtbl.Tidy)
    }
}
