#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_DATETIME.ahk" { WS_DATETIME }
#Import ".\WS_DATETIME_FORMAT.ahk" { WS_DATETIME_FORMAT }

/**
 * This type description is used with WS_DATETIME_TYPE and is optional. It is used to specify constraints on the set of values which can be deserialized.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_datetime_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_DATETIME_DESCRIPTION {
    #StructPack 8

    /**
     * The minimum value.
     */
    minValue : WS_DATETIME

    /**
     * The maximum value.
     */
    maxValue : WS_DATETIME

}
