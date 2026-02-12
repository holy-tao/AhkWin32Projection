#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class IAttachableInputObjectFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAttachableInputObjectFactory
     * @type {Guid}
     */
    static IID => Guid("{a4c54c4e-42bc-58fa-a640-ea1516f4c06b}")

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
