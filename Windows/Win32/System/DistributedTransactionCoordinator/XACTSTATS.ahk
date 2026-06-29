#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct XACTSTATS {
    #StructPack 4

    cOpen : UInt32

    cCommitting : UInt32

    cCommitted : UInt32

    cAborting : UInt32

    cAborted : UInt32

    cInDoubt : UInt32

    cHeuristicDecision : UInt32

    timeTransactionsUp : FILETIME

}
