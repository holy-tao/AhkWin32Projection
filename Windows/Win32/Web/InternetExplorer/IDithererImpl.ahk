#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IDithererImpl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDithererImpl
     * @type {Guid}
     */
    static IID => Guid("{7c48e840-3910-11d0-86fc-00a0c913f750}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDestColorTable", "SetEventSink"]

    /**
     * 
     * @param {Integer} nColors 
     * @param {Pointer<RGBQUAD>} prgbColors 
     * @returns {HRESULT} 
     */
    SetDestColorTable(nColors, prgbColors) {
        result := ComCall(3, this, "uint", nColors, "ptr", prgbColors, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IImageDecodeEventSink} pEventSink 
     * @returns {HRESULT} 
     */
    SetEventSink(pEventSink) {
        result := ComCall(4, this, "ptr", pEventSink, "HRESULT")
        return result
    }
}
