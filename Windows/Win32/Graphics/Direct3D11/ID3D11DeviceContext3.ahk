#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11DeviceContext2.ahk

/**
 * The device context interface represents a device context; it is used to render commands. ID3D11DeviceContext3 adds new methods to those in ID3D11DeviceContext2.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_3/nn-d3d11_3-id3d11devicecontext3
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11DeviceContext3 extends ID3D11DeviceContext2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11DeviceContext3
     * @type {Guid}
     */
    static IID => Guid("{b4e3c01d-e79e-4637-91b2-510e9f4c9b8f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 144

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Flush1", "SetHardwareProtectionState", "GetHardwareProtectionState"]

    /**
     * Sends queued-up commands in the command buffer to the graphics processing unit (GPU), with a specified context type and an optional event handle to create an event query.
     * @remarks
     * 
     * <b>Flush1</b> has parameters.
     *           For more information, see
     *           <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-flush">ID3D11DeviceContext::Flush</a>, which doesn't have parameters.
     * 
     * 
     * @param {Integer} ContextType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/ne-d3d11_3-d3d11_context_type">D3D11_CONTEXT_TYPE</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/ne-d3d11_3-d3d11_context_type">D3D11_CONTEXT_TYPE</a> that specifies the context in which a query occurs, such as a 3D command queue, 3D compute queue, 3D copy queue, video, or image.
     * @param {HANDLE} hEvent Type: <b>HANDLE</b>
     * 
     * An optional event handle. When specified, this method creates an event query.
     *             
     * 
     * <b>Flush1</b> operates asynchronously, therefore it can return either before or after the GPU finishes executing the queued graphics commands, which will eventually complete.
     *               To create an event query, you can call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createquery">ID3D11Device::CreateQuery</a> with the
     *               value <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_query">D3D11_QUERY_EVENT</a> value.
     *               To determine when the GPU is finished processing the graphics commands,
     *               you can then use that event query in a call to <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-getdata">ID3D11DeviceContext::GetData</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_3/nf-d3d11_3-id3d11devicecontext3-flush1
     */
    Flush1(ContextType, hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        ComCall(144, this, "int", ContextType, "ptr", hEvent)
    }

    /**
     * Sets the hardware protection state.
     * @param {BOOL} HwProtectionEnable Type: <b>BOOL</b>
     * 
     * Specifies whether to enable hardware protection.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_3/nf-d3d11_3-id3d11devicecontext3-sethardwareprotectionstate
     */
    SetHardwareProtectionState(HwProtectionEnable) {
        ComCall(145, this, "int", HwProtectionEnable)
    }

    /**
     * Gets whether hardware protection is enabled.
     * @param {Pointer<BOOL>} pHwProtectionEnable Type: <b>BOOL*</b>
     * 
     * After this method returns, points to a BOOL that indicates whether hardware protection is enabled.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_3/nf-d3d11_3-id3d11devicecontext3-gethardwareprotectionstate
     */
    GetHardwareProtectionState(pHwProtectionEnable) {
        pHwProtectionEnableMarshal := pHwProtectionEnable is VarRef ? "int*" : "ptr"

        ComCall(146, this, pHwProtectionEnableMarshal, pHwProtectionEnable)
    }
}
