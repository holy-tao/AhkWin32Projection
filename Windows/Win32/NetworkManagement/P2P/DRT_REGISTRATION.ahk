#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DRT_DATA.ahk

/**
 * The DRT_REGISTRATION structure contains key and application data that make up a registration.
 * @see https://learn.microsoft.com/windows/win32/api/drt/ns-drt-drt_registration
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class DRT_REGISTRATION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Contains the key portion of the registration.
     * @type {DRT_DATA}
     */
    key{
        get {
            if(!this.HasProp("__key"))
                this.__key := DRT_DATA(this.ptr + 0)
            return this.__key
        }
    }

    /**
     * The application data associated with the key. The <a href="https://docs.microsoft.com/windows/desktop/api/drt/ns-drt-drt_data">DRT_DATA</a> structure containing this application data must point to a buffer less than 4KB in size.
     * @type {DRT_DATA}
     */
    appData{
        get {
            if(!this.HasProp("__appData"))
                this.__appData := DRT_DATA(this.ptr + 16)
            return this.__appData
        }
    }
}
