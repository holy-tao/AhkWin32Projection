#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class PDXVA2SW_CREATEVIDEOPROCESSDEVICE extends IUnknown {

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
     * @param {IDirect3DDevice9} pD3DD9 
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc 
     * @param {Integer} RenderTargetFormat 
     * @param {Integer} MaxSubStreams 
     * @returns {HANDLE} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pD3DD9, pVideoDesc, RenderTargetFormat, MaxSubStreams) {
        phDevice := HANDLE()
        result := ComCall(3, this, "ptr", pD3DD9, "ptr", pVideoDesc, "uint", RenderTargetFormat, "uint", MaxSubStreams, "ptr", phDevice, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phDevice
    }
}
