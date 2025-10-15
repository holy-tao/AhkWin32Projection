#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains detailed information about the root cause of an incident.
 * @see https://docs.microsoft.com/windows/win32/api//ndattrib/ns-ndattrib-rootcauseinfo
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 * @version v4.0.30319
 */
class RootCauseInfo extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A string that describes the problem that caused the incident.
     * @type {PWSTR}
     */
    pwszDescription{
        get {
            if(!this.HasProp("__pwszDescription"))
                this.__pwszDescription := PWSTR(this.ptr + 0)
            return this.__pwszDescription
        }
    }

    /**
     * Type: <b>GUID</b>
     * 
     * The GUID that corresponds to the problem identified.
     * @type {Pointer<Guid>}
     */
    rootCauseID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * A numeric value that provides more information about the problem.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RCF_ISLEAF"></a><a id="rcf_isleaf"></a><dl>
     * <dt><b>RCF_ISLEAF</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The root cause corresponds to a leaf in the diagnostics tree. Root causes that are leafs are more likely to be closer to the problem that the user is trying to diagnose. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RCF_ISCONFIRMED"></a><a id="rcf_isconfirmed"></a><dl>
     * <dt><b>RCF_ISCONFIRMED</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The root cause corresponds to a node with a <a href="https://docs.microsoft.com/windows/desktop/api/ndhelper/ne-ndhelper-diagnosis_status">DIAGNOSIS_STATUS</a> value of <b>DS_CONFIRMED</b>. Problems with confirmed low health are more likely to correspond to the problem the user is trying to diagnose. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RCF_ISTHIRDPARTY"></a><a id="rcf_isthirdparty"></a><dl>
     * <dt><b>RCF_ISTHIRDPARTY</b></dt>
     * <dt>0x4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The root cause comes from a third-party helper class extension rather than a native Windows helper class.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    rootCauseFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>GUID</b>
     * 
     * GUID of the network interface on which the problem occurred. If the problem is not interface-specific, this value is zero (0).
     * @type {Pointer<Guid>}
     */
    networkInterfaceID {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/ndattrib/ns-ndattrib-repairinfoex">RepairInfoEx</a>*</b>
     * 
     * The repairs that are available to try and fix the problem.
     * @type {Pointer<RepairInfoEx>}
     */
    pRepairs {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b>USHORT</b>
     * 
     * The number of repairs available.
     * @type {Integer}
     */
    repairCount {
        get => NumGet(this, 40, "ushort")
        set => NumPut("ushort", value, this, 40)
    }
}
