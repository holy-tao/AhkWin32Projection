#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVMEOF_SUBSYSTEM_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
