#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ITuneRequest.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements the CreateTuneRequestEx method, which creates a new tuning request for a tuning space.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDACreateTuneRequestEx)</c>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-ibdacreatetunerequestex
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IBDACreateTuneRequestEx extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBDACreateTuneRequestEx
     * @type {Guid}
     */
    static IID => Guid("{c0a4a1d4-2b3c-491a-ba22-499fbadd4d12}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateTuneRequestEx"]

    /**
     * 
     * @param {Pointer<Guid>} TuneRequestIID 
     * @returns {ITuneRequest} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ibdacreatetunerequestex-createtunerequestex
     */
    CreateTuneRequestEx(TuneRequestIID) {
        result := ComCall(3, this, "ptr", TuneRequestIID, "ptr*", &TuneRequest := 0, "HRESULT")
        return ITuneRequest(TuneRequest)
    }
}
