#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Specifies all the information in a token that is necessary for an app container.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-token_appcontainer_information
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class TOKEN_APPCONTAINER_INFORMATION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) of the app container.
     * @type {Pointer<Void>}
     */
    TokenAppContainer {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
