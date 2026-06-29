#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents the trust level of an activatable class.
 * @remarks
 * Classes can be activated depending on the trust level of the caller and the trust classification of the activatable class.
 * 
 * 
 * <a href="https://docs.microsoft.com/previous-versions/dn408470(v=vs.85)">RegisteredTrustLevel</a> is an alias for this enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/inspectable/ne-inspectable-trustlevel
 * @namespace Windows.Win32.System.WinRT
 */
export default struct TrustLevel {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The component has access to resources that are not protected.
     * @type {Integer (Int32)}
     */
    static BaseTrust => 0

    /**
     * The component has access to resources requested in the app manifest and approved by the user.
     * @type {Integer (Int32)}
     */
    static PartialTrust => 1

    /**
     * The component requires the full privileges of the user.
     * @type {Integer (Int32)}
     */
    static FullTrust => 2
}
