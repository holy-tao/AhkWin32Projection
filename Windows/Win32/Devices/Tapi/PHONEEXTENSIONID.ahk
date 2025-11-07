#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PHONEEXTENSIONID structure describes an extension identifier.
 * @remarks
 * 
 * These four members together specify a universally unique extension identifier that identifies a phone device class extension. This structure may not be extended.
 * 
 * Extension identifiers are generated using an SDK-provided generation utility.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tapi/ns-tapi-phoneextensionid
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class PHONEEXTENSIONID extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * First part of the extension identifier.
     * @type {Integer}
     */
    dwExtensionID0 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Second part of the extension identifier.
     * @type {Integer}
     */
    dwExtensionID1 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Third part of the extension identifier.
     * @type {Integer}
     */
    dwExtensionID2 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Fourth part of the extension identifier.
     * @type {Integer}
     */
    dwExtensionID3 {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
