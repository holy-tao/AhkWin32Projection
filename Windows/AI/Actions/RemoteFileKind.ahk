#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the kind of a remote file.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.remotefilekind
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class RemoteFileKind extends Win32Enum{

    /**
     * Document.
     * @type {Integer (Int32)}
     */
    static Document => 0

    /**
     * Photo.
     * @type {Integer (Int32)}
     */
    static Photo => 1

    /**
     * File.
     * @type {Integer (Int32)}
     */
    static File => 2
}
