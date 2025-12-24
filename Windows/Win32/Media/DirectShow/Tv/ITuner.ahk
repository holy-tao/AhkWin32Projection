#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ITuningSpace.ahk
#Include .\IEnumTuningSpaces.ahk
#Include .\ITuneRequest.ahk
#Include .\IComponentTypes.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TuningSpace", "put_TuningSpace", "EnumTuningSpaces", "get_TuneRequest", "put_TuneRequest", "Validate", "get_PreferredComponentTypes", "put_PreferredComponentTypes", "get_SignalStrength", "TriggerSignalEvents"]

    /**
     * @type {ITuningSpace} 
     */
    TuningSpace {
        get => this.get_TuningSpace()
        set => this.put_TuningSpace(value)
    }

    /**
     * @type {ITuneRequest} 
     */
    TuneRequest {
        get => this.get_TuneRequest()
        set => this.put_TuneRequest(value)
    }

    /**
     * @type {IComponentTypes} 
     */
    PreferredComponentTypes {
        get => this.get_PreferredComponentTypes()
        set => this.put_PreferredComponentTypes(value)
    }

    /**
     * @type {Integer} 
     */
    SignalStrength {
        get => this.get_SignalStrength()
    }

    /**
     * The get_TuningSpace method gets the tuning space currently in effect for the Network Provider.
     * @returns {ITuningSpace} Address of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ituningspace">ITuningSpace</a> interface pointer that will be set to the current tuning space.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituner-get_tuningspace
     */
    get_TuningSpace() {
        result := ComCall(3, this, "ptr*", &TuningSpace := 0, "HRESULT")
        return ITuningSpace(TuningSpace)
    }

    /**
     * The put_TuningSpace method sets the tuning space for the Network Provider.
     * @param {ITuningSpace} TuningSpace Pointer to the tuning space that will be set in the Network Provider.
     * @returns {HRESULT} When the method is successful, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituner-put_tuningspace
     */
    put_TuningSpace(TuningSpace) {
        result := ComCall(4, this, "ptr", TuningSpace, "HRESULT")
        return result
    }

    /**
     * The EnumTuningSpaces method creates a collection of tuning spaces preferred by this implementation.
     * @returns {IEnumTuningSpaces} Address of a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ienumtuningspaces">IEnumTuningSpaces</a> interface pointer that will be set to the returned collection.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituner-enumtuningspaces
     */
    EnumTuningSpaces() {
        result := ComCall(5, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTuningSpaces(ppEnum)
    }

    /**
     * The get_TuneRequest method gets the tune request currently in effect for the Network Provider.
     * @returns {ITuneRequest} Address of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-itunerequest">ITuneRequest</a> interface pointer that will be set to the returned object.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituner-get_tunerequest
     */
    get_TuneRequest() {
        result := ComCall(6, this, "ptr*", &TuneRequest := 0, "HRESULT")
        return ITuneRequest(TuneRequest)
    }

    /**
     * The put_TuneRequest method sets the tune request currently in effect for the Network Provider.
     * @param {ITuneRequest} TuneRequest Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-itunerequest">ITuneRequest</a> object that will be used to set the Network Provider.
     * @returns {HRESULT} When the method is successful, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituner-put_tunerequest
     */
    put_TuneRequest(TuneRequest) {
        result := ComCall(7, this, "ptr", TuneRequest, "HRESULT")
        return result
    }

    /**
     * The Validate method returns a value indicating that the tune request can be carried out.
     * @param {ITuneRequest} TuneRequest Pointer to the tune request object.
     * @returns {HRESULT} When the method is successful, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituner-validate
     */
    Validate(TuneRequest) {
        result := ComCall(8, this, "ptr", TuneRequest, "HRESULT")
        return result
    }

    /**
     * The get_PreferredComponentTypes method gets the collection of ComponentType objects used for default component selection.
     * @returns {IComponentTypes} Address of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-icomponenttypes">IComponentTypes</a> interface pointer that receives the collection of ComponentType objects.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituner-get_preferredcomponenttypes
     */
    get_PreferredComponentTypes() {
        result := ComCall(9, this, "ptr*", &ComponentTypes := 0, "HRESULT")
        return IComponentTypes(ComponentTypes)
    }

    /**
     * The put_PreferredComponentTypes method sets the collection of ComponentType objects used for default component selection.
     * @param {IComponentTypes} ComponentTypes Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-icomponenttypes">IComponentTypes</a> interface that contains the collection of ComponentType objects.
     * @returns {HRESULT} When the method is successful, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituner-put_preferredcomponenttypes
     */
    put_PreferredComponentTypes(ComponentTypes) {
        result := ComCall(10, this, "ptr", ComponentTypes, "HRESULT")
        return result
    }

    /**
     * The get_SignalStrength method retrieves the Network Provider-specific signal strength metric.
     * @returns {Integer} Receives the signal strength.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituner-get_signalstrength
     */
    get_SignalStrength() {
        result := ComCall(11, this, "int*", &Strength := 0, "HRESULT")
        return Strength
    }

    /**
     * The TriggerSignalEvents method enables the tuner to raise an event when the status of the signal changes.
     * @param {Integer} Interval Specifies the time-out interval in milliseconds.
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ituner-triggersignalevents
     */
    TriggerSignalEvents(Interval) {
        result := ComCall(12, this, "int", Interval, "HRESULT")
        return result
    }
}
