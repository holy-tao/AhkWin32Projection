#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Applications use the methods of the IDirect3DStateBlock9 interface to encapsulate render states.
 * @remarks
 * 
  * This interface can be used to save and restore pipeline state. It can also be used to capture the current state.
  * 
  * The LPDIRECT3DSTATEBLOCK9 and PDIRECT3DSTATEBLOCK9 types are defined as pointers to the <b>IDirect3DStateBlock9</b> interface.
  *     
  *             
  * 
  * 
  * ```
  * typedef struct IDirect3DStateBlock9 *LPDIRECT3DSTATEBLOCK9, *PDIRECT3DSTATEBLOCK9;
  * ```
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nn-d3d9helper-idirect3dstateblock9
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class IDirect3DStateBlock9 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirect3DStateBlock9
     * @type {Guid}
     */
    static IID => Guid("{b07c4fe5-310d-4ba8-a23c-4f0f206f218b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDevice", "Capture", "Apply"]

    /**
     * 
     * @param {Pointer<IDirect3DDevice9>} ppDevice 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dstateblock9-getdevice
     */
    GetDevice(ppDevice) {
        result := ComCall(3, this, "ptr*", ppDevice, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dstateblock9-capture
     */
    Capture() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dstateblock9-apply
     */
    Apply() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
