#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The ITuner interface is implemented on the Microsoft BDA Network Provider filters.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ITuner)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-ituner
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class ITuner extends IUnknown{
    /**
     * The interface identifier for ITuner
     * @type {Guid}
     */
    static IID => Guid("{28c52640-018a-11d3-9d8e-00c04f72d980}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ITuningSpace>} TuningSpace 
     * @returns {HRESULT} 
     */
    get_TuningSpace(TuningSpace) {
        result := ComCall(3, this, "ptr", TuningSpace, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITuningSpace>} TuningSpace 
     * @returns {HRESULT} 
     */
    put_TuningSpace(TuningSpace) {
        result := ComCall(4, this, "ptr", TuningSpace, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumTuningSpaces>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumTuningSpaces(ppEnum) {
        result := ComCall(5, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITuneRequest>} TuneRequest 
     * @returns {HRESULT} 
     */
    get_TuneRequest(TuneRequest) {
        result := ComCall(6, this, "ptr", TuneRequest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITuneRequest>} TuneRequest 
     * @returns {HRESULT} 
     */
    put_TuneRequest(TuneRequest) {
        result := ComCall(7, this, "ptr", TuneRequest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITuneRequest>} TuneRequest 
     * @returns {HRESULT} 
     */
    Validate(TuneRequest) {
        result := ComCall(8, this, "ptr", TuneRequest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IComponentTypes>} ComponentTypes 
     * @returns {HRESULT} 
     */
    get_PreferredComponentTypes(ComponentTypes) {
        result := ComCall(9, this, "ptr", ComponentTypes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IComponentTypes>} ComponentTypes 
     * @returns {HRESULT} 
     */
    put_PreferredComponentTypes(ComponentTypes) {
        result := ComCall(10, this, "ptr", ComponentTypes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Strength 
     * @returns {HRESULT} 
     */
    get_SignalStrength(Strength) {
        result := ComCall(11, this, "int*", Strength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Interval 
     * @returns {HRESULT} 
     */
    TriggerSignalEvents(Interval) {
        result := ComCall(12, this, "int", Interval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
