#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IInputPaneAnimationCoordinator extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddAnimation"]

    /**
     * 
     * @param {IUnknown} device 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     */
    AddAnimation(device, animation) {
        result := ComCall(3, this, "ptr", device, "ptr", animation, "HRESULT")
        return result
    }
}
