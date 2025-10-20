#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IBDA_TIF_REGISTRATION interface is exposed by the BDA Network Provider.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> 
  *      operator: <c>__uuidof(IBDA_TIF_REGISTRATION)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bdatif/nn-bdatif-ibda_tif_registration
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IBDA_TIF_REGISTRATION extends IUnknown{
    /**
     * The interface identifier for IBDA_TIF_REGISTRATION
     * @type {Guid}
     */
    static IID => Guid("{dfef4a68-ee61-415f-9ccb-cd95f2f98a3a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IPin>} pTIFInputPin 
     * @param {Pointer<UInt32>} ppvRegistrationContext 
     * @param {Pointer<IUnknown>} ppMpeg2DataControl 
     * @returns {HRESULT} 
     */
    RegisterTIFEx(pTIFInputPin, ppvRegistrationContext, ppMpeg2DataControl) {
        result := ComCall(3, this, "ptr", pTIFInputPin, "uint*", ppvRegistrationContext, "ptr", ppMpeg2DataControl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} pvRegistrationContext 
     * @returns {HRESULT} 
     */
    UnregisterTIF(pvRegistrationContext) {
        result := ComCall(4, this, "uint", pvRegistrationContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
