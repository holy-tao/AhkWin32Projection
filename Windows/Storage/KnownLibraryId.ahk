#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Provides values that identify storage libraries.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.knownlibraryid
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class KnownLibraryId extends Win32Enum{

    /**
     * Music library.
     * @type {Integer (Int32)}
     */
    static Music => 0

    /**
     * Pictures library.
     * @type {Integer (Int32)}
     */
    static Pictures => 1

    /**
     * Videos library.
     * @type {Integer (Int32)}
     */
    static Videos => 2

    /**
     * Documents library.
     * @type {Integer (Int32)}
     */
    static Documents => 3
}
