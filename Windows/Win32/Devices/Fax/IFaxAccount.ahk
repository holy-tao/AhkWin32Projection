#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Represents a fax account on the fax server.
 * @remarks
 * 
  * A default implementation of <b>IFaxAccount</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxaccount">FaxAccount</a> object. The interface and the object are supported only on Windows Vista or later.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxaccount
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxAccount extends IDispatch{
    /**
     * The interface identifier for IFaxAccount
     * @type {Guid}
     */
    static IID => Guid("{68535b33-5dc4-4086-be26-b76f9b711006}")

    /**
     * The class identifier for FaxAccount
     * @type {Guid}
     */
    static CLSID => Guid("{a7e0647f-4524-4464-a56d-b9fe666f715e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<BSTR>} pbstrAccountName 
     * @returns {HRESULT} 
     */
    get_AccountName(pbstrAccountName) {
        result := ComCall(7, this, "ptr", pbstrAccountName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFaxAccountFolders>} ppFolders 
     * @returns {HRESULT} 
     */
    get_Folders(ppFolders) {
        result := ComCall(8, this, "ptr", ppFolders, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} EventTypes 
     * @returns {HRESULT} 
     */
    ListenToAccountEvents(EventTypes) {
        result := ComCall(9, this, "int", EventTypes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pRegisteredEvents 
     * @returns {HRESULT} 
     */
    get_RegisteredEvents(pRegisteredEvents) {
        result := ComCall(10, this, "int*", pRegisteredEvents, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
