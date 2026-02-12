#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CompositionProjectedShadowCaster.ahk
#Include .\CompositionProjectedShadow.ahk
#Include .\CompositionProjectedShadowReceiver.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositorWithProjectedShadow extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositorWithProjectedShadow
     * @type {Guid}
     */
    static IID => Guid("{a2e6330e-8a60-5a38-bb85-b44ea901677c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateProjectedShadowCaster", "CreateProjectedShadow", "CreateProjectedShadowReceiver"]

    /**
     * 
     * @returns {CompositionProjectedShadowCaster} 
     */
    CreateProjectedShadowCaster() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionProjectedShadowCaster(result_)
    }

    /**
     * 
     * @returns {CompositionProjectedShadow} 
     */
    CreateProjectedShadow() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionProjectedShadow(result_)
    }

    /**
     * 
     * @returns {CompositionProjectedShadowReceiver} 
     */
    CreateProjectedShadowReceiver() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionProjectedShadowReceiver(result_)
    }
}
