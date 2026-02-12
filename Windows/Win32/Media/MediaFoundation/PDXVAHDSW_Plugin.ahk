#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Pointer to a function that initializes a software plug-in device for Microsoft DirectX Video Acceleration High Definition (DXVA-HD).
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahdsw_callbacks">DXVAHDSW_CALLBACKS</a> structure contains pointers to callback functions. The software plug-in device must implement these callback functions. The  DXVA-HD device calls the <b>PDXVAHDSW_Plugin</b> function to get the callback function pointers from the plug-in device.
 * @see https://learn.microsoft.com/windows/win32/api//content/dxvahd/nc-dxvahd-pdxvahdsw_plugin
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class PDXVAHDSW_Plugin extends IUnknown {

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
     * @param {Integer} Size_ 
     * @param {Pointer} pCallbacks 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Size_, pCallbacks) {
        result := ComCall(3, this, "uint", Size_, "ptr", pCallbacks, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
