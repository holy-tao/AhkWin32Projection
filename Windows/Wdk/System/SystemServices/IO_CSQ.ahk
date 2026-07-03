#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PIO_CSQ_ACQUIRE_LOCK.ahk" { PIO_CSQ_ACQUIRE_LOCK }
#Import ".\PIO_CSQ_COMPLETE_CANCELED_IRP.ahk" { PIO_CSQ_COMPLETE_CANCELED_IRP }
#Import ".\PIO_CSQ_INSERT_IRP.ahk" { PIO_CSQ_INSERT_IRP }
#Import ".\PIO_CSQ_PEEK_NEXT_IRP.ahk" { PIO_CSQ_PEEK_NEXT_IRP }
#Import ".\PIO_CSQ_RELEASE_LOCK.ahk" { PIO_CSQ_RELEASE_LOCK }
#Import ".\PIO_CSQ_REMOVE_IRP.ahk" { PIO_CSQ_REMOVE_IRP }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_CSQ {
    #StructPack 8

    Type : UInt32

    CsqInsertIrp : PIO_CSQ_INSERT_IRP

    CsqRemoveIrp : PIO_CSQ_REMOVE_IRP

    CsqPeekNextIrp : PIO_CSQ_PEEK_NEXT_IRP

    CsqAcquireLock : PIO_CSQ_ACQUIRE_LOCK

    CsqReleaseLock : PIO_CSQ_RELEASE_LOCK

    CsqCompleteCanceledIrp : PIO_CSQ_COMPLETE_CANCELED_IRP

    ReservePointer : IntPtr

}
