#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class INaturalMotionAnimationFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INaturalMotionAnimationFactory
     * @type {Guid}
     */
    static IID => Guid("{f53acb06-cf6a-4387-a3fe-5221f3e7e0e0}")

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
