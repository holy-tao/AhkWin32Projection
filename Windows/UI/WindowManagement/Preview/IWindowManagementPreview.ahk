#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.WindowManagement.Preview
 * @version WindowsRuntime 1.4
 */
class IWindowManagementPreview extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowManagementPreview
     * @type {Guid}
     */
    static IID => Guid("{4ef55b0d-561d-513c-a67c-2c02b69cef41}")

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
