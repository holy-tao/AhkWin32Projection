#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class IClipboardHistoryChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IClipboardHistoryChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{c0be453f-8ea2-53ce-9aba-8d2212573452}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
