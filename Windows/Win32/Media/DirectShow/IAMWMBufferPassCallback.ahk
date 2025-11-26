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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Notify"]

    /**
     * The Notify method is called by the pin for each buffer that is delivered during streaming.
     * @param {INSSBuffer3} pNSSBuffer3 Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsbuffer/nn-wmsbuffer-inssbuffer3">INSSBuffer3</a> interface exposed on the media sample.
     * @param {IPin} pPin Pointer to the pin associated with the media stream that the sample belongs to.
     * @param {Pointer<Integer>} prtStart Start time of the sample.
     * @param {Pointer<Integer>} prtEnd End time of the sample.
     * @returns {HRESULT} No particular return value is specified. The calling pin ignores the <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//dshowasf/nf-dshowasf-iamwmbufferpasscallback-notify
     */
    Notify(pNSSBuffer3, pPin, prtStart, prtEnd) {
        prtStartMarshal := prtStart is VarRef ? "int64*" : "ptr"
        prtEndMarshal := prtEnd is VarRef ? "int64*" : "ptr"

        result := ComCall(3, this, "ptr", pNSSBuffer3, "ptr", pPin, prtStartMarshal, prtStart, prtEndMarshal, prtEnd, "HRESULT")
        return result
    }
}
