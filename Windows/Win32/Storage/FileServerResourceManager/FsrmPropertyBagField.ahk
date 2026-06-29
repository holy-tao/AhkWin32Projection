#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the type of property bag.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmpropertybagfield
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct FsrmPropertyBagField {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates if the property bag should include the name of the volume being accessed, which may be a 
     *       snapshot.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyBagField_AccessVolume => 0

    /**
     * Indicates if the property bag should include the volume <b>GUID</b> name of the 
     *       original volume.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyBagField_VolumeGuidName => 1
}
