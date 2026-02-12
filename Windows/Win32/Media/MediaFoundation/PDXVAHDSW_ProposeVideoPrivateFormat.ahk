#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Gets a private surface format from a software plug-in Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device.
 * @remarks
 * This function is called when the application calls <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-createvideosurface">IDXVAHD_Device::CreateVideoSurface</a>  if  the following conditions are true:
 * 
 * <ul>
 * <li>The type of input surface is <b>DXVAHD_SURFACE_TYPE_VIDEO_INPUT_PRIVATE</b>.</li>
 * <li>The Direct3D device does not support the surface format requested by the application natively.</li>
 * </ul>
 * This function enables the plug-in device to propose an alternate format with an equivalent memory layout. For example, if the application requests AYUV, the plug-in device might allocate a surface of type <b>D3DFMT_A8R8G8B8</b>.
 * 
 * If the function succeeds, the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nf-dxvahd-idxvahd_device-createvideosurface">CreateVideoSurface</a> method attempts to create a surface with the format returned in <i>pFormat</i>.
 * @see https://learn.microsoft.com/windows/win32/api//content/dxvahd/nc-dxvahd-pdxvahdsw_proposevideoprivateformat
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class PDXVAHDSW_ProposeVideoPrivateFormat extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {HANDLE} hDevice 
     * @param {Pointer<Integer>} pFormat 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hDevice, pFormat) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        pFormatMarshal := pFormat is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", hDevice, pFormatMarshal, pFormat, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
