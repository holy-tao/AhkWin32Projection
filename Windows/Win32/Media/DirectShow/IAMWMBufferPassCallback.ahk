#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMWMBufferPassCallback interface is provided for advanced scenarios in which applications need access to an INSSBuffer3 sample before it is passed downstream for further processing.
 * @see https://docs.microsoft.com/windows/win32/api//dshowasf/nn-dshowasf-iamwmbufferpasscallback
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMWMBufferPassCallback extends IUnknown{
    /**
     * The interface identifier for IAMWMBufferPassCallback
     * @type {Guid}
     */
    static IID => Guid("{b25b8372-d2d2-44b2-8653-1b8dae332489}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<INSSBuffer3>} pNSSBuffer3 
     * @param {Pointer<IPin>} pPin 
     * @param {Pointer<Int64>} prtStart 
     * @param {Pointer<Int64>} prtEnd 
     * @returns {HRESULT} 
     */
    Notify(pNSSBuffer3, pPin, prtStart, prtEnd) {
        result := ComCall(3, this, "ptr", pNSSBuffer3, "ptr", pPin, "int64*", prtStart, "int64*", prtEnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
