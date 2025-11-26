#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents the auto-scroll animation behavior of content as it approaches the boundary of a given axis or axes.
 * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nn-directmanipulation-idirectmanipulationautoscrollbehavior
 * @namespace Windows.Win32.Graphics.DirectManipulation
 * @version v4.0.30319
 */
class IDirectManipulationAutoScrollBehavior extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectManipulationAutoScrollBehavior
     * @type {Guid}
     */
    static IID => Guid("{6d5954d4-2003-4356-9b31-d051c9ff0af7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetConfiguration"]

    /**
     * Performs the auto-scroll animation for the viewport this behavior is attached to.
     * @param {Integer} motionTypes A combination of <b>DIRECTMANIPULATION_MOTION_TRANSLATEX</b> and <b>DIRECTMANIPULATION_MOTION_TRANSLATEY</b> from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_motion_types">DIRECTMANIPULATION_MOTION_TYPES</a>. <b>DIRECTMANIPULATION_MOTION_NONE</b> cannot be specified.
     * @param {Integer} scrollMotion One of the values from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_autoscroll_configuration">DIRECTMANIPULATION_AUTOSCROLL_CONFIGURATION</a>.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationautoscrollbehavior-setconfiguration
     */
    SetConfiguration(motionTypes, scrollMotion) {
        result := ComCall(3, this, "int", motionTypes, "int", scrollMotion, "HRESULT")
        return result
    }
}
