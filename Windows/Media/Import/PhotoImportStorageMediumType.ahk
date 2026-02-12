#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the type of a storage medium.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportstoragemediumtype
 * @namespace Windows.Media.Import
 * @version WindowsRuntime 1.4
 */
class PhotoImportStorageMediumType extends Win32Enum{

    /**
     * The storage medium type is undefined.
     * @type {Integer (Int32)}
     */
    static Undefined => 0

    /**
     * The storage medium is fixed.
     * @type {Integer (Int32)}
     */
    static Fixed => 1

    /**
     * The storage medium is removable.
     * @type {Integer (Int32)}
     */
    static Removable => 2
}
