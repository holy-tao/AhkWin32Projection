#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EMR.ahk" { EMR }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }

/**
 * The EMRSETICMPROFILE structure contains members for the SetICMProfile enhanced metafile record.
 * @remarks
 * This structure is to be used during metafile playback.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrseticmprofile
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRSETICMPROFILE {
    #StructPack 4

    /**
     * The base structure for all record types.
     */
    emr : EMR

    /**
     * The profile flags. This member can be SETICMPROFILE_EMBEDED (0x00000001).
     */
    dwFlags : UInt32

    /**
     * The size of the desired profile name.
     */
    cbName : UInt32

    /**
     * The size of profile data, if attached.
     */
    cbData : UInt32

    /**
     * An array that contains the profile data. The length of this array is <b>cbName</b> plus <b>cbData</b>.
     */
    Data : Int8[1]

}
