#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SERVER_INFO_599 {
    #StructPack 8

    sv599_sessopens : UInt32

    sv599_sessvcs : UInt32

    sv599_opensearch : UInt32

    sv599_sizreqbuf : UInt32

    sv599_initworkitems : UInt32

    sv599_maxworkitems : UInt32

    sv599_rawworkitems : UInt32

    sv599_irpstacksize : UInt32

    sv599_maxrawbuflen : UInt32

    sv599_sessusers : UInt32

    sv599_sessconns : UInt32

    sv599_maxpagedmemoryusage : UInt32

    sv599_maxnonpagedmemoryusage : UInt32

    sv599_enablesoftcompat : BOOL

    sv599_enableforcedlogoff : BOOL

    sv599_timesource : BOOL

    sv599_acceptdownlevelapis : BOOL

    sv599_lmannounce : BOOL

    sv599_domain : PWSTR

    sv599_maxcopyreadlen : UInt32

    sv599_maxcopywritelen : UInt32

    sv599_minkeepsearch : UInt32

    sv599_maxkeepsearch : UInt32

    sv599_minkeepcomplsearch : UInt32

    sv599_maxkeepcomplsearch : UInt32

    sv599_threadcountadd : UInt32

    sv599_numblockthreads : UInt32

    sv599_scavtimeout : UInt32

    sv599_minrcvqueue : UInt32

    sv599_minfreeworkitems : UInt32

    sv599_xactmemsize : UInt32

    sv599_threadpriority : UInt32

    sv599_maxmpxct : UInt32

    sv599_oplockbreakwait : UInt32

    sv599_oplockbreakresponsewait : UInt32

    sv599_enableoplocks : BOOL

    sv599_enableoplockforceclose : BOOL

    sv599_enablefcbopens : BOOL

    sv599_enableraw : BOOL

    sv599_enablesharednetdrives : BOOL

    sv599_minfreeconnections : UInt32

    sv599_maxfreeconnections : UInt32

    sv599_initsesstable : UInt32

    sv599_initconntable : UInt32

    sv599_initfiletable : UInt32

    sv599_initsearchtable : UInt32

    sv599_alertschedule : UInt32

    sv599_errorthreshold : UInt32

    sv599_networkerrorthreshold : UInt32

    sv599_diskspacethreshold : UInt32

    sv599_reserved : UInt32

    sv599_maxlinkdelay : UInt32

    sv599_minlinkthroughput : UInt32

    sv599_linkinfovalidtime : UInt32

    sv599_scavqosinfoupdatetime : UInt32

    sv599_maxworkitemidletime : UInt32

}
