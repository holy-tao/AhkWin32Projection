#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GP_LOG_PAGE_DESCRIPTOR.ahk" { GP_LOG_PAGE_DESCRIPTOR }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DEVICEDUMP_PRIVATE_SUBSECTION {
    #StructPack 4

    dwFlags : UInt32

    GPLogId : GP_LOG_PAGE_DESCRIPTOR

    bData : Int8[1]

}
