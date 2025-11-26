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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterTIFEx", "UnregisterTIF"]

    /**
     * The RegisterTIFEx method registers a Transport Information Filter (TIF) with the Network Provider.
     * @param {IPin} pTIFInputPin Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipin">IPin</a> interface of the input pin on the TIF.
     * @param {Pointer<Integer>} ppvRegistrationContext Receives a token identifying the connection. Pass this token in the <b>UnregisterTIF</b> method when the TIF unregisters itself.
     * @param {Pointer<IUnknown>} ppMpeg2DataControl Receives a pointer to an <b>IUnknown</b> interface, which the TIF queries for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/bdaiface/nn-bdaiface-impeg2pidmap">IMPEG2PIDMap</a> interface. It uses the <b>IMPEG2PIDMap</b> to map and unmap PID values.
     * @returns {HRESULT} The method returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//bdatif/nf-bdatif-ibda_tif_registration-registertifex
     */
    RegisterTIFEx(pTIFInputPin, ppvRegistrationContext, ppMpeg2DataControl) {
        ppvRegistrationContextMarshal := ppvRegistrationContext is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pTIFInputPin, ppvRegistrationContextMarshal, ppvRegistrationContext, "ptr*", ppMpeg2DataControl, "HRESULT")
        return result
    }

    /**
     * The UnregisterTIF method unregisters a Transport Information Filter (TIF) with the Network Provider.
     * @param {Integer} pvRegistrationContext Specifies the token that the <b>RegisterTIFEx</b> method returned in the <i>ppvRegistrationContext</i> parameter.
     * @returns {HRESULT} The method returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//bdatif/nf-bdatif-ibda_tif_registration-unregistertif
     */
    UnregisterTIF(pvRegistrationContext) {
        result := ComCall(4, this, "uint", pvRegistrationContext, "HRESULT")
        return result
    }
}
