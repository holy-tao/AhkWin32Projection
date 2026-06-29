#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct VIRTUALIZATION_INSTANCE_INFO_INPUT {
    #StructPack 4

    NumberOfWorkerThreads : UInt32

    Flags : UInt32

}
