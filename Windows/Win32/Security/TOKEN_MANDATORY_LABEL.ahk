#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include .\SID_AND_ATTRIBUTES.ahk

/**
 * Specifies the mandatory integrity level for a token.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_mandatory_label
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class TOKEN_MANDATORY_LABEL extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid_and_attributes">SID_AND_ATTRIBUTES</a> structure that specifies the mandatory integrity level of the token.
     * @type {SID_AND_ATTRIBUTES}
     */
    Label{
        get {
            if(!this.HasProp("__Label"))
                this.__Label := SID_AND_ATTRIBUTES(0, this)
            return this.__Label
        }
    }
}
