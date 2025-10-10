#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * This structure is used by the OperationStart function.
 * @see https://docs.microsoft.com/windows/win32/api//winbase/ns-winbase-operation_start_parameters
 * @namespace Windows.Win32.Storage.OperationRecorder
 * @version v4.0.30319
 */
class OPERATION_START_PARAMETERS extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * This parameter should be initialized to the  <b>OPERATION_API_VERSION</b> value defined in the Windows SDK. 
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
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Each operation has an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/oprec/operation-id">OPERATION_ID</a> namespace that is unique for each process. If two applications both use the same <b>OPERATION_ID</b> value to identify two operations, the system maintains separate contexts for each operation.
     * @type {Integer}
     */
    OperationId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * 
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
