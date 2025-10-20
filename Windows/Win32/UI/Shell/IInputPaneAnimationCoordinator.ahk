#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IInputPaneAnimationCoordinator extends IUnknown{
    /**
     * The interface identifier for IInputPaneAnimationCoordinator
     * @type {Guid}
     */
    static IID => Guid("{2af16ba9-2de5-4b75-82d9-01372afbffb4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} device 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    AddAnimation(device, animation) {
        result := ComCall(3, this, "ptr", device, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
