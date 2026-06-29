#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\RdcBufferPointer.ahk" { RdcBufferPointer }
#Import ".\RDC_ErrorCode.ahk" { RDC_ErrorCode }
#Import ".\IRdcGeneratorParameters.ahk" { IRdcGeneratorParameters }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Used to process the input data and read the parameters used by the generator.
 * @see https://learn.microsoft.com/windows/win32/api/msrdc/nn-msrdc-irdcgenerator
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 */
export default struct IRdcGenerator extends IUnknown {
    /**
     * The interface identifier for IRdcGenerator
     * @type {Guid}
     */
    static IID := Guid("{96236a73-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The class identifier for RdcGenerator
     * @type {Guid}
     */
    static CLSID := Guid("{96236a88-9dbc-11da-9e3f-0011114ae311}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRdcGenerator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetGeneratorParameters : IntPtr
        Process                : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRdcGenerator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns a copy of the parameters used to create the generator.
     * @param {Integer} level The generator level for the parameters to be returned. The range is 
     *       <b>MSRDC_MINIMUM_DEPTH</b> to <b>MSRDC_MAXIMUM_DEPTH</b>.
     * @returns {IRdcGeneratorParameters} Address of a pointer that on successful return will contain the 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nn-msrdc-irdcgeneratorparameters">IRdcGeneratorParameters</a> interface pointer for the 
     *       parameters for the generator level specified in the <i>level</i> parameter.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcgenerator-getgeneratorparameters
     */
    GetGeneratorParameters(level) {
        result := ComCall(3, this, "uint", level, "ptr*", &iGeneratorParameters := 0, "HRESULT")
        return IRdcGeneratorParameters(iGeneratorParameters)
    }

    /**
     * Processes the input data and produces 0 or more output bytes.
     * @param {BOOL} endOfInput Set to <b>TRUE</b> when the input buffer pointed to by the 
     *       <i>inputBuffer</i> parameter contains the remaining input available.
     * @param {Pointer<BOOL>} endOfOutput Address of a <b>BOOL</b> that is set to <b>TRUE</b> when the 
     *       processing is complete for all data.
     * @param {Pointer<RdcBufferPointer>} inputBuffer Address of an <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-rdcbufferpointer">RdcBufferPointer</a> structure that 
     *       contains the input buffer. On successful return, the <b>m_Used</b> member of this structure 
     *       will be filled with the number of bytes by this call.
     * @param {Integer} depth The number of levels of signatures to generate. This must match the number of levels specified when the 
     *       generator was created.
     * @param {Pointer<Pointer<RdcBufferPointer>>} outputBuffers The address of an array of <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-rdcbufferpointer">RdcBufferPointer</a> structures that 
     *       will receive the output buffers. The <b>m_Used</b> member of these structures will be filled with the number of bytes returned in the buffer.
     * @param {Pointer<RDC_ErrorCode>} _rdc_ErrorCode The address of an <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ne-msrdc-rdc_errorcode">RDC_ErrorCode</a> enumeration that is 
     *       filled with an RDC specific error code if the return value from the 
     *       <b>Process</b> method is 
     *       <b>E_FAIL</b>. If this value is <b>RDC_Win32ErrorCode</b>, then the 
     *       return value of the <b>Process</b> method contains the 
     *       specific error code.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcgenerator-process
     */
    Process(endOfInput, endOfOutput, inputBuffer, depth, outputBuffers, _rdc_ErrorCode) {
        endOfOutputMarshal := endOfOutput is VarRef ? "int*" : "ptr"
        outputBuffersMarshal := outputBuffers is VarRef ? "ptr*" : "ptr"
        _rdc_ErrorCodeMarshal := _rdc_ErrorCode is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, BOOL, endOfInput, endOfOutputMarshal, endOfOutput, RdcBufferPointer.Ptr, inputBuffer, "uint", depth, outputBuffersMarshal, outputBuffers, _rdc_ErrorCodeMarshal, _rdc_ErrorCode, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRdcGenerator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetGeneratorParameters := CallbackCreate(GetMethod(implObj, "GetGeneratorParameters"), flags, 3)
        this.vtbl.Process := CallbackCreate(GetMethod(implObj, "Process"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetGeneratorParameters)
        CallbackFree(this.vtbl.Process)
    }
}
