#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the format of an event field.
 * @remarks
 * When an Event Tracing for Windows (ETW) payload is decoded by an event processing tool such as xperf or Windows Performance Analyzer (WPA), the tool may make use of formatting hints to interpret the field. Formatting hints are optional parameters to **LoggingFields.Add**.
 * <!--add link once class is added-->
 * For example, an int32 field may specify the **Hexadecimal ** format to indicate that it should be displayed in unsigned-hexadecimal. A byte-array field may specify the **Signed** format to indicate that it should be treated as a series of signed decimal integers, or it may specify the **String** format to indicate that it should be treated as an MBCS (8-bit character) string.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingfieldformat
 * @namespace Windows.Foundation.Diagnostics
 * @version WindowsRuntime 1.4
 */
class LoggingFieldFormat extends Win32Enum{

    /**
     * No format is specified.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * The field is hidden.
     * @type {Integer (Int32)}
     */
    static Hidden => 1

    /**
     * The field contains a MBCS (8-bit character) string.
     * @type {Integer (Int32)}
     */
    static String => 2

    /**
     * A boolean field.
     * @type {Integer (Int32)}
     */
    static Boolean => 3

    /**
     * A hexadecimal field.
     * @type {Integer (Int32)}
     */
    static Hexadecimal => 4

    /**
     * A process identifier field.
     * @type {Integer (Int32)}
     */
    static ProcessId => 5

    /**
     * A thread identifier field.
     * @type {Integer (Int32)}
     */
    static ThreadId => 6

    /**
     * A port number field.
     * @type {Integer (Int32)}
     */
    static Port => 7

    /**
     * An Internet Protocol version 4 (IPv4) field.
     * @type {Integer (Int32)}
     */
    static Ipv4Address => 8

    /**
     * An Internet Protocol version 6 (IPv6) field.
     * @type {Integer (Int32)}
     */
    static Ipv6Address => 9

    /**
     * A socket address field.
     * @type {Integer (Int32)}
     */
    static SocketAddress => 10

    /**
     * An Extensible Markup Language (XML) field.
     * @type {Integer (Int32)}
     */
    static Xml => 11

    /**
     * A JavaScript Object Notation (JSON) field.
     * @type {Integer (Int32)}
     */
    static Json => 12

    /**
     * A 32-bit **Win32** error code.
     * @type {Integer (Int32)}
     */
    static Win32Error => 13

    /**
     * A 32-bit Windows **NTSTATUS** value.
     * @type {Integer (Int32)}
     */
    static NTStatus => 14

    /**
     * A 32-bit Windows **HRESULT** value.
     * @type {Integer (Int32)}
     */
    static HResult => 15

    /**
     * A 64-bit [FILETIME](/windows/desktop/api/minwinbase/ns-minwinbase-filetime) value.
     * @type {Integer (Int32)}
     */
    static FileTime => 16

    /**
     * A signed value.
     * @type {Integer (Int32)}
     */
    static Signed => 17

    /**
     * An unsigned value.
     * @type {Integer (Int32)}
     */
    static Unsigned => 18
}
