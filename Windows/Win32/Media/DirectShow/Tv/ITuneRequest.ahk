#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ITuningSpace.ahk
#Include .\IComponents.ahk
#Include .\ITuneRequest.ahk
#Include .\ILocator.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TuningSpace", "get_Components", "Clone", "get_Locator", "put_Locator"]

    /**
     * @type {ITuningSpace} 
     */
    TuningSpace {
        get => this.get_TuningSpace()
    }

    /**
     * @type {IComponents} 
     */
    Components {
        get => this.get_Components()
    }

    /**
     * @type {ILocator} 
     */
    Locator {
        get => this.get_Locator()
        set => this.put_Locator(value)
    }

    /**
     * The get_TuningSpace method retrieves the tuning space that was used to create this tune request.
     * @returns {ITuningSpace} Receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ituningspace">ITuningSpace</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-itunerequest-get_tuningspace
     */
    get_TuningSpace() {
        result := ComCall(7, this, "ptr*", &TuningSpace := 0, "HRESULT")
        return ITuningSpace(TuningSpace)
    }

    /**
     * The get_Components method retrieves the components contained in this tune request.
     * @returns {IComponents} Receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-icomponents">IComponents</a> interface pointer. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-itunerequest-get_components
     */
    get_Components() {
        result := ComCall(8, this, "ptr*", &Components := 0, "HRESULT")
        return IComponents(Components)
    }

    /**
     * The Clone method returns a new copy of this tune request.
     * @returns {ITuneRequest} Address of an <b>ITuneRequest</b> interface pointer that will be set to the new object.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-itunerequest-clone
     */
    Clone() {
        result := ComCall(9, this, "ptr*", &NewTuneRequest := 0, "HRESULT")
        return ITuneRequest(NewTuneRequest)
    }

    /**
     * The get_Locator method is called from the Network Provider to get the ILocator object associated with the requested broadcast.
     * @returns {ILocator} Address of an <b>ILocator</b> interface pointer that will be set to the new object.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-itunerequest-get_locator
     */
    get_Locator() {
        result := ComCall(10, this, "ptr*", &Locator := 0, "HRESULT")
        return ILocator(Locator)
    }

    /**
     * The put_Locator method is called from the Network Provider to set the ILocator object associated with the requested broadcast.
     * @param {ILocator} Locator Pointer to an <b>ILocator</b> interface that specifies the new locator.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-itunerequest-put_locator
     */
    put_Locator(Locator) {
        result := ComCall(11, this, "ptr", Locator, "HRESULT")
        return result
    }
}
