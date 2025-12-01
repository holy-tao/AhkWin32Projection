#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Indicate whether a storage element is to be moved or copied.
 * @see https://learn.microsoft.com/windows/win32/api/wtypes/ne-wtypes-stgmove
 * @namespace Windows.Win32.System.Com.StructuredStorage
 * @version v4.0.30319
 */
class STGMOVE extends Win32Enum{

    /**
     * Indicates that the method should move the data from the source to the destination.
     * @type {Integer (Int32)}
     */
    static STGMOVE_MOVE => 0

    /**
     * Indicates that the method should copy the data from the source to the destination. A copy is the same as a move except that the source element is not removed after copying the element to the destination. Copying an element on top of itself is undefined.
     * @type {Integer (Int32)}
     */
    static STGMOVE_COPY => 1

    /**
     * Not implemented.
     * @type {Integer (Int32)}
     */
    static STGMOVE_SHALLOWCOPY => 2
}
