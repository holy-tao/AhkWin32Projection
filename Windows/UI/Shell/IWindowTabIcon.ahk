#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Shell
 * @version WindowsRuntime 1.4
 */
class IWindowTabIcon extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowTabIcon
     * @type {Guid}
     */
    static IID => Guid("{f92f398f-3669-4d0c-a183-14ddae6f6538}")

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
