#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionDrawingSurfaceFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionDrawingSurfaceFactory
     * @type {Guid}
     */
    static IID => Guid("{9497b00a-312d-46b9-9db3-412fd79464c8}")

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
