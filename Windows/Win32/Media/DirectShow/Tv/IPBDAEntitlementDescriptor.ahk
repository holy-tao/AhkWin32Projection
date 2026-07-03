#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Implements methods that retrieve data from the entitlement descriptor in a Protected Broadcast Driver Architecture (PBDA) transport stream.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-ipbdaentitlementdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IPBDAEntitlementDescriptor extends IUnknown {
    /**
     * The interface identifier for IPBDAEntitlementDescriptor
     * @type {Guid}
     */
    static IID := Guid("{22632497-0de3-4587-aadc-d8d99017e760}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPBDAEntitlementDescriptor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTag    : IntPtr
        GetLength : IntPtr
        GetToken  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPBDAEntitlementDescriptor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the tag that uniquely identifies an entitlement descriptor in a Protected Broadcast Driver Architecture (PBDA) transport stream.
     * @returns {Integer} Receives the tag value. For PBDA entitlement descriptors, this value is 0x80.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbdaentitlementdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the length of the entitlement descriptor in a Protected Broadcast Driver Architecture (PBDA) transport stream, in bytes.
     * @returns {Integer} Receives the descriptor length.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbdaentitlementdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the entitlement token from the entitlement descriptor in a Protected Broadcast Driver Architecture (PBDA) transport stream.
     * @param {Pointer<Pointer<Integer>>} ppbTokenBuffer Pointer to a buffer that receives the entitlement token. The caller must free this memory after use.
     * @param {Pointer<Integer>} pdwTokenLength Receives the entitlement token length.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbdaentitlementdescriptor-gettoken
     */
    GetToken(ppbTokenBuffer, pdwTokenLength) {
        ppbTokenBufferMarshal := ppbTokenBuffer is VarRef ? "ptr*" : "ptr"
        pdwTokenLengthMarshal := pdwTokenLength is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, ppbTokenBufferMarshal, ppbTokenBuffer, pdwTokenLengthMarshal, pdwTokenLength, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPBDAEntitlementDescriptor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTag := CallbackCreate(GetMethod(implObj, "GetTag"), flags, 2)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 2)
        this.vtbl.GetToken := CallbackCreate(GetMethod(implObj, "GetToken"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTag)
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.GetToken)
    }
}
