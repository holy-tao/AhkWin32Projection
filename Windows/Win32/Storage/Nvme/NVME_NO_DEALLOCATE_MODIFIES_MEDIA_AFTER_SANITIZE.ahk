#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_NO_DEALLOCATE_MODIFIES_MEDIA_AFTER_SANITIZE {
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
    static NVME_MEDIA_ADDITIONALLY_MODIFIED_AFTER_SANITIZE_NOT_DEFINED => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_MEDIA_NOT_ADDITIONALLY_MODIFIED_AFTER_SANITIZE => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_MEDIA_ADDITIONALLY_MOFIDIED_AFTER_SANITIZE => 2
}
