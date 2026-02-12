#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the threading model.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.metadata.threadingmodel
 * @namespace Windows.Foundation.Metadata
 * @version WindowsRuntime 1.4
 */
class ThreadingModel extends Win32Enum{

    /**
     * Single-threaded apartment.
     * @type {Integer (Int32)}
     */
    static STA => 1

    /**
     * Multithreaded apartment.
     * @type {Integer (Int32)}
     */
    static MTA => 2

    /**
     * Both single-threaded and multithreaded apartments.
     * @type {Integer (Int32)}
     */
    static Both => 3

    /**
     * No valid threading model applies.
     * @type {Integer (Int32)}
     */
    static InvalidThreading => 0
}
