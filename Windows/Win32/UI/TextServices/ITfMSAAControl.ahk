#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfMSAAControl interface is used by Microsoft Active Accessibility to add or remove a document from TSF control, to avoid unnecessary overhead in TSF. This interface is not recommended for use by other applications.
 * @see https://docs.microsoft.com/windows/win32/api//msaatext/nn-msaatext-itfmsaacontrol
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfMSAAControl extends IUnknown{
    /**
     * The interface identifier for ITfMSAAControl
     * @type {Guid}
     */
    static IID => Guid("{b5f8fb3b-393f-4f7c-84cb-504924c2705a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    SystemEnableMSAA() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SystemDisableMSAA() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
