#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents behaviors for drag and drop interactions, which are triggered by cross-slide or press-and-hold gestures.
 * @remarks
 * 
  * If <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-addconfiguration">AddConfiguration</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-removeconfiguration">RemoveConfiguration</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-activateconfiguration">ActivateConfiguration</a>, or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setmanualgesture">SetManualGesture</a> has been called successfully on a viewport, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport2-addbehavior">AddBehavior</a> fails for the remaining lifetime of the viewport. 
  * 
  * Once the behavior is added to the viewport, calls to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-addconfiguration">AddConfiguration</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-removeconfiguration">RemoveConfiguration</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-activateconfiguration">ActivateConfiguration</a>, or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setmanualgesture">SetManualGesture</a> will fail until <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport2-removebehavior">RemoveBehavior</a> is called.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nn-directmanipulation-idirectmanipulationdragdropbehavior
 * @namespace Windows.Win32.Graphics.DirectManipulation
 * @version v4.0.30319
 */
class IDirectManipulationDragDropBehavior extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectManipulationDragDropBehavior
     * @type {Guid}
     */
    static IID => Guid("{814b5af5-c2c8-4270-a9b7-a198ce8d02fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetConfiguration", "GetStatus"]

    /**
     * 
     * @param {Integer} configuration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationdragdropbehavior-setconfiguration
     */
    SetConfiguration(configuration) {
        result := ComCall(3, this, "int", configuration, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationdragdropbehavior-getstatus
     */
    GetStatus() {
        result := ComCall(4, this, "int*", &status := 0, "HRESULT")
        return status
    }
}
