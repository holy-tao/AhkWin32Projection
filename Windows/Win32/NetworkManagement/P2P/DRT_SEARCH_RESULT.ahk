#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DRT_DATA.ahk
#Include .\DRT_REGISTRATION.ahk

/**
 * DRT_SEARCH_RESULT.
 * @see https://learn.microsoft.com/windows/win32/api/drt/ns-drt-drt_search_result
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class DRT_SEARCH_RESULT extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The size of the <b>DRT_SEARCH_RESULT</b> structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies  the exactness of the search. This member corresponds to the <a href="https://docs.microsoft.com/windows/desktop/api/drt/ne-drt-drt_match_type">DRT_MATCH_TYPE</a> enumeration.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Pointer to the context data passed to the <a href="https://docs.microsoft.com/windows/desktop/api/drt/nf-drt-drtstartsearch">DrtStartSearch</a> API.
     * @type {Pointer<Void>}
     */
    pvContext {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Contains the registration result.
     * @type {DRT_REGISTRATION}
     */
    registration{
        get {
            if(!this.HasProp("__registration"))
                this.__registration := DRT_REGISTRATION(this.ptr + 16)
            return this.__registration
        }
    }
}
