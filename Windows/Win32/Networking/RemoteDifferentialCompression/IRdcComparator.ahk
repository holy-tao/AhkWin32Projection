#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\RdcBufferPointer.ahk" { RdcBufferPointer }
#Import ".\RDC_ErrorCode.ahk" { RDC_ErrorCode }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\RdcNeedPointer.ahk" { RdcNeedPointer }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Used to compare two signature streams (seed and source) and produce the list of source and seed file data chunks needed to create the target file.
 * @see https://learn.microsoft.com/windows/win32/api/msrdc/nn-msrdc-irdccomparator
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 */
export default struct IRdcComparator extends IUnknown {
    /**
     * The interface identifier for IRdcComparator
     * @type {Guid}
     */
    static IID := Guid("{96236a77-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The class identifier for RdcComparator
     * @type {Guid}
     */
    static CLSID := Guid("{96236a8b-9dbc-11da-9e3f-0011114ae311}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRdcComparator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Process : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRdcComparator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Compares two signature streams (seed and source) and produces a needs list, which describes the chunks of file data needed to create the target file.
     * @remarks
     * On successful return, iterate through each <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-rdcneed">RdcNeed</a> structure 
     *    returned in the array pointed to by the <b>m_Data</b> member of the 
     *    <i>outputBuffer</i> parameter, and copy the specified chunk of the source or seed data to the 
     *    target data.
     * @param {BOOL} endOfInput Set to <b>TRUE</b> if the <i>inputBuffer</i> parameter contains all 
     *       remaining input.
     * @param {Pointer<BOOL>} endOfOutput Address of a <b>BOOL</b> that on successful completion is set to 
     *       <b>TRUE</b> if all output data has been generated.
     * @param {Pointer<RdcBufferPointer>} inputBuffer Address of a <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-rdcbufferpointer">RdcBufferPointer</a> structure containing 
     *       information about the input buffer. The <b>m_Used</b> member of this structure is used to 
     *       indicate how much input, if any, was processed during this call.
     * @param {Pointer<RdcNeedPointer>} outputBuffer Address of a <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-rdcneedpointer">RdcNeedPointer</a> structure containing 
     *       information about the output buffer. On input the <b>m_Size</b> member of this structure 
     *       must contain the number of <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-rdcneed">RdcNeed</a> structures in the array 
     *       pointed to by the <b>m_Data</b> member, and the <b>m_Used</b> member 
     *       must be zero. On output the <b>m_Used</b> member will contain the number of 
     *       <b>RdcNeed</b> structures in the array pointed to by the 
     *       <b>m_Data</b> member.
     * @param {Pointer<RDC_ErrorCode>} _rdc_ErrorCode The address of a <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ne-msrdc-rdc_errorcode">RDC_ErrorCode</a> enumeration that is 
     *       filled with an RDC specific error code if the return value from the 
     *       <b>Process</b> method is 
     *       <b>E_FAIL</b>. If this value is <b>RDC_Win32ErrorCode</b>, then the 
     *       return value of the <b>Process</b> method contains the 
     *       specific error code.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdccomparator-process
     */
    Process(endOfInput, endOfOutput, inputBuffer, outputBuffer, _rdc_ErrorCode) {
        endOfOutputMarshal := endOfOutput is VarRef ? "int*" : "ptr"
        _rdc_ErrorCodeMarshal := _rdc_ErrorCode is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, BOOL, endOfInput, endOfOutputMarshal, endOfOutput, RdcBufferPointer.Ptr, inputBuffer, RdcNeedPointer.Ptr, outputBuffer, _rdc_ErrorCodeMarshal, _rdc_ErrorCode, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRdcComparator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Process := CallbackCreate(GetMethod(implObj, "Process"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Process)
    }
}
