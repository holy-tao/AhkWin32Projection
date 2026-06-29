#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the access level of a Windows Graphics Device Interface (GDI) section.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicsectionaccesslevel
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICSectionAccessLevel {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates a read only access level.
     * @type {Integer (Int32)}
     */
    static WICSectionAccessLevelRead => 1

    /**
     * Indicates a read/write access level.
     * @type {Integer (Int32)}
     */
    static WICSectionAccessLevelReadWrite => 3
}
