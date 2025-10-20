#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IMPEG2TuneRequestFactory interface creates a tune request for a basic MPEG-2 transport stream containing the minimal tables. To obtain this interface, call CoCreateInstance with the class identifier CLSID_MPEG2TuneRequestFactory.
 * @remarks
 * 
  * To create a full tune request, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ibdacreatetunerequestex">CreateTuneRequest</a> method provided by one of the tuning space objects.
  *       
  * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMPEG2TuneRequestFactory)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-impeg2tunerequestfactory
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMPEG2TuneRequestFactory extends IDispatch{
    /**
     * The interface identifier for IMPEG2TuneRequestFactory
     * @type {Guid}
     */
    static IID => Guid("{14e11abd-ee37-4893-9ea1-6964de933e39}")

    /**
     * The class identifier for MPEG2TuneRequestFactory
     * @type {Guid}
     */
    static CLSID => Guid("{2c63e4eb-4cea-41b8-919c-e947ea19a77c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<ITuningSpace>} TuningSpace 
     * @param {Pointer<IMPEG2TuneRequest>} TuneRequest 
     * @returns {HRESULT} 
     */
    CreateTuneRequest(TuningSpace, TuneRequest) {
        result := ComCall(7, this, "ptr", TuningSpace, "ptr", TuneRequest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
