#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVMEOF_SUBSYSTEM_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofSubsysTypeUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofSubsysTypeDiscReferral => 1

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofSubsysTypeIo => 2

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofSubsysTypeDiscCurrent => 3

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofSubsysTypeMax => 255
}
