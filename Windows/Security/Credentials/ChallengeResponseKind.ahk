#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Security.Credentials
 * @version WindowsRuntime 1.4
 */
class ChallengeResponseKind extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static VirtualizationBasedSecurityEnclave => 0
}
