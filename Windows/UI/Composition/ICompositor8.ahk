#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AnimationController.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositor8 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositor8
     * @type {Guid}
     */
    static IID => Guid("{9a0bdee2-fe7b-5f62-a366-9cf8effe2112}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateAnimationController"]

    /**
     * 
     * @returns {AnimationController} 
     */
    CreateAnimationController() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AnimationController(result_)
    }
}
