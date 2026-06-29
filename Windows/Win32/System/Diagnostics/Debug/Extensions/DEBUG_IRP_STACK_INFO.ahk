#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DEBUG_IRP_STACK_INFO {
    #StructPack 8

    Major : Int8

    Minor : Int8

    DeviceObject : Int64

    FileObject : Int64

    CompletionRoutine : Int64

    StackAddress : Int64

}
