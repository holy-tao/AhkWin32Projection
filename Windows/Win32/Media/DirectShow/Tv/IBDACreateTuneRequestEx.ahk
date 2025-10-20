#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<Guid>} TuneRequestIID 
     * @param {Pointer<ITuneRequest>} TuneRequest 
     * @returns {HRESULT} 
     */
    CreateTuneRequestEx(TuneRequestIID, TuneRequest) {
        result := ComCall(3, this, "ptr", TuneRequestIID, "ptr", TuneRequest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
