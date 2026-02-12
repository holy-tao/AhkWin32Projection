#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 * @version v4.0.30319
 */
class IGameInputForceFeedbackEffect extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGameInputForceFeedbackEffect
     * @type {Guid}
     */
    static IID => Guid("{51bda05e-f742-45d9-b085-9444ae48381d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDevice", "GetMotorIndex", "GetGain", "SetGain", "GetParams", "SetParams", "GetState", "SetState"]

    /**
     * The GetDeviceCaps function retrieves device-specific information for the specified device.
     * @remarks
     * When <i>nIndex</i> is SHADEBLENDCAPS:
     * 
     * <ul>
     * <li>For a printer, <b>GetDeviceCaps</b> returns whatever the printer reports.</li>
     * <li>For a display device, all blending operations are available; besides SB_NONE, the only return values are SB_CONST_ALPHA and SB_PIXEL_ALPHA, which indicate whether these operations are accelerated.</li>
     * </ul>
     * On a multiple monitor system, if <i>hdc</i> is the desktop, <b>GetDeviceCaps</b> returns the capabilities of the primary monitor. If you want info for other monitors, you must use the <a href="https://docs.microsoft.com/windows/desktop/gdi/multiple-display-monitors-reference">multi-monitor APIs</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createdca">CreateDC</a> to get a HDC for the device context (DC) of a specific monitor.  
     * 
     * <div class="alert"><b>Note</b>  Display1 is typically the primary monitor, but not always.</div>
     * <div> </div>
     * <b>GetDeviceCaps</b> provides the following six indexes in place of printer escapes.
     * 
     * <table>
     * <tr>
     * <th>Index</th>
     * <th>Printer escape replaced</th>
     * </tr>
     * <tr>
     * <td>PHYSICALWIDTH</td>
     * <td>GETPHYSPAGESIZE</td>
     * </tr>
     * <tr>
     * <td>PHYSICALHEIGHT</td>
     * <td>GETPHYSPAGESIZE</td>
     * </tr>
     * <tr>
     * <td>PHYSICALOFFSETX</td>
     * <td>GETPRINTINGOFFSET</td>
     * </tr>
     * <tr>
     * <td>PHYSICALOFFSETY</td>
     * <td>GETPHYSICALOFFSET</td>
     * </tr>
     * <tr>
     * <td>SCALINGFACTORX</td>
     * <td>GETSCALINGFACTOR</td>
     * </tr>
     * <tr>
     * <td>SCALINGFACTORY</td>
     * <td>GETSCALINGFACTOR</td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  <b>GetDeviceCaps</b> reports info that the display driver provides. If the display driver declines to report any info, <b>GetDeviceCaps</b> calculates the info based on fixed calculations. If the display driver reports invalid info, <b>GetDeviceCaps</b> returns the invalid info. Also, if the display driver declines to report info, <b>GetDeviceCaps</b> might calculate incorrect info because it assumes either fixed DPI (96 DPI) or a fixed size (depending on the info that the display driver did and didn’t provide). Unfortunately, a display driver that is implemented to the Windows Display Driver Model (WDDM) (introduced in Windows Vista) causes GDI to not get the info, so <b>GetDeviceCaps</b> must always calculate the info.</div>
     * <div> </div>
     * @param {Pointer<IGameInputDevice>} device 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/nf-wingdi-getdevicecaps
     */
    GetDevice(device) {
        ComCall(3, this, "ptr*", device)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMotorIndex() {
        result := ComCall(4, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    GetGain() {
        result := ComCall(5, this, "float")
        return result
    }

    /**
     * 
     * @param {Float} gain 
     * @returns {String} Nothing - always returns an empty string
     */
    SetGain(gain) {
        ComCall(6, this, "float", gain)
    }

    /**
     * 
     * @param {Pointer<GameInputForceFeedbackParams>} params 
     * @returns {String} Nothing - always returns an empty string
     */
    GetParams(params) {
        ComCall(7, this, "ptr", params)
    }

    /**
     * 
     * @param {Pointer<GameInputForceFeedbackParams>} params 
     * @returns {Boolean} 
     */
    SetParams(params) {
        result := ComCall(8, this, "ptr", params, "int")
        return result
    }

    /**
     * Gets current Interaction Context state and the time when the context will return to idle state.
     * @remarks
     * After interaction ends, the interaction context might still be busy reporting inertia, or expecting second tap in a double tap gesture (in general, if multi-stroke gesture is possible). This function allows the caller to find out when it is safe to treat the Interaction Context object as idle. The main purpose of this function is management of pools of interaction contexts.
     * @returns {Integer} If this function succeeds, it returns S_OK.
     *  
     * Otherwise, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/interactioncontext/nf-interactioncontext-getstateinteractioncontext
     */
    GetState() {
        result := ComCall(9, this, "int")
        return result
    }

    /**
     * 
     * @param {Integer} state 
     * @returns {String} Nothing - always returns an empty string
     */
    SetState(state) {
        ComCall(10, this, "int", state)
    }
}
