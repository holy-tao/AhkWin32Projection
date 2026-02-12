#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.WindowManagement
 * @version WindowsRuntime 1.4
 */
class IAppWindowPresentationConfigurationFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppWindowPresentationConfigurationFactory
     * @type {Guid}
     */
    static IID => Guid("{fd3606a6-7875-5de8-84ff-6351ee13dd0d}")

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
