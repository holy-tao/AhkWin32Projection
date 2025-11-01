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
     * 
     * @param {Integer} Adapter 
     * @param {Integer} DevType 
     * @param {Integer} OverlayWidth 
     * @param {Integer} OverlayHeight 
     * @param {Integer} OverlayFormat 
     * @param {Pointer<D3DDISPLAYMODEEX>} pDisplayMode 
     * @param {Integer} DisplayRotation 
     * @param {Pointer<D3DOVERLAYCAPS>} pOverlayCaps 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3d9exoverlayextension-checkdeviceoverlaytype
     */
    CheckDeviceOverlayType(Adapter, DevType, OverlayWidth, OverlayHeight, OverlayFormat, pDisplayMode, DisplayRotation, pOverlayCaps) {
        result := ComCall(3, this, "uint", Adapter, "int", DevType, "uint", OverlayWidth, "uint", OverlayHeight, "uint", OverlayFormat, "ptr", pDisplayMode, "int", DisplayRotation, "ptr", pOverlayCaps, "HRESULT")
        return result
    }
}
