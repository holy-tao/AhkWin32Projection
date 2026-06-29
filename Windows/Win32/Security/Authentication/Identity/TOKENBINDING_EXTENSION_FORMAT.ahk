#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the formats that are available to interpret extension data.
 * @see https://learn.microsoft.com/windows/win32/api/tokenbinding/ne-tokenbinding-tokenbinding_extension_format
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct TOKENBINDING_EXTENSION_FORMAT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The format for interpreting the extension data is undefined.
     * @type {Integer (Int32)}
     */
    static TOKENBINDING_EXTENSION_FORMAT_UNDEFINED => 0
}
