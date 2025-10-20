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
     * 
     * @param {Integer} ulRequestId 
     * @param {Integer} ulcbRequestBufferLen 
     * @param {Pointer<Byte>} pbRequestBuffer 
     * @returns {HRESULT} 
     */
    SetIsdbCasRequest(ulRequestId, ulcbRequestBufferLen, pbRequestBuffer) {
        result := ComCall(3, this, "uint", ulRequestId, "uint", ulcbRequestBufferLen, "char*", pbRequestBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
