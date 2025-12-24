#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ILocator.ahk

/**
 * The IAnalogLocator interface provides tuning information for an analog television network.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IAnalogLocator)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-ianaloglocator
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IAnalogLocator extends ILocator{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAnalogLocator
     * @type {Guid}
     */
    static IID => Guid("{34d1f26b-e339-430d-abce-738cb48984dc}")

    /**
     * The class identifier for AnalogLocator
     * @type {Guid}
     */
    static CLSID => Guid("{49638b91-48ab-48b7-a47a-7d0e75a08ede}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 22

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_VideoStandard", "put_VideoStandard"]

    /**
     * @type {Integer} 
     */
    VideoStandard {
        get => this.get_VideoStandard()
        set => this.put_VideoStandard(value)
    }

    /**
     * The get_VideoStandard method retrieves the format of the analog television signal.
     * @returns {Integer} Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-analogvideostandard">AnalogVideoStandard</a> variable that receives the format of the analog television signal.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ianaloglocator-get_videostandard
     */
    get_VideoStandard() {
        result := ComCall(22, this, "int*", &AVS := 0, "HRESULT")
        return AVS
    }

    /**
     * The put_VideoStandard method specifies the format of the analog television signal.
     * @param {Integer} AVS Specifies the format of the analog television signal. This parameter is of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-analogvideostandard">AnalogVideoStandard</a>.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved by using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ianaloglocator-put_videostandard
     */
    put_VideoStandard(AVS) {
        result := ComCall(23, this, "int", AVS, "HRESULT")
        return result
    }
}
