#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPGraphCreation interface provides methods that Windows Media Player calls to enable you to manage the DirectShow filter graph.
 * @see https://docs.microsoft.com/windows/win32/api//wmpservices/nn-wmpservices-iwmpgraphcreation
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPGraphCreation extends IUnknown{
    /**
     * The interface identifier for IWMPGraphCreation
     * @type {Guid}
     */
    static IID => Guid("{bfb377e5-c594-4369-a970-de896d5ece74}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} pFilterGraph 
     * @param {Pointer<IUnknown>} pReserved 
     * @returns {HRESULT} 
     */
    GraphCreationPreRender(pFilterGraph, pReserved) {
        result := ComCall(3, this, "ptr", pFilterGraph, "ptr", pReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pFilterGraph 
     * @returns {HRESULT} 
     */
    GraphCreationPostRender(pFilterGraph) {
        result := ComCall(4, this, "ptr", pFilterGraph, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwFlags 
     * @returns {HRESULT} 
     */
    GetGraphCreationFlags(pdwFlags) {
        result := ComCall(5, this, "uint*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
