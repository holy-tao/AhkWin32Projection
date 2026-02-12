#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class ISemanticZoomAutomationPeer extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISemanticZoomAutomationPeer
     * @type {Guid}
     */
    static IID => Guid("{3c2fac6c-a977-47fc-b44e-2754c0b2bea9}")

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
