#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMClockSlave interface controls the tolerance of an audio renderer when it is matching rates with another clock.If the audio renderer is matching rates with another clock, it allows the audio to drift up to the amount of the specified tolerance.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamclockslave
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMClockSlave extends IUnknown{
    /**
     * The interface identifier for IAMClockSlave
     * @type {Guid}
     */
    static IID => Guid("{9fd52741-176d-4b36-8f51-ca8f933223be}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwTolerance 
     * @returns {HRESULT} 
     */
    SetErrorTolerance(dwTolerance) {
        result := ComCall(3, this, "uint", dwTolerance, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwTolerance 
     * @returns {HRESULT} 
     */
    GetErrorTolerance(pdwTolerance) {
        result := ComCall(4, this, "uint*", pdwTolerance, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
