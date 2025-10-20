#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines a method for handling storyboard loop iteration events.
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/nn-uianimation-iuianimationloopiterationchangehandler2
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class IUIAnimationLoopIterationChangeHandler2 extends IUnknown{
    /**
     * The interface identifier for IUIAnimationLoopIterationChangeHandler2
     * @type {Guid}
     */
    static IID => Guid("{2d3b15a4-4762-47ab-a030-b23221df3ae0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUIAnimationStoryboard2>} storyboard 
     * @param {Pointer} id 
     * @param {Integer} newIterationCount 
     * @param {Integer} oldIterationCount 
     * @returns {HRESULT} 
     */
    OnLoopIterationChanged(storyboard, id, newIterationCount, oldIterationCount) {
        result := ComCall(3, this, "ptr", storyboard, "ptr", id, "uint", newIterationCount, "uint", oldIterationCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
