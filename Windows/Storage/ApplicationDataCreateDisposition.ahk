#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Specifies options for creating application data containers or returning existing containers. This enumeration is used by the [ApplicationDataContainer.CreateContainer](applicationdatacontainer_createcontainer_1839874827.md) method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.applicationdatacreatedisposition
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class ApplicationDataCreateDisposition extends Win32Enum{

    /**
     * Always returns the specified container. Creates the container if it does not exist.
     * @type {Integer (Int32)}
     */
    static Always => 0

    /**
     * Returns the specified container only if it already exists. Raises an exception of type **System.Exception** if the specified container does not exist.
     * @type {Integer (Int32)}
     */
    static Existing => 1
}
