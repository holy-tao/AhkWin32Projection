#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MEDIA_TYPE.ahk" { MEDIA_TYPE }

/**
 * Contains information used in formatting a contiguous set of disk tracks. It is used by the IOCTL_DISK_FORMAT_TRACKS_EX control code.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-format_ex_parameters
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FORMAT_EX_PARAMETERS {
    #StructPack 4

    /**
     * The media type. For a list of values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-media_type">MEDIA_TYPE</a>.
     */
    MediaType : MEDIA_TYPE

    /**
     * The cylinder number at which to begin the format.
     */
    StartCylinderNumber : UInt32

    /**
     * The cylinder number at which to end the format.
     */
    EndCylinderNumber : UInt32

    /**
     * The beginning head location.
     */
    StartHeadNumber : UInt32

    /**
     * The ending head location.
     */
    EndHeadNumber : UInt32

    /**
     * The length of the gap between two successive sectors on a track.
     */
    FormatGapLength : UInt16

    /**
     * The number of sectors in each track.
     */
    SectorsPerTrack : UInt16

    /**
     * An array of values specifying the sector numbers of the sectors to be included in the track to be formatted.
     */
    SectorNumber : UInt16[1]

}
