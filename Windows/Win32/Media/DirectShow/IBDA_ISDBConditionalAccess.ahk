#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Sends conditional access system (CAS) commands for Integrated Services Digital Broadcasting (ISDB).
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_ISDBConditionalAccess)</c>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-ibda_isdbconditionalaccess
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_ISDBConditionalAccess extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBDA_ISDBConditionalAccess
     * @type {Guid}
     */
    static IID => Guid("{5e68c627-16c2-4e6c-b1e2-d00170cdaa0f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetIsdbCasRequest"]

    /**
     * Sends a conditional access system (CAS) command for Integrated Services Digital Broadcasting (ISDB).
     * @param {Integer} ulRequestId The numeric code for the CAS command. The ARIB standard defines these values. Enumeration constants for some commands are defined in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/isdbcas-request-id">ISDBCAS_REQUEST_ID</a> enumeration.
     * @param {Integer} ulcbRequestBufferLen Size of the <i>pbRequestBuffer</i> array, in bytes.
     * @param {Pointer<Integer>} pbRequestBuffer Pointer to a byte array that contains the data for the command.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_isdbconditionalaccess-setisdbcasrequest
     */
    SetIsdbCasRequest(ulRequestId, ulcbRequestBufferLen, pbRequestBuffer) {
        pbRequestBufferMarshal := pbRequestBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", ulRequestId, "uint", ulcbRequestBufferLen, pbRequestBufferMarshal, pbRequestBuffer, "HRESULT")
        return result
    }
}
