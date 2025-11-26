#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfFunction interface is the base interface for the individual function interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itffunction
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfFunction extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfFunction
     * @type {Guid}
     */
    static IID => Guid("{db593490-098f-11d3-8df0-00105a2799b5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDisplayName"]

    /**
     * ITfFunction::GetDisplayName method
     * @returns {BSTR} Pointer to a BSTR value that receives the display name. This value must be allocated using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a>. The caller must free this memory using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> when it is no longer required.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itffunction-getdisplayname
     */
    GetDisplayName() {
        pbstrName := BSTR()
        result := ComCall(3, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }
}
