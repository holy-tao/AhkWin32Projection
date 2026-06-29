#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WAVEFILTER structure defines a filter for waveform-audio data.
 * @see https://learn.microsoft.com/windows/win32/api/mmreg/ns-mmreg-wavefilter
 * @namespace Windows.Win32.Media.Audio
 */
export default struct WAVEFILTER {
    #StructPack 4

    /**
     * Size, in bytes, of the <b>WAVEFILTER</b> structure. The size specified in this member must be large enough to contain the base <b>WAVEFILTER</b> structure.
     */
    cbStruct : UInt32

    /**
     * Waveform-audio filter type. Filter tags are registered with Microsoft Corporation for various filter algorithms.
     */
    dwFilterTag : UInt32

    /**
     * Flags for the <b>dwFilterTag</b> member. The flags defined for this member are universal to all filters. Currently, no flags are defined.
     */
    fdwFilter : UInt32

    /**
     * Reserved for system use; should not be examined or modified by an application.
     */
    dwReserved : UInt32[5]

}
