#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct AddPackageDependencyOptions2 {
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
    static AddPackageDependencyOptions2_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static AddPackageDependencyOptions2_PrependIfRankCollision => 1

    /**
     * @type {Integer (Int32)}
     */
    static AddPackageDependencyOptions2_SpecifiedPackageFamilyOnly => 2
}
