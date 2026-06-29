#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Describes an XSD type.
 * @see https://learn.microsoft.com/windows/win32/api/wsdxmldom/ns-wsdxmldom-wsdxml_type
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSDXML_TYPE {
    #StructPack 8

    /**
     * The optional URI that identifies the type.
     */
    Uri : PWSTR

    /**
     * The type table that describes the schema of the type and its binary representation.
     */
    Table : IntPtr

}
