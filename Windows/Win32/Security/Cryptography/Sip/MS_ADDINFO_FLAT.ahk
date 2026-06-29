#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SIP_INDIRECT_DATA.ahk" { SIP_INDIRECT_DATA }

/**
 * Provides additional information about flat or end-to-end subject types.
 * @see https://learn.microsoft.com/windows/win32/api/mssip/ns-mssip-ms_addinfo_flat
 * @namespace Windows.Win32.Security.Cryptography.Sip
 */
export default struct MS_ADDINFO_FLAT {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbStruct : UInt32

    /**
     * A [SIP_INDIRECT_DATA](/windows/desktop/api/mssip/ns-mssip-sip_indirect_data) structure that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hash</a> of a flat file subject.
     */
    pIndirectData : SIP_INDIRECT_DATA.Ptr

}
