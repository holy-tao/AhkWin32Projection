#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.WindowManagement
 * @version WindowsRuntime 1.4
 */
class ICompactOverlayPresentationConfiguration extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompactOverlayPresentationConfiguration
     * @type {Guid}
     */
    static IID => Guid("{a7e5750f-5730-56c6-8e1f-d63ff4d7980d}")

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
