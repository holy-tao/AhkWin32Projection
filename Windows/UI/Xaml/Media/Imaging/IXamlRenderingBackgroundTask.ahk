#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Imaging
 * @version WindowsRuntime 1.4
 */
class IXamlRenderingBackgroundTask extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXamlRenderingBackgroundTask
     * @type {Guid}
     */
    static IID => Guid("{5d5fe9aa-533e-44b8-a975-fc5f1e3bff52}")

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
