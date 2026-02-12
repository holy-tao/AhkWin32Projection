#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the operation to perform on the [DataPackage](datapackage.md) in clipboard and drag and drop scenarios.
 * @remarks
 * If your app supports the exchange of data through clipboard and drag and drop, you need to specify what type operation the user wants. The available operations are none/no action, copy, move, and link.
 * 
 * Many existing controls, such as the text box control, include support for Clipboard actions. Before implementing your own support for these actions, check to see if they are already supported.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datapackageoperation
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class DataPackageOperation extends Win32BitflagEnum{

    /**
     * No action. Typically used when the [DataPackage](datapackage.md) object requires delayed rendering.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Copies the content to the target destination. When implementing clipboard functionality, this corresponds to the "Copy" command.
     * @type {Integer (UInt32)}
     */
    static Copy => 1

    /**
     * Copies the content to the target destination and deletes the original. When implementing clipboard functionality, this corresponds to the "Cut" command.
     * @type {Integer (UInt32)}
     */
    static Move => 2

    /**
     * Creates a link for the data.
     * @type {Integer (UInt32)}
     */
    static Link => 4
}
