#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the data types used for the codec and DSP properties that are accessed by using the methods of the IWMCodecProps interface.
 * @remarks
 * Most properties are accessed by using the methods of the <b>IPropertyBag</b> interface. The data types of those properties are defined as constants used with <b>VARIANTARG</b> values.
 * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/ne-wmcodecdsp-wmt_prop_datatype
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class WMT_PROP_DATATYPE extends Win32Enum{

    /**
     * Specifies a double-word value.
     * @type {Integer (Int32)}
     */
    static WMT_PROP_TYPE_DWORD => 0

    /**
     * Specifies a string value.
     * @type {Integer (Int32)}
     */
    static WMT_PROP_TYPE_STRING => 1

    /**
     * Specifies a binary value.
     * @type {Integer (Int32)}
     */
    static WMT_PROP_TYPE_BINARY => 2

    /**
     * Specifies a Boolean value.
     * @type {Integer (Int32)}
     */
    static WMT_PROP_TYPE_BOOL => 3

    /**
     * Specifies a quadruple-word value.
     * @type {Integer (Int32)}
     */
    static WMT_PROP_TYPE_QWORD => 4

    /**
     * Specifies a word value.
     * @type {Integer (Int32)}
     */
    static WMT_PROP_TYPE_WORD => 5

    /**
     * Specifies a GUID value.
     * @type {Integer (Int32)}
     */
    static WMT_PROP_TYPE_GUID => 6
}
