#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class ILoopingSelectorItemAutomationPeer extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILoopingSelectorItemAutomationPeer
     * @type {Guid}
     */
    static IID => Guid("{d3fa68bf-04cf-4f4c-8d3e-4780a19d4788}")

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
