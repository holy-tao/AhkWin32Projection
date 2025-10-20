#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IAMExtendedSeeking interface seeks to a marker in a Windows Media stream or changes the playback rate for a Windows Media file. This interface is implemented by the Windows Media Source filter and the WM ASF Reader filter.
 * @remarks
 * 
  * To define the interface identifier, include the header file Initguid.h before Qnetwork.h, but after Dshow.h and other header files:
  * 
  * <pre class="syntax" xml:space="preserve"><code>#include &lt;dshow.h&gt;
  * 
 * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nn-qnetwork-iamextendedseeking
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMExtendedSeeking extends IDispatch{
    /**
     * The interface identifier for IAMExtendedSeeking
     * @type {Guid}
     */
    static IID => Guid("{fa2aa8f9-8b62-11d0-a520-000000000000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} pExCapabilities 
     * @returns {HRESULT} 
     */
    get_ExSeekCapabilities(pExCapabilities) {
        result := ComCall(7, this, "int*", pExCapabilities, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pMarkerCount 
     * @returns {HRESULT} 
     */
    get_MarkerCount(pMarkerCount) {
        result := ComCall(8, this, "int*", pMarkerCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pCurrentMarker 
     * @returns {HRESULT} 
     */
    get_CurrentMarker(pCurrentMarker) {
        result := ComCall(9, this, "int*", pCurrentMarker, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} MarkerNum 
     * @param {Pointer<Double>} pMarkerTime 
     * @returns {HRESULT} 
     */
    GetMarkerTime(MarkerNum, pMarkerTime) {
        result := ComCall(10, this, "int", MarkerNum, "double*", pMarkerTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} MarkerNum 
     * @param {Pointer<BSTR>} pbstrMarkerName 
     * @returns {HRESULT} 
     */
    GetMarkerName(MarkerNum, pbstrMarkerName) {
        result := ComCall(11, this, "int", MarkerNum, "ptr", pbstrMarkerName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} Speed 
     * @returns {HRESULT} 
     */
    put_PlaybackSpeed(Speed) {
        result := ComCall(12, this, "double", Speed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pSpeed 
     * @returns {HRESULT} 
     */
    get_PlaybackSpeed(pSpeed) {
        result := ComCall(13, this, "double*", pSpeed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
