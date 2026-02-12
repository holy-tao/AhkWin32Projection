#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Specifies what to do if a file or folder with the specified name already exists in the current folder when you create a new file or folder.
 * @remarks
 * Methods that don't explicitly pass a value from the CreationCollisionOption enumeration use the **FailIfExists** value as the default when you create a file or folder.
 * 
 * For example, the [CreateFileAsync](downloadsfolder_createfileasync_1058061470.md) method has one overload, [CreateFileAsync (String, .CreationCollisionOption)](downloadsfolder_createfileasync_1058061470.md), that explicitly passes a value from the CreationCollisionOption enumeration. If you call the other overload, [CreateFileAsync (String)](downloadsfolder_createfileasync_644130808.md), the method uses the **FailIfExists** option as the default.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.creationcollisionoption
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class CreationCollisionOption extends Win32Enum{

    /**
     * Automatically append a number to the base of the specified name if the file or folder already exists.
     * 
     * For example, if `MyFile.txt` already exists, then the new file is named `MyFile (2).txt`. If `MyFolder` already exists, then the new folder is named `MyFolder (2)`.
     * @type {Integer (Int32)}
     */
    static GenerateUniqueName => 0

    /**
     * Replace the existing item if the file or folder already exists.
     * @type {Integer (Int32)}
     */
    static ReplaceExisting => 1

    /**
     * Raise an exception of type **System.Exception** if the file or folder already exists.
     * 
     * Methods that don't explicitly pass a value from the CreationCollisionOption enumeration use the **FailIfExists** value as the default when you try to create, rename, copy, or move a file or folder.
     * @type {Integer (Int32)}
     */
    static FailIfExists => 2

    /**
     * Return the existing item if the file or folder already exists.
     * @type {Integer (Int32)}
     */
    static OpenIfExists => 3
}
