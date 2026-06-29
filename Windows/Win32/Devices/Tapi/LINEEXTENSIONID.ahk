#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The LINEEXTENSIONID structure describes an extension identifier.
 * @remarks
 * These four members together specify a universally unique extension identifier that identifies a line device class extension. This structure may not be extended.
 * 
 * Extension identifiers are generated using an SDK-provided generation utility.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-lineextensionid
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LINEEXTENSIONID {
    #StructPack 4

    /**
     * First part of the extension identifier.
     */
    dwExtensionID0 : UInt32

    /**
     * Second part of the extension identifier.
     */
    dwExtensionID1 : UInt32

    /**
     * Third part of the extension identifier.
     */
    dwExtensionID2 : UInt32

    /**
     * Fourth part of the extension identifier.
     */
    dwExtensionID3 : UInt32

}
