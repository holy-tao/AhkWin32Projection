#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Integer} level 
     * @param {Pointer<IRdcGeneratorParameters>} iGeneratorParameters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcgenerator-getgeneratorparameters
     */
    GetGeneratorParameters(level, iGeneratorParameters) {
        result := ComCall(3, this, "uint", level, "ptr*", iGeneratorParameters, "HRESULT")
        return result
    }

    /**
     * Performs ink recognition synchronously.
     * @param {BOOL} endOfInput 
     * @param {Pointer<BOOL>} endOfOutput 
     * @param {Pointer<RdcBufferPointer>} inputBuffer 
     * @param {Integer} depth 
     * @param {Pointer<Pointer<RdcBufferPointer>>} outputBuffers 
     * @param {Pointer<Integer>} rdc_ErrorCode 
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function did not process the ink because the ink has been fully processed, or the <a href="/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-endinkinput">EndInkInput</a> function has not been called and the recognizer does not support incremental processing of ink.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TPC_S_INTERRUPTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The process was interrupted by a call to the <a href="/windows/desktop/api/recapis/nf-recapis-adviseinkchange">AdviseInkChange</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is an invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid argument was received.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//recapis/nf-recapis-process
     */
    Process(endOfInput, endOfOutput, inputBuffer, depth, outputBuffers, rdc_ErrorCode) {
        rdc_ErrorCodeMarshal := rdc_ErrorCode is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "int", endOfInput, "ptr", endOfOutput, "ptr", inputBuffer, "uint", depth, "ptr*", outputBuffers, rdc_ErrorCodeMarshal, rdc_ErrorCode, "HRESULT")
        return result
    }
}
