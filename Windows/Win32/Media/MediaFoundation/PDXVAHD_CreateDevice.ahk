#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXVAHD_Device.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class PDXVAHD_CreateDevice extends IUnknown {

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
     * @param {IDirect3DDevice9Ex} pD3DDevice 
     * @param {Pointer<DXVAHD_CONTENT_DESC>} pContentDesc 
     * @param {Integer} Usage 
     * @param {Pointer<PDXVAHDSW_Plugin>} pPlugin 
     * @returns {IDXVAHD_Device} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pD3DDevice, pContentDesc, Usage, pPlugin) {
        result := ComCall(3, this, "ptr", pD3DDevice, "ptr", pContentDesc, "int", Usage, "ptr", pPlugin, "ptr*", &ppDevice := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDXVAHD_Device(ppDevice)
    }
}
