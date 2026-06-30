#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * The WMSCRIPTFORMAT structure describes the type of script data used in a script stream.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wmscriptformat
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
class WMSCRIPTFORMAT extends Win32Struct {
    static sizeof => 16

    static packingSize => 4

    /**
     * GUID identifying the type of script commands in a script stream. Always set to WMSCRIPTTYPE_TwoStrings.
     * @type {Guid}
     */
    scriptType {
        get {
            if(!this.HasProp("__scriptType"))
                this.__scriptType := Guid(0, this)
            return this.__scriptType
        }
    }
}
