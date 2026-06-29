#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PF_FILTER_DESCRIPTOR.ahk" { PF_FILTER_DESCRIPTOR }
#Import ".\PFADDRESSTYPE.ahk" { PFADDRESSTYPE }

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct PF_FILTER_STATS {
    #StructPack 8

    dwNumPacketsFiltered : UInt32

    info : PF_FILTER_DESCRIPTOR

}
