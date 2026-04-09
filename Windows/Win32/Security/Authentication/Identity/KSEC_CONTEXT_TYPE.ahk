#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class KSEC_CONTEXT_TYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static KSecPaged => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSecNonPaged => 1
}
