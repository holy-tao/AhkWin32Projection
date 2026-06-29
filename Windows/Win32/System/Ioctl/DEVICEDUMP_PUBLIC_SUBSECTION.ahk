#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GP_LOG_PAGE_DESCRIPTOR.ahk" { GP_LOG_PAGE_DESCRIPTOR }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DEVICEDUMP_PUBLIC_SUBSECTION {
    #StructPack 4

    dwFlags : UInt32

    GPLogTable : GP_LOG_PAGE_DESCRIPTOR[16]

    szDescription : CHAR[16]

    bData : Int8[1]

}
