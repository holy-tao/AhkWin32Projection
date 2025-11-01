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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnStreamSample", "OnTime", "OnStreamSelection", "OnOutputPropsChanged", "AllocateForStream", "AllocateForOutput"]

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Integer} cnsSampleTime 
     * @param {Integer} cnsSampleDuration 
     * @param {Integer} dwFlags 
     * @param {INSSBuffer} pSample 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadercallbackadvanced-onstreamsample
     */
    OnStreamSample(wStreamNum, cnsSampleTime, cnsSampleDuration, dwFlags, pSample, pvContext) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ushort", wStreamNum, "uint", cnsSampleTime, "uint", cnsSampleDuration, "uint", dwFlags, "ptr", pSample, pvContextMarshal, pvContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cnsCurrentTime 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadercallbackadvanced-ontime
     */
    OnTime(cnsCurrentTime, pvContext) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "uint", cnsCurrentTime, pvContextMarshal, pvContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamCount 
     * @param {Pointer<Integer>} pStreamNumbers 
     * @param {Pointer<Integer>} pSelections 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadercallbackadvanced-onstreamselection
     */
    OnStreamSelection(wStreamCount, pStreamNumbers, pSelections, pvContext) {
        pStreamNumbersMarshal := pStreamNumbers is VarRef ? "ushort*" : "ptr"
        pSelectionsMarshal := pSelections is VarRef ? "int*" : "ptr"
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, "ushort", wStreamCount, pStreamNumbersMarshal, pStreamNumbers, pSelectionsMarshal, pSelections, pvContextMarshal, pvContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {Pointer<WM_MEDIA_TYPE>} pMediaType 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadercallbackadvanced-onoutputpropschanged
     */
    OnOutputPropsChanged(dwOutputNum, pMediaType, pvContext) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, "uint", dwOutputNum, "ptr", pMediaType, pvContextMarshal, pvContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Integer} cbBuffer 
     * @param {Pointer<INSSBuffer>} ppBuffer 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadercallbackadvanced-allocateforstream
     */
    AllocateForStream(wStreamNum, cbBuffer, ppBuffer, pvContext) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(7, this, "ushort", wStreamNum, "uint", cbBuffer, "ptr*", ppBuffer, pvContextMarshal, pvContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {Integer} cbBuffer 
     * @param {Pointer<INSSBuffer>} ppBuffer 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadercallbackadvanced-allocateforoutput
     */
    AllocateForOutput(dwOutputNum, cbBuffer, ppBuffer, pvContext) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(8, this, "uint", dwOutputNum, "uint", cbBuffer, "ptr*", ppBuffer, pvContextMarshal, pvContext, "HRESULT")
        return result
    }
}
