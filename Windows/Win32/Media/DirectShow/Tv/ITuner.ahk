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
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ITuner)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-ituner
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
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituner-get_tuningspace
     */
    get_TuningSpace() {
        result := ComCall(3, this, "ptr*", &TuningSpace := 0, "HRESULT")
        return ITuningSpace(TuningSpace)
    }

    /**
     * The put_TuningSpace method sets the tuning space for the Network Provider.
     * @param {ITuningSpace} TuningSpace Pointer to the tuning space that will be set in the Network Provider.
     * @returns {HRESULT} When the method is successful, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituner-put_tuningspace
     */
    put_TuningSpace(TuningSpace) {
        result := ComCall(4, this, "ptr", TuningSpace, "HRESULT")
        return result
    }

    /**
     * The EnumTuningSpaces method creates a collection of tuning spaces preferred by this implementation.
     * @remarks
     * This list is a subset of the compatible tuning spaces for this implementation.
     * @returns {IEnumTuningSpaces} Address of a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ienumtuningspaces">IEnumTuningSpaces</a> interface pointer that will be set to the returned collection.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituner-enumtuningspaces
     */
    EnumTuningSpaces() {
        result := ComCall(5, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTuningSpaces(ppEnum)
    }

    /**
     * The get_TuneRequest method gets the tune request currently in effect for the Network Provider.
     * @remarks
     * After a tune request is submitted to the Tuner, its Components collection will be filled in. By calling <b>get_TuneRequest</b> after tuning to the program, an application can determine which components are currently available for that program, and then use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-icomponent-put_status">IComponent::put_Status</a> method on the Component objects in the collection to activate or inactivate them. This is how an application, for example, changes from an English audio stream to a Spanish audio stream.
     * @returns {ITuneRequest} Address of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-itunerequest">ITuneRequest</a> interface pointer that will be set to the returned object.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituner-get_tunerequest
     */
    get_TuneRequest() {
        result := ComCall(6, this, "ptr*", &TuneRequest := 0, "HRESULT")
        return ITuneRequest(TuneRequest)
    }

    /**
     * The put_TuneRequest method sets the tune request currently in effect for the Network Provider.
     * @remarks
     * Calling this method initiates a tuning operation based on the properties of the tune request. The tuning operation may be asynchronously attempted.
     * @param {ITuneRequest} TuneRequest Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-itunerequest">ITuneRequest</a> object that will be used to set the Network Provider.
     * @returns {HRESULT} When the method is successful, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituner-put_tunerequest
     */
    put_TuneRequest(TuneRequest) {
        result := ComCall(7, this, "ptr", TuneRequest, "HRESULT")
        return result
    }

    /**
     * The Validate method returns a value indicating that the tune request can be carried out.
     * @remarks
     * The Network Provider will first query for its preferred tune request interface(s). If any are found, the Network Provider will validate that the tune request could be carried out. If none are available, it will then query for its preferred tuning space interface(s). If any are found, the Network Provider will validate that it could configure itself for the given tuning space.
     * @param {ITuneRequest} TuneRequest Pointer to the tune request object.
     * @returns {HRESULT} When the method is successful, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituner-validate
     */
    Validate(TuneRequest) {
        result := ComCall(8, this, "ptr", TuneRequest, "HRESULT")
        return result
    }

    /**
     * The get_PreferredComponentTypes method gets the collection of ComponentType objects used for default component selection.
     * @remarks
     * When a program ends, there may be a new set of stream components available, so at that time the tuner will automatically examine the list of preferred component types and select a component based on that list. If no list is available, the tuner will make a selection based on other factors. Applications call this method simply to examine the current list.
     * @returns {IComponentTypes} Address of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-icomponenttypes">IComponentTypes</a> interface pointer that receives the collection of ComponentType objects.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituner-get_preferredcomponenttypes
     */
    get_PreferredComponentTypes() {
        result := ComCall(9, this, "ptr*", &ComponentTypes := 0, "HRESULT")
        return IComponentTypes(ComponentTypes)
    }

    /**
     * The put_PreferredComponentTypes method sets the collection of ComponentType objects used for default component selection.
     * @remarks
     * Applications create a list of preferred component types by instantiating an empty <b>ComponentTypes</b> collection, filling it, then submitting it to the Tuner using <b>put_PreferredComponentTypes</b>.
     * @param {IComponentTypes} ComponentTypes Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-icomponenttypes">IComponentTypes</a> interface that contains the collection of ComponentType objects.
     * @returns {HRESULT} When the method is successful, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituner-put_preferredcomponenttypes
     */
    put_PreferredComponentTypes(ComponentTypes) {
        result := ComCall(10, this, "ptr", ComponentTypes, "HRESULT")
        return result
    }

    /**
     * The get_SignalStrength method retrieves the Network Provider-specific signal strength metric.
     * @remarks
     * The value -1 means can't determine, 0 means not tuned, highest value means best signal. For digital tuners, this also accounts for the FEC bit error rate (BER).
     * @returns {Integer} Receives the signal strength.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituner-get_signalstrength
     */
    get_SignalStrength() {
        result := ComCall(11, this, "int*", &Strength := 0, "HRESULT")
        return Strength
    }

    /**
     * The TriggerSignalEvents method enables the tuner to raise an event when the status of the signal changes.
     * @remarks
     * If the signal status does not change by the time that the time-out interval expires, the tuner raises the signal-status-change event at the end of the time-out interval. If the caller specifies the interval to be INFINITE, the tuner does not raise the event until the signal status changes, regardless of how much time elapses before the change occurs. Specifying a value of 0 raises the signal-status-change event immediately, regardless of whether the signal status has changed.
     * 
     * Each call to <b>TriggerSignalEvents</b> enables the event to be raised only one time. To raise the event multiple times in response to a series of signal-status changes requires a succession of calls to <b>TriggerSignalEvents</b>.
     * 
     * Multiple event sink objects can wait for the tuner to raise an event that occurs when the signal status changes. For more information, see <a href="https://docs.microsoft.com/previous-versions/dd376294(v=vs.85)">IBroadcastEvent Interface</a>.
     * @param {Integer} Interval Specifies the time-out interval in milliseconds.
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ituner-triggersignalevents
     */
    TriggerSignalEvents(Interval) {
        result := ComCall(12, this, "int", Interval, "HRESULT")
        return result
    }
}
