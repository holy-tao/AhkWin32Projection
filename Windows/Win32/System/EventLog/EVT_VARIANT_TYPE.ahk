#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the possible data types of a variant data item.
 * @see https://learn.microsoft.com/windows/win32/api/winevt/ne-winevt-evt_variant_type
 * @namespace Windows.Win32.System.EventLog
 */
class EVT_VARIANT_TYPE extends Win32Enum {

    /**
     * Null content that implies that the element that contains the content does not exist.
     * Native name: EvtVarTypeNull
     * @type {Integer (Int32)}
     */
    static VarTypeNull => 0

    /**
     * A null-terminated Unicode string.
     * Native name: EvtVarTypeString
     * @type {Integer (Int32)}
     */
    static VarTypeString => 1

    /**
     * A null-terminated ANSI string.
     * Native name: EvtVarTypeAnsiString
     * @type {Integer (Int32)}
     */
    static VarTypeAnsiString => 2

    /**
     * A signed 8-bit integer value.
     * Native name: EvtVarTypeSByte
     * @type {Integer (Int32)}
     */
    static VarTypeSByte => 3

    /**
     * An unsigned 8-bit integer value.
     * Native name: EvtVarTypeByte
     * @type {Integer (Int32)}
     */
    static VarTypeByte => 4

    /**
     * An signed 16-bit integer value.
     * Native name: EvtVarTypeInt16
     * @type {Integer (Int32)}
     */
    static VarTypeInt16 => 5

    /**
     * An unsigned 16-bit integer value.
     * Native name: EvtVarTypeUInt16
     * @type {Integer (Int32)}
     */
    static VarTypeUInt16 => 6

    /**
     * A signed 32-bit integer value.
     * Native name: EvtVarTypeInt32
     * @type {Integer (Int32)}
     */
    static VarTypeInt32 => 7

    /**
     * An unsigned 32-bit integer value.
     * Native name: EvtVarTypeUInt32
     * @type {Integer (Int32)}
     */
    static VarTypeUInt32 => 8

    /**
     * A signed 64-bit integer value.
     * Native name: EvtVarTypeInt64
     * @type {Integer (Int32)}
     */
    static VarTypeInt64 => 9

    /**
     * An unsigned 64-bit integer value.
     * Native name: EvtVarTypeUInt64
     * @type {Integer (Int32)}
     */
    static VarTypeUInt64 => 10

    /**
     * A single-precision real value.
     * Native name: EvtVarTypeSingle
     * @type {Integer (Int32)}
     */
    static VarTypeSingle => 11

    /**
     * A double-precision real value.
     * Native name: EvtVarTypeDouble
     * @type {Integer (Int32)}
     */
    static VarTypeDouble => 12

    /**
     * A Boolean value.
     * Native name: EvtVarTypeBoolean
     * @type {Integer (Int32)}
     */
    static VarTypeBoolean => 13

    /**
     * A hexadecimal binary value.
     * Native name: EvtVarTypeBinary
     * @type {Integer (Int32)}
     */
    static VarTypeBinary => 14

    /**
     * A GUID value.
     * Native name: EvtVarTypeGuid
     * @type {Integer (Int32)}
     */
    static VarTypeGuid => 15

    /**
     * An unsigned 32-bit or 64-bit integer value that contains a pointer address.
     * Native name: EvtVarTypeSizeT
     * @type {Integer (Int32)}
     */
    static VarTypeSizeT => 16

    /**
     * A FILETIME value.
     * Native name: EvtVarTypeFileTime
     * @type {Integer (Int32)}
     */
    static VarTypeFileTime => 17

    /**
     * A SYSTEMTIME value.
     * Native name: EvtVarTypeSysTime
     * @type {Integer (Int32)}
     */
    static VarTypeSysTime => 18

    /**
     * A security identifier (<a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>) structure
     * Native name: EvtVarTypeSid
     * @type {Integer (Int32)}
     */
    static VarTypeSid => 19

    /**
     * A 32-bit hexadecimal number.
     * Native name: EvtVarTypeHexInt32
     * @type {Integer (Int32)}
     */
    static VarTypeHexInt32 => 20

    /**
     * A 64-bit hexadecimal number.
     * Native name: EvtVarTypeHexInt64
     * @type {Integer (Int32)}
     */
    static VarTypeHexInt64 => 21

    /**
     * An EVT_HANDLE value.
     * Native name: EvtVarTypeEvtHandle
     * @type {Integer (Int32)}
     */
    static VarTypeEvtHandle => 32

    /**
     * A null-terminated Unicode string that contains XML.
     * Native name: EvtVarTypeEvtXml
     * @type {Integer (Int32)}
     */
    static VarTypeEvtXml => 35
}
