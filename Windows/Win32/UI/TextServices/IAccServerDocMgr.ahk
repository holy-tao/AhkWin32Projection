#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that make documents accessible to client applications.
 * @see https://docs.microsoft.com/windows/win32/api//msaatext/nn-msaatext-iaccserverdocmgr
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class IAccServerDocMgr extends IUnknown{
    /**
     * The interface identifier for IAccServerDocMgr
     * @type {Guid}
     */
    static IID => Guid("{ad7c73cf-6dd5-4855-abc2-b04bad5b9153}")

    /**
     * The class identifier for AccServerDocMgr
     * @type {Guid}
     */
    static CLSID => Guid("{6089a37e-eb8a-482d-bd6f-f9f46904d16d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} punk 
     * @returns {HRESULT} 
     */
    NewDocument(riid, punk) {
        result := ComCall(3, this, "ptr", riid, "ptr", punk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} punk 
     * @returns {HRESULT} 
     */
    RevokeDocument(punk) {
        result := ComCall(4, this, "ptr", punk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} punk 
     * @returns {HRESULT} 
     */
    OnDocumentFocus(punk) {
        result := ComCall(5, this, "ptr", punk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
