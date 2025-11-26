#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Queries the overlay hardware capabilities of a Direct3D device.
 * @see https://docs.microsoft.com/windows/win32/api//d3d9/nn-d3d9-idirect3d9exoverlayextension
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IDirect3D9ExOverlayExtension extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirect3D9ExOverlayExtension
     * @type {Guid}
     */
    static IID => Guid("{187aeb13-aaf5-4c59-876d-e059088c0df8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CheckDeviceOverlayType"]

    /**
     * Queries the overlay hardware capabilities of a Direct3D device.
     * @param {Integer} Adapter An ordinal number that denotes the display adapter. <b>D3DADAPTER_DEFAULT</b> is always the primary display adapter.
     * @param {Integer} DevType Specifies the Direct3D device type as a member of the <b>D3DDEVTYPE</b> enumerated type.
     * @param {Integer} OverlayWidth The width of the overlay to create, in pixels.
     * @param {Integer} OverlayHeight The height of the overlay to create, in pixels.
     * @param {Integer} OverlayFormat The surface format of the overlay.
     * @param {Pointer<D3DDISPLAYMODEEX>} pDisplayMode A pointer to a <b>D3DDISPLAYMODEEX</b> structure that specifies the display mode that will be used. If this parameter is <b>NULL</b>, the current display mode is assumed.
     * @param {Integer} DisplayRotation Specifies the display rotation mode as a member of the <b>D3DDISPLAYROTATION</b> enumerated type.
     * @param {Pointer<D3DOVERLAYCAPS>} pOverlayCaps A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3doverlaycaps">D3DOVERLAYCAPS</a> structure. If the driver supports the overlay settings specified in the input parameters, the method fills this structure with the capabilities of the overlay hardware.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>D3DERR_INVALIDCALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid parameter, or the device does not support hardware overlay.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>D3DERR_UNSUPPORTEDOVERLAY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device does not support overlay for the specified size or display mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>D3DERR_UNSUPPORTEDOVERLAYFORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device does not support overlay for the specified surface format.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//d3d9/nf-d3d9-idirect3d9exoverlayextension-checkdeviceoverlaytype
     */
    CheckDeviceOverlayType(Adapter, DevType, OverlayWidth, OverlayHeight, OverlayFormat, pDisplayMode, DisplayRotation, pOverlayCaps) {
        result := ComCall(3, this, "uint", Adapter, "int", DevType, "uint", OverlayWidth, "uint", OverlayHeight, "uint", OverlayFormat, "ptr", pDisplayMode, "int", DisplayRotation, "ptr", pOverlayCaps, "HRESULT")
        return result
    }
}
