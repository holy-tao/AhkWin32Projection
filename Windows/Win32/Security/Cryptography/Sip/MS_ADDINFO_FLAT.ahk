#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Provides additional information about flat or end-to-end subject types.
 * @see https://docs.microsoft.com/windows/win32/api//mssip/ns-mssip-ms_addinfo_flat
 * @namespace Windows.Win32.Security.Cryptography.Sip
 * @version v4.0.30319
 */
class MS_ADDINFO_FLAT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A [SIP_INDIRECT_DATA](/windows/desktop/api/mssip/ns-mssip-sip_indirect_data) structure that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hash</a> of a flat file subject.
     * @type {Pointer<SIP_INDIRECT_DATA>}
     */
    pIndirectData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
