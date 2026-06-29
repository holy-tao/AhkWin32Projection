#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * An optional type description used with WS_GUID_TYPE to specify constraints on the set of values which can be deserialized.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_guid_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_GUID_DESCRIPTION {
    #StructPack 4

    /**
     * The required value.
     */
    value : Guid

}
