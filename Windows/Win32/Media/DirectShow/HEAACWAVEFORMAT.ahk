#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HEAACWAVEINFO.ahk" { HEAACWAVEINFO }
#Import "..\Audio\WAVEFORMATEX.ahk" { WAVEFORMATEX }

/**
 * Contains format data for an AAC or HE-AAC stream that includes AudioSpecificConfig() data.
 * @remarks
 * Use this structure to access the AudioSpecificConfig() data that follows an <a href="https://docs.microsoft.com/windows/desktop/api/mmreg/ns-mmreg-heaacwaveinfo">HEAACWAVEINFO</a> structure. This data is present only when the <b>wStructType</b> member of the <b>HEAACWAVEFORMAT</b> structure is zero.
 * @see https://learn.microsoft.com/windows/win32/api/mmreg/ns-mmreg-heaacwaveformat
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct HEAACWAVEFORMAT {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mmreg/ns-mmreg-heaacwaveinfo">HEAACWAVEINFO</a> structure.
     */
    wfInfo : HEAACWAVEINFO

    /**
     * A byte array that contains the value of AudioSpecificConfig(), as defined by ISO/IEC 14496-3. The array might be larger than the size given in the structure declaration. Use the value of <b>wfInfo.wfx.cbSize</b>  to determine the size.
     */
    pbAudioSpecificConfig : Int8[1]

}
