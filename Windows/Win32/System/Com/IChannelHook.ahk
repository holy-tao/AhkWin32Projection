#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct IChannelHook extends IUnknown {
    /**
     * The interface identifier for IChannelHook
     * @type {Guid}
     */
    static IID := Guid("{1008c4a0-7613-11cf-9af1-0020af6e72f4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IChannelHook interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ClientGetSize    : IntPtr
        ClientFillBuffer : IntPtr
        ClientNotify     : IntPtr
        ServerNotify     : IntPtr
        ServerGetSize    : IntPtr
        ServerFillBuffer : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IChannelHook.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Guid>} uExtent 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Integer>} pDataSize 
     * @returns {String} Nothing - always returns an empty string
     */
    ClientGetSize(uExtent, riid, pDataSize) {
        pDataSizeMarshal := pDataSize is VarRef ? "uint*" : "ptr"

        ComCall(3, this, Guid.Ptr, uExtent, Guid.Ptr, riid, pDataSizeMarshal, pDataSize)
    }

    /**
     * 
     * @param {Pointer<Guid>} uExtent 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Integer>} pDataSize 
     * @param {Pointer<Void>} pDataBuffer 
     * @returns {String} Nothing - always returns an empty string
     */
    ClientFillBuffer(uExtent, riid, pDataSize, pDataBuffer) {
        pDataSizeMarshal := pDataSize is VarRef ? "uint*" : "ptr"
        pDataBufferMarshal := pDataBuffer is VarRef ? "ptr" : "ptr"

        ComCall(4, this, Guid.Ptr, uExtent, Guid.Ptr, riid, pDataSizeMarshal, pDataSize, pDataBufferMarshal, pDataBuffer)
    }

    /**
     * 
     * @param {Pointer<Guid>} uExtent 
     * @param {Pointer<Guid>} riid 
     * @param {Integer} cbDataSize 
     * @param {Pointer<Void>} pDataBuffer 
     * @param {Integer} lDataRep 
     * @param {HRESULT} hrFault 
     * @returns {String} Nothing - always returns an empty string
     */
    ClientNotify(uExtent, riid, cbDataSize, pDataBuffer, lDataRep, hrFault) {
        pDataBufferMarshal := pDataBuffer is VarRef ? "ptr" : "ptr"

        ComCall(5, this, Guid.Ptr, uExtent, Guid.Ptr, riid, "uint", cbDataSize, pDataBufferMarshal, pDataBuffer, "uint", lDataRep, "int", hrFault)
    }

    /**
     * 
     * @param {Pointer<Guid>} uExtent 
     * @param {Pointer<Guid>} riid 
     * @param {Integer} cbDataSize 
     * @param {Pointer<Void>} pDataBuffer 
     * @param {Integer} lDataRep 
     * @returns {String} Nothing - always returns an empty string
     */
    ServerNotify(uExtent, riid, cbDataSize, pDataBuffer, lDataRep) {
        pDataBufferMarshal := pDataBuffer is VarRef ? "ptr" : "ptr"

        ComCall(6, this, Guid.Ptr, uExtent, Guid.Ptr, riid, "uint", cbDataSize, pDataBufferMarshal, pDataBuffer, "uint", lDataRep)
    }

    /**
     * 
     * @param {Pointer<Guid>} uExtent 
     * @param {Pointer<Guid>} riid 
     * @param {HRESULT} hrFault 
     * @param {Pointer<Integer>} pDataSize 
     * @returns {String} Nothing - always returns an empty string
     */
    ServerGetSize(uExtent, riid, hrFault, pDataSize) {
        pDataSizeMarshal := pDataSize is VarRef ? "uint*" : "ptr"

        ComCall(7, this, Guid.Ptr, uExtent, Guid.Ptr, riid, "int", hrFault, pDataSizeMarshal, pDataSize)
    }

    /**
     * 
     * @param {Pointer<Guid>} uExtent 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Integer>} pDataSize 
     * @param {Pointer<Void>} pDataBuffer 
     * @param {HRESULT} hrFault 
     * @returns {String} Nothing - always returns an empty string
     */
    ServerFillBuffer(uExtent, riid, pDataSize, pDataBuffer, hrFault) {
        pDataSizeMarshal := pDataSize is VarRef ? "uint*" : "ptr"
        pDataBufferMarshal := pDataBuffer is VarRef ? "ptr" : "ptr"

        ComCall(8, this, Guid.Ptr, uExtent, Guid.Ptr, riid, pDataSizeMarshal, pDataSize, pDataBufferMarshal, pDataBuffer, "int", hrFault)
    }

    Query(iid) {
        if (IChannelHook.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ClientGetSize := CallbackCreate(GetMethod(implObj, "ClientGetSize"), flags, 4)
        this.vtbl.ClientFillBuffer := CallbackCreate(GetMethod(implObj, "ClientFillBuffer"), flags, 5)
        this.vtbl.ClientNotify := CallbackCreate(GetMethod(implObj, "ClientNotify"), flags, 7)
        this.vtbl.ServerNotify := CallbackCreate(GetMethod(implObj, "ServerNotify"), flags, 6)
        this.vtbl.ServerGetSize := CallbackCreate(GetMethod(implObj, "ServerGetSize"), flags, 5)
        this.vtbl.ServerFillBuffer := CallbackCreate(GetMethod(implObj, "ServerFillBuffer"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ClientGetSize)
        CallbackFree(this.vtbl.ClientFillBuffer)
        CallbackFree(this.vtbl.ClientNotify)
        CallbackFree(this.vtbl.ServerNotify)
        CallbackFree(this.vtbl.ServerGetSize)
        CallbackFree(this.vtbl.ServerFillBuffer)
    }
}
