#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IQualityControl interface provides support for quality control.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iqualitycontrol
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IQualityControl extends IUnknown{
    /**
     * The interface identifier for IQualityControl
     * @type {Guid}
     */
    static IID => Guid("{56a868a5-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IBaseFilter>} pSelf 
     * @param {Quality} q 
     * @returns {HRESULT} 
     */
    Notify(pSelf, q) {
        result := ComCall(3, this, "ptr", pSelf, "ptr", q, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IQualityControl>} piqc 
     * @returns {HRESULT} 
     */
    SetSink(piqc) {
        result := ComCall(4, this, "ptr", piqc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
