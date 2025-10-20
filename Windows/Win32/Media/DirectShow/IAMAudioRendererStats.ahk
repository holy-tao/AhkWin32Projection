#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMAudioRendererStats interface retrieves statistical performance information from an audio renderer filter.This interface is intended for use during development, to log performance data from the audio renderer.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamaudiorendererstats
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMAudioRendererStats extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMAudioRendererStats
     * @type {Guid}
     */
    static IID => Guid("{22320cb2-d41a-11d2-bf7c-d7cb9df0bf93}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStatParam"]

    /**
     * 
     * @param {Integer} dwParam 
     * @param {Pointer<Integer>} pdwParam1 
     * @param {Pointer<Integer>} pdwParam2 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamaudiorendererstats-getstatparam
     */
    GetStatParam(dwParam, pdwParam1, pdwParam2) {
        result := ComCall(3, this, "uint", dwParam, "uint*", pdwParam1, "uint*", pdwParam2, "HRESULT")
        return result
    }
}
