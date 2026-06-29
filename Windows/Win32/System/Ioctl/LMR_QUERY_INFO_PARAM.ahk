#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LMR_QUERY_INFO_CLASS.ahk" { LMR_QUERY_INFO_CLASS }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct LMR_QUERY_INFO_PARAM {
    #StructPack 4

    Operation : LMR_QUERY_INFO_CLASS

}
