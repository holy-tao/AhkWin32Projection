#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct WORK_QUEUE_ITEM {
    #StructPack 8

    List : IntPtr

    WorkerRoutine : IntPtr

    Parameter : IntPtr

}
