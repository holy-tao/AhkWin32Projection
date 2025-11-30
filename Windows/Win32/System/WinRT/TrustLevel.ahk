#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Represents the trust level of an activatable class.
 * @remarks
 * 
 * Classes can be activated depending on the trust level of the caller and the trust classification of the activatable class.
 * 
 * 
 * <a href="https://docs.microsoft.com/previous-versions/dn408470(v=vs.85)">RegisteredTrustLevel</a> is an alias for this enumeration.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//inspectable/ne-inspectable-trustlevel
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class TrustLevel extends Win32Enum{

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
