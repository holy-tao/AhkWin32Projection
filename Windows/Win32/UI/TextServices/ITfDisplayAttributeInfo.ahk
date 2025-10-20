#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfDisplayAttributeInfo interface is implemented by a text service to provide display attribute data. This interface is used by any component, most often an application, that must determine how text displays.
 * @remarks
 * 
  * An application obtains an instance of this interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdisplayattributemgr-getdisplayattributeinfo">ITfDisplayAttributeMgr::GetDisplayAttributeInfo</a> or <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-ienumtfdisplayattributeinfo-next">IEnumTfDisplayAttributeInfo::Next</a>.
  * 
  * A text service supplies an instance of this interface in its <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdisplayattributeprovider-getdisplayattributeinfo">ITfDisplayAttributeProvider::GetDisplayAttributeInfo</a> method.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfdisplayattributeinfo
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfDisplayAttributeInfo extends IUnknown{
    /**
     * The interface identifier for ITfDisplayAttributeInfo
     * @type {Guid}
     */
    static IID => Guid("{70528852-2f26-4aea-8c96-215150578932}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} pguid 
     * @returns {HRESULT} 
     */
    GetGUID(pguid) {
        result := ComCall(3, this, "ptr", pguid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDesc 
     * @returns {HRESULT} 
     */
    GetDescription(pbstrDesc) {
        result := ComCall(4, this, "ptr", pbstrDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<TF_DISPLAYATTRIBUTE>} pda 
     * @returns {HRESULT} 
     */
    GetAttributeInfo(pda) {
        result := ComCall(5, this, "ptr", pda, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<TF_DISPLAYATTRIBUTE>} pda 
     * @returns {HRESULT} 
     */
    SetAttributeInfo(pda) {
        result := ComCall(6, this, "ptr", pda, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
