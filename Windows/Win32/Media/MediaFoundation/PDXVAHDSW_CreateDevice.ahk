#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates an instance of a software plug-in Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device.
 * @see https://learn.microsoft.com/windows/win32/api//content/dxvahd/nc-dxvahd-pdxvahdsw_createdevice
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class PDXVAHDSW_CreateDevice extends IUnknown {

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
     * @returns {HANDLE} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pD3DDevice) {
        phDevice := HANDLE()
        result := ComCall(3, this, "ptr", pD3DDevice, "ptr", phDevice, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phDevice
    }
}
