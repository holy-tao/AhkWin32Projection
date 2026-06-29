#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_STRING.ahk" { WS_STRING }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Represents a unique ID URI.
 * @remarks
 * This structure represents a URI that is used as a unique ID.
 *                 It has native support for GUID-based URI's, but can also
 *                 accommodate other unique-id URI's as a string.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_unique_id
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_UNIQUE_ID {
    #StructPack 8

    /**
     * A string representation of the URI.  If length is zero,
     *                     then the unique ID is a guid, and the value is stored
     *                     in the guid field.  Otherwise, the URI is a string
     *                     and the string value is stored in the uri field.
     */
    uri : WS_STRING

    /**
     * If the uri.length field is 0, then this field contains
     *                     the GUID representation of the unique ID.  Otherwise
     *                     the value of the field is not defined.
     */
    guid : Guid

}
