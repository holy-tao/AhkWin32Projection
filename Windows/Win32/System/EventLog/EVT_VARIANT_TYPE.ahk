#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the possible data types of a variant data item.
 * @see https://docs.microsoft.com/windows/win32/api//winevt/ne-winevt-evt_variant_type
 * @namespace Windows.Win32.System.EventLog
 * @version v4.0.30319
 */
class EVT_VARIANT_TYPE{

    /**
     * Null content that implies that the element that contains the content does not exist.
     * @type {Integer (Int32)}
     */
    static EvtVarTypeNull => 0

    /**
     * A null-terminated Unicode string.
     * @type {Integer (Int32)}
     */
    static EvtVarTypeString => 1

    /**
     * A null-terminated ANSI string.
     * @type {Integer (Int32)}
     */
    static EvtVarTypeAnsiString => 2

    /**
     * A signed 8-bit integer value.
     * @type {Integer (Int32)}
     */
    static EvtVarTypeSByte => 3

    /**
     * An unsigned 8-bit integer value.
     * @type {Integer (Int32)}
     */
    static EvtVarTypeByte => 4

    /**
     * An signed 16-bit integer value.
     * @type {Integer (Int32)}
     */
    static EvtVarTypeInt16 => 5

    /**
     * An unsigned 16-bit integer value.
     * @type {Integer (Int32)}
     */
    static EvtVarTypeUInt16 => 6

    /**
     * A signed 32-bit integer value.
     * @type {Integer (Int32)}
     */
    static EvtVarTypeInt32 => 7

    /**
     * An unsigned 32-bit integer value.
     * @type {Integer (Int32)}
     */
    static EvtVarTypeUInt32 => 8

    /**
     * A signed 64-bit integer value.
     * @type {Integer (Int32)}
     */
    static EvtVarTypeInt64 => 9

    /**
     * An unsigned 64-bit integer value.
     * @type {Integer (Int32)}
     */
    static EvtVarTypeUInt64 => 10

    /**
     * A single-precision real value.
     * @type {Integer (Int32)}
     */
    static EvtVarTypeSingle => 11

    /**
     * A double-precision real value.
     * @type {Integer (Int32)}
     */
    static EvtVarTypeDouble => 12

    /**
     * A Boolean value.
     * @type {Integer (Int32)}
     */
    static EvtVarTypeBoolean => 13

    /**
     * A hexadecimal binary value.
     * @type {Integer (Int32)}
     */
    static EvtVarTypeBinary => 14

    /**
     * A GUID value.
     * @type {Integer (Int32)}
     */
    static EvtVarTypeGuid => 15

    /**
     * An unsigned 32-bit or 64-bit integer value that contains a pointer address.
     * @type {Integer (Int32)}
     */
    static EvtVarTypeSizeT => 16

    /**
     * A FILETIME value.
     * @type {Integer (Int32)}
     */
    static EvtVarTypeFileTime => 17

    /**
     * A SYSTEMTIME value.
     * @type {Integer (Int32)}
     */
    static EvtVarTypeSysTime => 18

    /**
     * A security identifier (<a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>) structure
     * @type {Integer (Int32)}
     */
    static EvtVarTypeSid => 19

    /**
     * A 32-bit hexadecimal number.
     * @type {Integer (Int32)}
     */
    static EvtVarTypeHexInt32 => 20

    /**
     * A 64-bit hexadecimal number.
     * @type {Integer (Int32)}
     */
    static EvtVarTypeHexInt64 => 21

    /**
     * An EVT_HANDLE value.
     * @type {Integer (Int32)}
     */
    static EvtVarTypeEvtHandle => 32

    /**
     * A null-terminated Unicode string that contains XML.
     * @type {Integer (Int32)}
     */
    static EvtVarTypeEvtXml => 35
}
