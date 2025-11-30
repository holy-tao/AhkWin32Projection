#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ne-ntsecapi-msv1_0_profile_buffer_type
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class MSV1_0_PROFILE_BUFFER_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MsV1_0InteractiveProfile => 2

    /**
     * @type {Integer (Int32)}
     */
    static MsV1_0Lm20LogonProfile => 3

    /**
     * @type {Integer (Int32)}
     */
    static MsV1_0SmartCardProfile => 4
}
