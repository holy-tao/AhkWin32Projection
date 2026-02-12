#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Possible data types representing the MDM policy value.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.policies.namedpolicykind
 * @namespace Windows.Management.Policies
 * @version WindowsRuntime 1.4
 */
class NamedPolicyKind extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Invalid => 0

    /**
     * @type {Integer (Int32)}
     */
    static Binary => 1

    /**
     * @type {Integer (Int32)}
     */
    static Boolean => 2

    /**
     * @type {Integer (Int32)}
     */
    static Int32 => 3

    /**
     * @type {Integer (Int32)}
     */
    static Int64 => 4

    /**
     * @type {Integer (Int32)}
     */
    static String => 5
}
