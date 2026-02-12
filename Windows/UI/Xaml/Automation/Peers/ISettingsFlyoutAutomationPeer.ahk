#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class ISettingsFlyoutAutomationPeer extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISettingsFlyoutAutomationPeer
     * @type {Guid}
     */
    static IID => Guid("{d0de0cdb-30cf-47a6-a5eb-9c77f0b0d6dd}")

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
