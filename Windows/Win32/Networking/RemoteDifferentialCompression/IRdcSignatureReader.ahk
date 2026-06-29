#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\RdcSignaturePointer.ahk" { RdcSignaturePointer }
#Import ".\RDC_ErrorCode.ahk" { RDC_ErrorCode }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Reads the signatures and the parameters used to generate the signatures.
 * @see https://learn.microsoft.com/windows/win32/api/msrdc/nn-msrdc-irdcsignaturereader
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 */
export default struct IRdcSignatureReader extends IUnknown {
    /**
     * The interface identifier for IRdcSignatureReader
     * @type {Guid}
     */
    static IID := Guid("{96236a76-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The class identifier for RdcSignatureReader
     * @type {Guid}
     */
    static CLSID := Guid("{96236a8a-9dbc-11da-9e3f-0011114ae311}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRdcSignatureReader interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ReadHeader     : IntPtr
        ReadSignatures : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRdcSignatureReader.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Reads the signature header and returns a copy of the parameters used to generate the signatures.
     * @returns {RDC_ErrorCode} Address of a <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ne-msrdc-rdc_errorcode">RDC_ErrorCode</a> enumeration that will 
     *       receive any RDC-specific error code.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcsignaturereader-readheader
     */
    ReadHeader() {
        result := ComCall(3, this, "int*", &_rdc_ErrorCode := 0, "HRESULT")
        return _rdc_ErrorCode
    }

    /**
     * Reads a block of signatures from the current position.
     * @param {Pointer<RdcSignaturePointer>} _rdcSignaturePointer Address of a <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-rdcsignaturepointer">RdcSignaturePointer</a> structure. On 
     *       input the <b>m_Size</b> member of this structure must contain the number of 
     *       <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-rdcsignature">RdcSignature</a> structures in the array pointed to by the 
     *       <b>m_Data</b> member, and the <b>m_Used</b> member must be zero. On 
     *       output the <b>m_Used</b> member will contain the number of 
     *       <b>RdcSignature</b> structures in the array pointed to by the 
     *       <b>m_Data</b> member.
     * @returns {BOOL} Address of a <b>BOOL</b> that is set to <b>TRUE</b> if the end of 
     *       the signatures has been read.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcsignaturereader-readsignatures
     */
    ReadSignatures(_rdcSignaturePointer) {
        result := ComCall(4, this, RdcSignaturePointer.Ptr, _rdcSignaturePointer, BOOL.Ptr, &endOfOutput := 0, "HRESULT")
        return endOfOutput
    }

    Query(iid) {
        if (IRdcSignatureReader.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ReadHeader := CallbackCreate(GetMethod(implObj, "ReadHeader"), flags, 2)
        this.vtbl.ReadSignatures := CallbackCreate(GetMethod(implObj, "ReadSignatures"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ReadHeader)
        CallbackFree(this.vtbl.ReadSignatures)
    }
}
