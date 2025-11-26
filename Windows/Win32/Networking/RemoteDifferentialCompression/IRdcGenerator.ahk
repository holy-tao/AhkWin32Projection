#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRdcGeneratorParameters.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Used to process the input data and read the parameters used by the generator.
 * @see https://docs.microsoft.com/windows/win32/api//msrdc/nn-msrdc-irdcgenerator
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 * @version v4.0.30319
 */
class IRdcGenerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRdcGenerator
     * @type {Guid}
     */
    static IID => Guid("{96236a73-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The class identifier for RdcGenerator
     * @type {Guid}
     */
    static CLSID => Guid("{96236a88-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetGeneratorParameters", "Process"]

    /**
     * Returns a copy of the parameters used to create the generator.
     * @param {Integer} level The generator level for the parameters to be returned. The range is 
     *       <b>MSRDC_MINIMUM_DEPTH</b> to <b>MSRDC_MAXIMUM_DEPTH</b>.
     * @returns {IRdcGeneratorParameters} Address of a pointer that on successful return will contain the 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nn-msrdc-irdcgeneratorparameters">IRdcGeneratorParameters</a> interface pointer for the 
     *       parameters for the generator level specified in the <i>level</i> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-irdcgenerator-getgeneratorparameters
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
     * @param {Pointer<Integer>} rdc_ErrorCode The address of an <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ne-msrdc-rdc_errorcode">RDC_ErrorCode</a> enumeration that is 
     *       filled with an RDC specific error code if the return value from the 
     *       <b>Process</b> method is 
     *       <b>E_FAIL</b>. If this value is <b>RDC_Win32ErrorCode</b>, then the 
     *       return value of the <b>Process</b> method contains the 
     *       specific error code.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-irdcgenerator-process
     */
    Process(endOfInput, endOfOutput, inputBuffer, depth, outputBuffers, rdc_ErrorCode) {
        endOfOutputMarshal := endOfOutput is VarRef ? "int*" : "ptr"
        outputBuffersMarshal := outputBuffers is VarRef ? "ptr*" : "ptr"
        rdc_ErrorCodeMarshal := rdc_ErrorCode is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "int", endOfInput, endOfOutputMarshal, endOfOutput, "ptr", inputBuffer, "uint", depth, outputBuffersMarshal, outputBuffers, rdc_ErrorCodeMarshal, rdc_ErrorCode, "HRESULT")
        return result
    }
}
