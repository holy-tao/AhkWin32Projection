#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Applications use the methods of the IDirect3DPixelShader9 interface to encapsulate the functionality of a pixel shader.
 * @remarks
 * 
  * The LPDIRECT3DPIXELSHADER9 and PDIRECT3DPIXELSHADER9 types are defined as pointers to the <b>IDirect3DPixelShader9</b> interface.
  *     
  *             
  * 
  * 
  * ```
  * typedef struct IDirect3DPixelShader9 *LPDIRECT3DPIXELSHADER9, *PDIRECT3DPIXELSHADER9;
  * ```
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nn-d3d9helper-idirect3dpixelshader9
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class IDirect3DPixelShader9 extends IUnknown{
    /**
     * The interface identifier for IDirect3DPixelShader9
     * @type {Guid}
     */
    static IID => Guid("{6d3bdbdc-5b02-4415-b852-ce5e8bccb289}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IDirect3DDevice9>} ppDevice 
     * @returns {HRESULT} 
     */
    GetDevice(ppDevice) {
        result := ComCall(3, this, "ptr", ppDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @param {Pointer<UInt32>} pSizeOfData 
     * @returns {HRESULT} 
     */
    GetFunction(param0, pSizeOfData) {
        result := ComCall(4, this, "ptr", param0, "uint*", pSizeOfData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
