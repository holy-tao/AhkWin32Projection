#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Define the valid object text formats to be used by SWbemObjectEx.GetText_.
 * @see https://learn.microsoft.com/windows/win32/api/wbemdisp/ne-wbemdisp-wbemobjecttextformatenum
 * @namespace Windows.Win32.System.Wmi
 */
export default struct WbemObjectTextFormatEnum {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
