#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D10Device.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A state-block interface encapsulates render states.
 * @remarks
 * 
  * To create a state-block interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-d3d10createstateblock">D3D10CreateStateBlock</a>.
  * 
  * This interface can be used to save and restore pipeline state. It can also be used to capture the current state.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nn-d3d10effect-id3d10stateblock
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10StateBlock extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10StateBlock
     * @type {Guid}
     */
    static IID => Guid("{0803425a-57f5-4dd6-9465-a87570834a08}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Capture", "Apply", "ReleaseAllDeviceObjects", "GetDevice"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10stateblock-capture
     */
    Capture() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10stateblock-apply
     */
    Apply() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10stateblock-releasealldeviceobjects
     */
    ReleaseAllDeviceObjects() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ID3D10Device} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10stateblock-getdevice
     */
    GetDevice() {
        result := ComCall(6, this, "ptr*", &ppDevice := 0, "HRESULT")
        return ID3D10Device(ppDevice)
    }
}
