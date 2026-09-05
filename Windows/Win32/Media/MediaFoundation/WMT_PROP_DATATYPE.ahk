#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the data types used for the codec and DSP properties that are accessed by using the methods of the IWMCodecProps interface.
 * @remarks
 * Most properties are accessed by using the methods of the <b>IPropertyBag</b> interface. The data types of those properties are defined as constants used with <b>VARIANTARG</b> values.
 * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/ne-wmcodecdsp-wmt_prop_datatype
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class WMT_PROP_DATATYPE extends Win32Enum {

    /**
     * Specifies a double-word value.
     * Native name: WMT_PROP_TYPE_DWORD
     * @type {Integer (Int32)}
     */
    static TYPE_DWORD => 0

    /**
     * Specifies a string value.
     * Native name: WMT_PROP_TYPE_STRING
     * @type {Integer (Int32)}
     */
    static TYPE_STRING => 1

    /**
     * Specifies a binary value.
     * Native name: WMT_PROP_TYPE_BINARY
     * @type {Integer (Int32)}
     */
    static TYPE_BINARY => 2

    /**
     * Specifies a Boolean value.
     * Native name: WMT_PROP_TYPE_BOOL
     * @type {Integer (Int32)}
     */
    static TYPE_BOOL => 3

    /**
     * Specifies a quadruple-word value.
     * Native name: WMT_PROP_TYPE_QWORD
     * @type {Integer (Int32)}
     */
    static TYPE_QWORD => 4

    /**
     * Specifies a word value.
     * Native name: WMT_PROP_TYPE_WORD
     * @type {Integer (Int32)}
     */
    static TYPE_WORD => 5

    /**
     * Specifies a GUID value.
     * Native name: WMT_PROP_TYPE_GUID
     * @type {Integer (Int32)}
     */
    static TYPE_GUID => 6
}
