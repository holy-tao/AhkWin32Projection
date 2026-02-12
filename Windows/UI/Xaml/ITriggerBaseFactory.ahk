#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class ITriggerBaseFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITriggerBaseFactory
     * @type {Guid}
     */
    static IID => Guid("{6a3b9e57-fc5d-42d0-8cb9-ca50667af746}")

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
