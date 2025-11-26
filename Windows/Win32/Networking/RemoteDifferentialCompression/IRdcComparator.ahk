#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Used to compare two signature streams (seed and source) and produce the list of source and seed file data chunks needed to create the target file.
 * @see https://docs.microsoft.com/windows/win32/api//msrdc/nn-msrdc-irdccomparator
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 * @version v4.0.30319
 */
class IRdcComparator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRdcComparator
     * @type {Guid}
     */
    static IID => Guid("{96236a77-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The class identifier for RdcComparator
     * @type {Guid}
     */
    static CLSID => Guid("{96236a8b-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Process"]

    /**
     * Compares two signature streams (seed and source) and produces a needs list, which describes the chunks of file data needed to create the target file.
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
     * @param {Pointer<Integer>} rdc_ErrorCode The address of a <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ne-msrdc-rdc_errorcode">RDC_ErrorCode</a> enumeration that is 
     *       filled with an RDC specific error code if the return value from the 
     *       <b>Process</b> method is 
     *       <b>E_FAIL</b>. If this value is <b>RDC_Win32ErrorCode</b>, then the 
     *       return value of the <b>Process</b> method contains the 
     *       specific error code.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-irdccomparator-process
     */
    Process(endOfInput, endOfOutput, inputBuffer, outputBuffer, rdc_ErrorCode) {
        endOfOutputMarshal := endOfOutput is VarRef ? "int*" : "ptr"
        rdc_ErrorCodeMarshal := rdc_ErrorCode is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "int", endOfInput, endOfOutputMarshal, endOfOutput, "ptr", inputBuffer, "ptr", outputBuffer, rdc_ErrorCodeMarshal, rdc_ErrorCode, "HRESULT")
        return result
    }
}
