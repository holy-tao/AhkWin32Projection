#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\OPERATION_END_PARAMETERS_FLAGS.ahk" { OPERATION_END_PARAMETERS_FLAGS }

/**
 * This structure is used by the OperationEnd function.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-operation_end_parameters
 * @namespace Windows.Win32.Storage.OperationRecorder
 */
export default struct OPERATION_END_PARAMETERS {
    #StructPack 4

    /**
     * This parameter should be initialized to the  <b>OPERATION_API_VERSION</b> defined in the Windows SDK. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OPERATION_API_VERSION"></a><a id="operation_api_version"></a><dl>
     * <dt><b>OPERATION_API_VERSION</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This API was introduced in Windows 8 and Windows Server 2012 as version 1.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Version : UInt32

    /**
     * Each operation has an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/oprec/operation-id">OPERATION_ID</a> namespace that is unique for each process. If two applications both use the same <b>OPERATION_ID</b> value to identify two operations, the system maintains separate contexts for each operation.
     */
    OperationId : UInt32

    Flags : OPERATION_END_PARAMETERS_FLAGS

}
