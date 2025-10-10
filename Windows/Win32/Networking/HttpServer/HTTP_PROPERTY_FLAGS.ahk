#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used by the property configuration structures to enable or disable a property on a configuration object when setting property configurations.
 * @remarks
 * 
  * The property configuration structures are used in calls to <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsetrequestqueueproperty">HttpSetRequestQueueProperty</a>, <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsetserversessionproperty">HttpSetServerSessionProperty</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpseturlgroupproperty">HttpSetUrlGroupProperty</a> to set properties on the corresponding configuration objects. The configuration structures are also used in calls to <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpqueryrequestqueueproperty">HttpQueryRequestQueueProperty</a>, <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpqueryserversessionproperty">HttpQueryServerSessionProperty</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpqueryurlgroupproperty">HttpQueryUrlGroupProperty</a>,  to query properties on the corresponding configuration object. When properties are set on the URL Group, server session, or request queue, this structure enables or disables the property. When properties are queried for the URL Group, server session, or request queue, this structure is used by the application to determine if the property is present. For more information, see the list of property configuration structures in the See Also section below.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//http/ns-http-http_property_flags
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_PROPERTY_FLAGS extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - Present
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The <b>Present</b> flag enables or disables a property, or determines whether the property is present on the configuration object.
     * 
     * A value of zero indicates the property is not present; a positive value indicates the property is present.
     * @type {Integer}
     */
    Present {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }
}
