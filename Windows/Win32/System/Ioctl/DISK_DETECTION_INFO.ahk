#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DETECTION_TYPE.ahk" { DETECTION_TYPE }
#Import ".\DISK_INT13_INFO.ahk" { DISK_INT13_INFO }
#Import ".\DISK_EX_INT13_INFO.ahk" { DISK_EX_INT13_INFO }

/**
 * Contains detected drive parameters.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-disk_detection_info
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DISK_DETECTION_INFO {
    #StructPack 8

    /**
     * The size of the structure, in bytes.
     */
    SizeOfDetectInfo : UInt32

    /**
     * The detected partition type.
     */
    DetectionType : DETECTION_TYPE

    Int13 : DISK_INT13_INFO

    ExInt13 : DISK_EX_INT13_INFO

}
