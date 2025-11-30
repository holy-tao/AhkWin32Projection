#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the formats that are available to interpret extension data.
 * @see https://docs.microsoft.com/windows/win32/api//tokenbinding/ne-tokenbinding-tokenbinding_extension_format
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class TOKENBINDING_EXTENSION_FORMAT extends Win32Enum{

    /**
     * The format for interpreting the extension data is undefined.
     * @type {Integer (Int32)}
     */
    static TOKENBINDING_EXTENSION_FORMAT_UNDEFINED => 0
}
