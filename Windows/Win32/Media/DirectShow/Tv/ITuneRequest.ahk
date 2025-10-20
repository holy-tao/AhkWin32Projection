#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The ITuneRequest interface is the base interface for all tune requests.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ITuneRequest)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-itunerequest
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class ITuneRequest extends IDispatch{
    /**
     * The interface identifier for ITuneRequest
     * @type {Guid}
     */
    static IID => Guid("{07ddc146-fc3d-11d2-9d8c-00c04f72d980}")

    /**
     * The class identifier for TuneRequest
     * @type {Guid}
     */
    static CLSID => Guid("{b46e0d38-ab35-4a06-a137-70576b01b39f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<ITuningSpace>} TuningSpace 
     * @returns {HRESULT} 
     */
    get_TuningSpace(TuningSpace) {
        result := ComCall(7, this, "ptr", TuningSpace, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IComponents>} Components 
     * @returns {HRESULT} 
     */
    get_Components(Components) {
        result := ComCall(8, this, "ptr", Components, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITuneRequest>} NewTuneRequest 
     * @returns {HRESULT} 
     */
    Clone(NewTuneRequest) {
        result := ComCall(9, this, "ptr", NewTuneRequest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ILocator>} Locator 
     * @returns {HRESULT} 
     */
    get_Locator(Locator) {
        result := ComCall(10, this, "ptr", Locator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ILocator>} Locator 
     * @returns {HRESULT} 
     */
    put_Locator(Locator) {
        result := ComCall(11, this, "ptr", Locator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
