#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Sets a state parameter for an input stream on a software Microsoft DirectX Video Acceleration High Definition (DXVA-HD) video processor.
 * @see https://learn.microsoft.com/windows/win32/api//content/dxvahd/nc-dxvahd-pdxvahdsw_setvideoprocessstreamstate
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class PDXVAHDSW_SetVideoProcessStreamState extends IUnknown {

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
     * @param {HANDLE} hVideoProcessor 
     * @param {Integer} StreamNumber 
     * @param {Integer} State 
     * @param {Integer} DataSize 
     * @param {Pointer} pData 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hVideoProcessor, StreamNumber, State, DataSize, pData) {
        hVideoProcessor := hVideoProcessor is Win32Handle ? NumGet(hVideoProcessor, "ptr") : hVideoProcessor

        result := ComCall(3, this, "ptr", hVideoProcessor, "uint", StreamNumber, "int", State, "uint", DataSize, "ptr", pData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
