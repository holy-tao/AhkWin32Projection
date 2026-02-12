#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\DelegatedInkTrailVisual.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class IDelegatedInkTrailVisualStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDelegatedInkTrailVisualStatics
     * @type {Guid}
     */
    static IID => Guid("{0daf6bd5-42c6-555c-9267-e0ac663af836}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "CreateForSwapChain"]

    /**
     * Create Extended Stored Procedures
     * @param {Compositor} compositor_ 
     * @returns {DelegatedInkTrailVisual} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(compositor_) {
        result := ComCall(6, this, "ptr", compositor_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DelegatedInkTrailVisual(result_)
    }

    /**
     * 
     * @param {Compositor} compositor_ 
     * @param {ICompositionSurface} swapChain 
     * @returns {DelegatedInkTrailVisual} 
     */
    CreateForSwapChain(compositor_, swapChain) {
        result := ComCall(7, this, "ptr", compositor_, "ptr", swapChain, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DelegatedInkTrailVisual(result_)
    }
}
