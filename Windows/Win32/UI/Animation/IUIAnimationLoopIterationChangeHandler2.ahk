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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnLoopIterationChanged"]

    /**
     * Handles loop iteration change events, which occur when a loop within a storyboard begins a new iteration.
     * @param {IUIAnimationStoryboard2} storyboard The storyboard to which the loop belongs.
     * @param {Pointer} id The loop ID.
     * @param {Integer} newIterationCount The iteration count for the latest <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager2-update">IUIAnimationManager2::Update</a>.
     * @param {Integer} oldIterationCount The iteration count for the previous <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager2-update">IUIAnimationManager2::Update</a>.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationloopiterationchangehandler2-onloopiterationchanged
     */
    OnLoopIterationChanged(storyboard, id, newIterationCount, oldIterationCount) {
        result := ComCall(3, this, "ptr", storyboard, "ptr", id, "uint", newIterationCount, "uint", oldIterationCount, "HRESULT")
        return result
    }
}
