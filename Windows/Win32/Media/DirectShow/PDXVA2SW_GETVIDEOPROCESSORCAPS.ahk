#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\MediaFoundation\DXVA2_VideoProcessorCaps.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class PDXVA2SW_GETVIDEOPROCESSORCAPS extends IUnknown {

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
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc 
     * @param {Integer} RenderTargetFormat 
     * @returns {DXVA2_VideoProcessorCaps} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pVideoDesc, RenderTargetFormat) {
        pCaps := DXVA2_VideoProcessorCaps()
        result := ComCall(3, this, "ptr", pVideoDesc, "uint", RenderTargetFormat, "ptr", pCaps, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pCaps
    }
}
