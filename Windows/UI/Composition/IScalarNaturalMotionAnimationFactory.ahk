#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class IScalarNaturalMotionAnimationFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScalarNaturalMotionAnimationFactory
     * @type {Guid}
     */
    static IID => Guid("{835aa4fc-671c-41dd-af48-ae8def8b1529}")

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
