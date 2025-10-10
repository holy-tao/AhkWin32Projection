#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains partition information pulled from an ETW trace.
 * @see https://docs.microsoft.com/windows/win32/api//evntrace/ns-evntrace-etw_trace_partition_information
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class ETW_TRACE_PARTITION_INFORMATION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * GUID to identify the machine.
     * @type {Pointer<Guid>}
     */
    PartitionId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * GUID that identifies the partition instance that contains the traced partition. If the traced partition is a host, then <b>ParentId</b> will be 0.
     * @type {Pointer<Guid>}
     */
    ParentId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    QpcOffsetFromRoot {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * Enumeration value of the container type. the value may be one of the following:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Process"></a><a id="process"></a><a id="PROCESS"></a><dl>
     * <dt><b>Process</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * For events originating from inside a “Windows Server Container”.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VmHost"></a><a id="vmhost"></a><a id="VMHOST"></a><dl>
     * <dt><b>VmHost</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * For events originating from inside a “Hyper-V Container”.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VmHostedUvm"></a><a id="vmhosteduvm"></a><a id="VMHOSTEDUVM"></a><dl>
     * <dt><b>VmHostedUvm</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * For events originating from a “Hyper-V Container” template virtual machine.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VmDirectUvm"></a><a id="vmdirectuvm"></a><a id="VMDIRECTUVM"></a><dl>
     * <dt><b>VmDirectUvm</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * For events originating from applications running with  <a href="https://docs.microsoft.com/windows/desktop/winmsg/windows">Windows Defender Application Guard</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    PartitionType {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
