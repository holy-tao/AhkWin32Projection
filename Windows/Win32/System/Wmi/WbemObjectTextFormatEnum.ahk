#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Define the valid object text formats to be used by SWbemObjectEx.GetText_.
 * @see https://learn.microsoft.com/windows/win32/api/wbemdisp/ne-wbemdisp-wbemobjecttextformatenum
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WbemObjectTextFormatEnum extends Win32Enum{

    /**
     * XML format conforming to the DMTF (Distributed Management Task Force) CIM document type definition (DTD) version 2.0.
     * @type {Integer (Int32)}
     */
    static wbemObjectTextFormatCIMDTD20 => 1

    /**
     * XML format as defined by the extended WMI version of DMTF CIM DTD version 2.0. Using this value enables WMI-specific extensions, such as embedded objects or scope.
     * @type {Integer (Int32)}
     */
    static wbemObjectTextFormatWMIDTD20 => 2
}
