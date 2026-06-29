#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates the elevation type of token being queried by the GetTokenInformation function or set by the SetTokenInformation function.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-token_elevation_type
 * @namespace Windows.Win32.Security
 */
export default struct TOKEN_ELEVATION_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The token does not have a linked token.
     * @type {Integer (Int32)}
     */
    static TokenElevationTypeDefault => 1

    /**
     * The token is an elevated token.
     * @type {Integer (Int32)}
     */
    static TokenElevationTypeFull => 2

    /**
     * The token is a limited token.
     * @type {Integer (Int32)}
     */
    static TokenElevationTypeLimited => 3
}
