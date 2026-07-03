#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PWORKER_THREAD_ROUTINE.ahk" { PWORKER_THREAD_ROUTINE }

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct WORK_QUEUE_ITEM {
    #StructPack 8

    List : IntPtr

    WorkerRoutine : PWORKER_THREAD_ROUTINE

    Parameter : IntPtr

}
