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
     * 
     * @param {Pointer<IPin>} pPin 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvInterface 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    FindUpstreamInterface(pPin, riid, ppvInterface, dwFlags) {
        result := ComCall(3, this, "ptr", pPin, "ptr", riid, "ptr", ppvInterface, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bUseStreamOffset 
     * @returns {HRESULT} 
     */
    SyncUsingStreamOffset(bUseStreamOffset) {
        result := ComCall(4, this, "int", bUseStreamOffset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} rtMaxGraphLatency 
     * @returns {HRESULT} 
     */
    SetMaxGraphLatency(rtMaxGraphLatency) {
        result := ComCall(5, this, "int64", rtMaxGraphLatency, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
