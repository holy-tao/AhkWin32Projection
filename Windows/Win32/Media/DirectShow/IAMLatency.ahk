#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMLatency interface reports the amount of latency that a filter introduces into the graph.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamlatency
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMLatency extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMLatency
     * @type {Guid}
     */
    static IID => Guid("{62ea93ba-ec62-11d2-b770-00c04fb6bd3d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLatency"]

    /**
     * 
     * @param {Pointer<Integer>} prtLatency 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamlatency-getlatency
     */
    GetLatency(prtLatency) {
        result := ComCall(3, this, "int64*", prtLatency, "HRESULT")
        return result
    }
}
