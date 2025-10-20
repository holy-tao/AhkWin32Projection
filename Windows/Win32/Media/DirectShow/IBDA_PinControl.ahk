#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IBDA_PinControl interface is exposed on a BDA device filter's pins. A Network Provider calls these methods to determine the type and identifier of each pin on the filter. A Network Provider uses this information when building the graph.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_PinControl)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-ibda_pincontrol
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_PinControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBDA_PinControl
     * @type {Guid}
     */
    static IID => Guid("{0ded49d5-a8b7-4d5d-97a1-12b0c195874d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPinID", "GetPinType", "RegistrationContext"]

    /**
     * 
     * @param {Pointer<Integer>} pulPinID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_pincontrol-getpinid
     */
    GetPinID(pulPinID) {
        result := ComCall(3, this, "uint*", pulPinID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulPinType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_pincontrol-getpintype
     */
    GetPinType(pulPinType) {
        result := ComCall(4, this, "uint*", pulPinType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulRegistrationCtx 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_pincontrol-registrationcontext
     */
    RegistrationContext(pulRegistrationCtx) {
        result := ComCall(5, this, "uint*", pulRegistrationCtx, "HRESULT")
        return result
    }
}
