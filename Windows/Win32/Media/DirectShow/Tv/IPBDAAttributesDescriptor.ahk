#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Implements methods that get data from anattributes descriptor in a Protected Broadcast Device Architecture (PBDA) transport stream.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-ipbdaattributesdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IPBDAAttributesDescriptor extends IUnknown {
    /**
     * The interface identifier for IPBDAAttributesDescriptor
     * @type {Guid}
     */
    static IID := Guid("{313b3620-3263-45a6-9533-968befbeac03}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPBDAAttributesDescriptor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTag              : IntPtr
        GetLength           : IntPtr
        GetAttributePayload : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPBDAAttributesDescriptor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the tag that uniquely identifies an attributes descriptor in a Protected Broadcast Driver Architecture (PBDA) transport stream.
     * @returns {Integer} Gets the tag value. For PBDA attributes descriptors, this value is 0x81.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbdaattributesdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the length of a Protected Broadcast Driver Architecture (PBDA) attributes descriptor from a Protected Broadcast Device Architecture (PBDA) transport stream, in bytes.
     * @returns {Integer} Receives the descriptor length.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbdaattributesdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the descriptor body from an attributes descriptor in a Protected Broadcast Device Architecture (PBDA) transport stream.
     * @param {Pointer<Pointer<Integer>>} ppbAttributeBuffer Pointer to a buffer that receives the descriptor body. The caller must free this memory after use.
     * @param {Pointer<Integer>} pdwAttributeLength Receives the descriptor body length.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbdaattributesdescriptor-getattributepayload
     */
    GetAttributePayload(ppbAttributeBuffer, pdwAttributeLength) {
        ppbAttributeBufferMarshal := ppbAttributeBuffer is VarRef ? "ptr*" : "ptr"
        pdwAttributeLengthMarshal := pdwAttributeLength is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, ppbAttributeBufferMarshal, ppbAttributeBuffer, pdwAttributeLengthMarshal, pdwAttributeLength, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPBDAAttributesDescriptor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTag := CallbackCreate(GetMethod(implObj, "GetTag"), flags, 2)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 2)
        this.vtbl.GetAttributePayload := CallbackCreate(GetMethod(implObj, "GetAttributePayload"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTag)
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.GetAttributePayload)
    }
}
