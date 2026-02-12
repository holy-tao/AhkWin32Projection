#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Struct.ahk

/**
 * Represents an instant in time, typically expressed as a date and time of day.
  * 
  * > **JavaScript**
  * > This type appears as the [Date](/scripting/javascript/reference/date-object-javascript) object.
  * 
  * > **.NET**
  * > When programming with .NET, this type is hidden, and developers should use the [System.DateTimeOffset](/dotnet/api/system.datetimeoffset?view=dotnet-uwp-10.0&preserve-view=true) structure.
  * 
  * > **C++/CX**
  * > Similar to [FILETIME](/windows/desktop/api/minwinbase/ns-minwinbase-filetime) but with important differences. See Remarks.
  * 
  * > **C++/WinRT**
  * > This type is a specialization of [std::chrono::time_point](/cpp/standard-library/time-point-class). See Remarks.
 * @remarks
 * JavaScript and Microsoft .NET languages do not use this type directly. In JavaScript a DateTime is projected as a [Date](/scripting/javascript/reference/date-object-javascript) object, and in Microsoft .NET it is projected as a [System.DateTimeOffset](/dotnet/api/system.datetimeoffset?view=dotnet-uwp-10.0&preserve-view=true). Each language transparently handles the conversion to the granularity and date ranges for the respective language.
 * 
 * In Visual C++ component extensions (C++/CX), a **DateTime.UniversalTime** value has the same granularity as a [FILETIME](/windows/desktop/api/minwinbase/ns-minwinbase-filetime) (100-nanosecond intervals). For positive values, a **DateTime.UniversalTime** value is identical to a [FILETIME](/windows/desktop/api/minwinbase/ns-minwinbase-filetime) value although it can only represent dates up to about 29000 C.E. A negative value represents the number of intervals prior to January 1, 1601 and can represent dates back to about 27,400 B.C.E. For the Gregorian Calendar, you can use a [DateTimeFormatter](../windows.globalization.datetimeformatting/datetimeformatter.md) to create string representations of a DateTime for dates after midnight on Year 1 C.E.
 * 
 * To convert the **UniversalTime** to [SYSTEMTIME](/windows/desktop/api/minwinbase/ns-minwinbase-systemtime), use [ULARGE_INTEGER](/windows/win32/api/winnt/ns-winnt-ularge_integer-r1) to convert the **int64** value to [FILETIME](/windows/desktop/api/minwinbase/ns-minwinbase-filetime), then use [FileTimeToSystemTime](/windows/desktop/api/timezoneapi/nf-timezoneapi-filetimetosystemtime) to get [SYSTEMTIME](/windows/desktop/api/minwinbase/ns-minwinbase-systemtime).
 * 
 * In C++/WinRT, **DateTime** is similar to C++/CX in that it has the same granularity as a [FILETIME](/windows/desktop/api/minwinbase/ns-minwinbase-filetime). Unlike C++/CX, it is a specialization of [std::chrono::time_point](/cpp/standard-library/time-point-class) rather than a distinct struct. C++/WinRT provides helper functions to convert **DateTime** to and from [FILETIME](/windows/desktop/api/minwinbase/ns-minwinbase-filetime) and to and from [time_t](/cpp/c-runtime-library/reference/time-time32-time64). For more info about these functions, see [winrt::clock struct](/uwp/cpp-ref-for-winrt/clock).
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.datetime
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class DateTime extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * A 64-bit signed integer that represents a point in time as the number of 100-nanosecond intervals prior to or after midnight on January 1, 1601 (according to the Gregorian Calendar).
     * 
     * > [!NOTE]
     * > In C++/WinRT, this field does not exist, because in that language projection **DateTime** is a specialization of [std::chrono::time_point](/cpp/standard-library/time-point-class). If you need the raw integer value, use [time_point::time_since_epoch](/cpp/standard-library/time-point-class#time_since_epoch) to obtain a [std::chrono::duration](/cpp/standard-library/duration-class), and use its [count](/cpp/standard-library/duration-class#count) method to obtain the raw count.
     * @type {Integer}
     */
    UniversalTime {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }
}
