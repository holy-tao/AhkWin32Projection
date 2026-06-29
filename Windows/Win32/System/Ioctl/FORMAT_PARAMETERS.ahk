#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MEDIA_TYPE.ahk" { MEDIA_TYPE }

/**
 * Contains information used in formatting a contiguous set of disk tracks.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-format_parameters
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FORMAT_PARAMETERS {
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

}
