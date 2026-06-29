#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PF_FILTER_DESCRIPTOR.ahk" { PF_FILTER_DESCRIPTOR }
#Import ".\PFADDRESSTYPE.ahk" { PFADDRESSTYPE }
#Import ".\PFFORWARD_ACTION.ahk" { PFFORWARD_ACTION }
#Import ".\PF_FILTER_STATS.ahk" { PF_FILTER_STATS }

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct PF_INTERFACE_STATS {
    #StructPack 8

    pvDriverContext : IntPtr

    dwFlags : UInt32

    dwInDrops : UInt32

    dwOutDrops : UInt32

    eaInAction : PFFORWARD_ACTION

    eaOutAction : PFFORWARD_ACTION

    dwNumInFilters : UInt32

    dwNumOutFilters : UInt32

    dwFrag : UInt32

    dwSpoof : UInt32

    dwReserved1 : UInt32

    dwReserved2 : UInt32

    liSYN : Int64

    liTotalLogged : Int64

    dwLostLogEntries : UInt32

    FilterInfo : PF_FILTER_STATS[1]

}
