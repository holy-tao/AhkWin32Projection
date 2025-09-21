#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DD_GETDRIVERSTATEDATA structure describes the state of the driver.
 * @remarks
 * Applications can use the <b>IDirect3DDevice7::GetInfo</b> method and specify the D3DDEVINFOID_D3DTEXTUREMANAGER, D3DDEVINFOID_TEXTUREMANAGER, and D3DDEVINFOID_TEXTURING flags to retrieve texturing information. For more information about this method and the structures related to these flags, see the DirectX SDK documentation. The runtime then passes these flags to the driver.
  * 
  * <b>DirectX 8.1 versions only.</b>The Direct3D runtime specifies the D3DDEVINFOID_VCACHE flag in the <b>dwFlags</b> member to retrieve vertex-cache information from the driver specified at the <b>lpDD</b> member. The driver specifies this information in a D3DDEVINFO_VCACHE structure and returns it at the <b>lpdwStates</b> member. 
  * 
  * <b>DirectX 9.0 and later versions only.</b> The Direct3D runtime asynchronously queries the driver for vertex-cache information by using the D3DDP2OP_CREATEQUERY and D3DDP2OP_ISSUEQUERY commands and the D3DQUERYTYPE_VCACHE query type in calls to the driver's <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/d3dhal/nc-d3dhal-lpd3dhal_drawprimitives2cb">D3dDrawPrimitives2</a> callback. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/d3d9types/ns-d3d9types-_d3ddevinfo_vcache">D3DDEVINFO_VCACHE</a>.
  * 
  * <div class="alert"><b>Note</b>  The D3DDEVINFOID_VCACHE flag is defined in d3dhal.h; the other flags that can be set in <b>dwFlags</b> are defined in d3dtypes.h.</div>
  * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_getdriverstatedata
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_GETDRIVERSTATEDATA extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Specifies the set of flags to indicate the data requested. This parameter can be set to one of the following flags:
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * D3DDEVINFOID_D3DTEXTUREMANAGER
     * 
     * </td>
     * <td>
     * Requests texture-management information performed by the Direct3D runtime in a D3DDEVINFO_TEXTUREMANAGER structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * D3DDEVINFOID_TEXTUREMANAGER
     * 
     * </td>
     * <td>
     * Requests texture-management information performed by either the driver or the Direct3D runtime in a D3DDEVINFO_TEXTUREMANAGER structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * D3DDEVINFOID_TEXTURING
     * 
     * </td>
     * <td>
     * Requests texture-activity information of the application in a D3DDEVINFO_TEXTURING structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * D3DDEVINFOID_VCACHE
     * 
     * </td>
     * <td>
     * 
     * <dl>
     * <dt>DirectX 8.1 versions only</dt>
     * <dt>Requests vertex-cache information in a D3DDEVINFO_VCACHE structure.</dt>
     * </dl>
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<DD_DIRECTDRAW_GLOBAL>}
     */
    lpDD {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    dwhContext {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Points to the Direct3D driver state data to be filled in by the driver. If, for example, D3DDEVINFOID_VCACHE is specified in the <b>dwFlags</b> member, the driver points the <b>lpdwStates</b> member to a D3DDEVINFO_VCACHE structure that contains vertex-cache information.
     * @type {Pointer<UInt32>}
     */
    lpdwStates {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Specifies the length, in bytes, of the state data to be filled in by the driver.
     * @type {Integer}
     */
    dwLength {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Specifies the location where the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getdriverstate">D3dGetDriverState</a> callback. A return code of D3D_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-codes-for-direct3d-driver-callbacks">Return Codes for Direct3D Driver Callbacks</a>.
     * @type {HRESULT}
     */
    ddRVal {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }
}
