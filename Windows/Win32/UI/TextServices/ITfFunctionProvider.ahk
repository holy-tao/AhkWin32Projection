#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfFunctionProvider interface is implemented by an application or text service to provide various function objects.
 * @remarks
 * 
  * A function provider is registered by calling <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfsourcesingle-advisesinglesink">ITFSourceSingle::AdviseSingleSink</a> with IID_ITfFunctionProvider when the text service is activated. The text service should unregister its function provider with <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfsourcesingle-unadvisesinglesink">ITFSourceSingle::UnadviseSingleSink</a> when it is deactivated.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itffunctionprovider
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfFunctionProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfFunctionProvider
     * @type {Guid}
     */
    static IID => Guid("{101d6610-0990-11d3-8df0-00105a2799b5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetType", "GetDescription", "GetFunction"]

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itffunctionprovider-gettype
     */
    GetType() {
        pguid := Guid()
        result := ComCall(3, this, "ptr", pguid, "HRESULT")
        return pguid
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itffunctionprovider-getdescription
     */
    GetDescription() {
        pbstrDesc := BSTR()
        result := ComCall(4, this, "ptr", pbstrDesc, "HRESULT")
        return pbstrDesc
    }

    /**
     * 
     * @param {Pointer<Guid>} rguid 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itffunctionprovider-getfunction
     */
    GetFunction(rguid, riid) {
        result := ComCall(5, this, "ptr", rguid, "ptr", riid, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }
}
