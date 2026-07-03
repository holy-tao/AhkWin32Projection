#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\CLS_LSN.ahk" { CLS_LSN }

/**
 * Describes general information about a log.
 * @see https://learn.microsoft.com/windows/win32/api/clfs/ns-clfs-cls_information
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct CLS_INFORMATION {
    #StructPack 8

    /**
     * The total available space that is allocated to a log, in bytes.  
     * 
     * This member is the sum of the sizes of all containers that are allocated to the dedicated log.
     */
    TotalAvailable : Int64

    /**
     * The space that is available in a log to  append new records and reservation allocations, in bytes.
     */
    CurrentAvailable : Int64

    /**
     * The total space in a  log that is dedicated to reservation allocations.
     */
    TotalReservation : Int64

    /**
     * The size of the base log, in bytes.
     */
    BaseFileSize : Int64

    /**
     * The size of a container, in bytes.
     */
    ContainerSize : Int64

    /**
     * The number of active containers that are associated with a dedicated log.
     */
    TotalContainers : UInt32

    /**
     * The number of containers that are not in an active log.
     */
    FreeContainers : UInt32

    /**
     * The number of  log streams  that are active in a physical log.
     */
    TotalClients : UInt32

    /**
     * The log  attributes that are set by using the <i>fFlagsAndAttributes</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/clfsw32/nf-clfsw32-createlogfile">CreateLogFile</a> when a log is created.
     */
    Attributes : UInt32

    /**
     * The number of bytes of data that can remain pending on the internal flush queue before  the Common Log File System (CLFS)  automatically writes the data to disk.
     */
    FlushThreshold : UInt32

    /**
     * The sector size of the underlying disk geometry, in bytes.  
     * 
     * The sector size is assumed to be a multiple of 512 and consistent across log containers.
     */
    SectorSize : UInt32

    /**
     * The log sequence number (LSN) of the log archive tail.
     */
    MinArchiveTailLsn : CLS_LSN

    /**
     * The LSN that marks the start of the active region of a log.
     */
    BaseLsn : CLS_LSN

    /**
     * The value of <b>LastFlushedLsn</b> indicates that any LSNs smaller than the one specified are already  flushed to disk.
     */
    LastFlushedLsn : CLS_LSN

    /**
     * The value of <b>LastLsn</b> indicates that any LSNs smaller than the one specified are already  appended to the log.
     */
    LastLsn : CLS_LSN

    /**
     * The LSN of the last written restart record.  
     * 
     * If the log  does not have a  restart area, the LSN has the value of CLFS_LSN_INVALID.
     */
    RestartLsn : CLS_LSN

    /**
     * The unique identifier for a log.
     */
    Identity : Guid

}
