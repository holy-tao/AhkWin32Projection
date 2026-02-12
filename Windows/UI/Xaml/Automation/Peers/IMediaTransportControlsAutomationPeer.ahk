#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class IMediaTransportControlsAutomationPeer extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaTransportControlsAutomationPeer
     * @type {Guid}
     */
    static IID => Guid("{a3ad8d93-79f8-4958-a3c8-980defb83d15}")

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
