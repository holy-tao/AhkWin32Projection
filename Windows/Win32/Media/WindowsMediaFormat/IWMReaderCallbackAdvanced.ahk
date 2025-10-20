#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMReaderCallback interface is implemented by the application to handle data being read from a file.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmreadercallbackadvanced
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMReaderCallbackAdvanced extends IUnknown{
    /**
     * The interface identifier for IWMReaderCallbackAdvanced
     * @type {Guid}
     */
    static IID => Guid("{96406beb-2b2b-11d3-b36b-00c04f6108ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Integer} cnsSampleTime 
     * @param {Integer} cnsSampleDuration 
     * @param {Integer} dwFlags 
     * @param {Pointer<INSSBuffer>} pSample 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     */
    OnStreamSample(wStreamNum, cnsSampleTime, cnsSampleDuration, dwFlags, pSample, pvContext) {
        result := ComCall(3, this, "ushort", wStreamNum, "uint", cnsSampleTime, "uint", cnsSampleDuration, "uint", dwFlags, "ptr", pSample, "ptr", pvContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cnsCurrentTime 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     */
    OnTime(cnsCurrentTime, pvContext) {
        result := ComCall(4, this, "uint", cnsCurrentTime, "ptr", pvContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamCount 
     * @param {Pointer<UInt16>} pStreamNumbers 
     * @param {Pointer<Int32>} pSelections 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     */
    OnStreamSelection(wStreamCount, pStreamNumbers, pSelections, pvContext) {
        result := ComCall(5, this, "ushort", wStreamCount, "ushort*", pStreamNumbers, "int*", pSelections, "ptr", pvContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {Pointer<WM_MEDIA_TYPE>} pMediaType 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     */
    OnOutputPropsChanged(dwOutputNum, pMediaType, pvContext) {
        result := ComCall(6, this, "uint", dwOutputNum, "ptr", pMediaType, "ptr", pvContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Integer} cbBuffer 
     * @param {Pointer<INSSBuffer>} ppBuffer 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     */
    AllocateForStream(wStreamNum, cbBuffer, ppBuffer, pvContext) {
        result := ComCall(7, this, "ushort", wStreamNum, "uint", cbBuffer, "ptr", ppBuffer, "ptr", pvContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {Integer} cbBuffer 
     * @param {Pointer<INSSBuffer>} ppBuffer 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     */
    AllocateForOutput(dwOutputNum, cbBuffer, ppBuffer, pvContext) {
        result := ComCall(8, this, "uint", dwOutputNum, "uint", cbBuffer, "ptr", ppBuffer, "ptr", pvContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
