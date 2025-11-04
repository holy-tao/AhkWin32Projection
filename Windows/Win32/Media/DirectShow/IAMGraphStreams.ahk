#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMGraphStreams interface controls a filter graph that renders a live source.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamgraphstreams
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMGraphStreams extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMGraphStreams
     * @type {Guid}
     */
    static IID => Guid("{632105fa-072e-11d3-8af9-00c04fb6bd3d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindUpstreamInterface", "SyncUsingStreamOffset", "SetMaxGraphLatency"]

    /**
     * 
     * @param {IPin} pPin 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvInterface 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamgraphstreams-findupstreaminterface
     */
    FindUpstreamInterface(pPin, riid, ppvInterface, dwFlags) {
        ppvInterfaceMarshal := ppvInterface is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pPin, "ptr", riid, ppvInterfaceMarshal, ppvInterface, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bUseStreamOffset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamgraphstreams-syncusingstreamoffset
     */
    SyncUsingStreamOffset(bUseStreamOffset) {
        result := ComCall(4, this, "int", bUseStreamOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} rtMaxGraphLatency 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamgraphstreams-setmaxgraphlatency
     */
    SetMaxGraphLatency(rtMaxGraphLatency) {
        result := ComCall(5, this, "int64", rtMaxGraphLatency, "HRESULT")
        return result
    }
}
