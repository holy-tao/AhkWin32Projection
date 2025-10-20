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
     * 
     * @param {Pointer<UInt32>} pulPinID 
     * @returns {HRESULT} 
     */
    GetPinID(pulPinID) {
        result := ComCall(3, this, "uint*", pulPinID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulPinType 
     * @returns {HRESULT} 
     */
    GetPinType(pulPinType) {
        result := ComCall(4, this, "uint*", pulPinType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulRegistrationCtx 
     * @returns {HRESULT} 
     */
    RegistrationContext(pulRegistrationCtx) {
        result := ComCall(5, this, "uint*", pulRegistrationCtx, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
