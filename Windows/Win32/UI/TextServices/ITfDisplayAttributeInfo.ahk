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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetGUID", "GetDescription", "GetAttributeInfo", "SetAttributeInfo", "Reset"]

    /**
     * 
     * @param {Pointer<Guid>} pguid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfdisplayattributeinfo-getguid
     */
    GetGUID(pguid) {
        result := ComCall(3, this, "ptr", pguid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfdisplayattributeinfo-getdescription
     */
    GetDescription(pbstrDesc) {
        result := ComCall(4, this, "ptr", pbstrDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<TF_DISPLAYATTRIBUTE>} pda 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfdisplayattributeinfo-getattributeinfo
     */
    GetAttributeInfo(pda) {
        result := ComCall(5, this, "ptr", pda, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<TF_DISPLAYATTRIBUTE>} pda 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfdisplayattributeinfo-setattributeinfo
     */
    SetAttributeInfo(pda) {
        result := ComCall(6, this, "ptr", pda, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfdisplayattributeinfo-reset
     */
    Reset() {
        result := ComCall(7, this, "HRESULT")
        return result
    }
}
