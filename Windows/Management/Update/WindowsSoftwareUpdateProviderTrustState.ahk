#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsSoftwareUpdateProviderTrustState extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SignedTrusted => 0

    /**
     * @type {Integer (Int32)}
     */
    static SignedUntrusted => 1

    /**
     * @type {Integer (Int32)}
     */
    static Unsigned => 2
}
