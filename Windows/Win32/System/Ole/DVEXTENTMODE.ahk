#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates whether the sizing mode is content or integral sizing.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/ne-ocidl-dvextentmode
 * @namespace Windows.Win32.System.Ole
 */
export default struct DVEXTENTMODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates that the container will ask the object how big it wants to be to exactly fit its content, for example, in snap-to-size operations.
     * @type {Integer (Int32)}
     */
    static DVEXTENT_CONTENT => 0

    /**
     * Indicates that the container will provide a proposed size to the object for its use in resizing.
     * @type {Integer (Int32)}
     */
    static DVEXTENT_INTEGRAL => 1
}
