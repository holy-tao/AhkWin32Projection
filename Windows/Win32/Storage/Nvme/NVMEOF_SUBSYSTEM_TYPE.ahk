#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVMEOF_SUBSYSTEM_TYPE extends Win32Enum {

    /**
     * Native name: NvmeofSubsysTypeUnknown
     * @type {Integer (Int32)}
     */
    static SubsysTypeUnknown => 0

    /**
     * Native name: NvmeofSubsysTypeDiscReferral
     * @type {Integer (Int32)}
     */
    static SubsysTypeDiscReferral => 1

    /**
     * Native name: NvmeofSubsysTypeIo
     * @type {Integer (Int32)}
     */
    static SubsysTypeIo => 2

    /**
     * Native name: NvmeofSubsysTypeDiscCurrent
     * @type {Integer (Int32)}
     */
    static SubsysTypeDiscCurrent => 3

    /**
     * Native name: NvmeofSubsysTypeMax
     * @type {Integer (Int32)}
     */
    static SubsysTypeMax => 255
}
