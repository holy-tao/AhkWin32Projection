#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfInputProcessorProfileActivationSink interface is implemented by an application to receive notifications when the profile changes.
 * @remarks
 * 
  * To install this advise sink, obtain an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfsource">ITfSource</a> object from an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfthreadmgr">ITfThreadMgr</a> object by calling <b>ITfThreadMgr::QueryInterface</b> with <b>IID_ ITfSource</b>. Then call <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfsource-advisesink">ITfSource::AdviseSink</a> with <b>IID_ITfInputProcessorProfileActivationSink</b>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfinputprocessorprofileactivationsink
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfInputProcessorProfileActivationSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfInputProcessorProfileActivationSink
     * @type {Guid}
     */
    static IID => Guid("{71c6e74e-0f28-11d8-a82a-00065b84435c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnActivated"]

    /**
     * 
     * @param {Integer} dwProfileType 
     * @param {Integer} langid 
     * @param {Pointer<Guid>} clsid 
     * @param {Pointer<Guid>} catid 
     * @param {Pointer<Guid>} guidProfile 
     * @param {HKL} hkl 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofileactivationsink-onactivated
     */
    OnActivated(dwProfileType, langid, clsid, catid, guidProfile, hkl, dwFlags) {
        hkl := hkl is Win32Handle ? NumGet(hkl, "ptr") : hkl

        result := ComCall(3, this, "uint", dwProfileType, "ushort", langid, "ptr", clsid, "ptr", catid, "ptr", guidProfile, "ptr", hkl, "uint", dwFlags, "HRESULT")
        return result
    }
}
