#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class PDXVA2SW_GETVIDEOPROCESSORSUBSTREAMFORMATS extends IUnknown {

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
     * @param {Integer} Count 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pVideoDesc, RenderTargetFormat, Count) {
        result := ComCall(3, this, "ptr", pVideoDesc, "uint", RenderTargetFormat, "uint", Count, "uint*", &pFormats := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pFormats
    }
}
