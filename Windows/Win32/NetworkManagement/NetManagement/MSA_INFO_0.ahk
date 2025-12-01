#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies information about a managed service account.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-msa_info_0
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class MSA_INFO_0 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/ne-lmaccess-msa_info_state">MSA_INFO_STATE</a> enumeration that indicates the state of the service account specified in the call to the <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netqueryserviceaccount">NetQueryServiceAccount</a> function.
     * @type {Integer}
     */
    State {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
