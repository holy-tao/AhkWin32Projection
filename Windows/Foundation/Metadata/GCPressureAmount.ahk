#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Microsoft internal use only.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.metadata.gcpressureamount
 * @namespace Windows.Foundation.Metadata
 * @version WindowsRuntime 1.4
 */
class GCPressureAmount extends Win32Enum{

    /**
     * Less than 10k of memory pressure.
     * @type {Integer (Int32)}
     */
    static Low => 0

    /**
     * Between 10k and 100k of memory pressure.
     * @type {Integer (Int32)}
     */
    static Medium => 1

    /**
     * Over 100k of memory pressure.
     * @type {Integer (Int32)}
     */
    static High => 2
}
