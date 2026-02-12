#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class IImplicitAnimationCollection extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IImplicitAnimationCollection
     * @type {Guid}
     */
    static IID => Guid("{0598a3ff-0a92-4c9d-a427-b25519250dbf}")

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
