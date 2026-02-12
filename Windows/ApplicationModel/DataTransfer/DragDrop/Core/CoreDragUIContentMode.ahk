#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Represents modes for overriding the drag UI. Use this to specify whether the operation should wait for content load before starting, or run in parallel.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dragdrop.core.coredraguicontentmode
 * @namespace Windows.ApplicationModel.DataTransfer.DragDrop.Core
 * @version WindowsRuntime 1.4
 */
class CoreDragUIContentMode extends Win32BitflagEnum{

    /**
     * Specifies content will be provided synchronously.
     * @type {Integer (UInt32)}
     */
    static Auto => 0

    /**
     * Specifies content will be provided with an asynchronous task.
     * @type {Integer (UInt32)}
     */
    static Deferred => 1
}
