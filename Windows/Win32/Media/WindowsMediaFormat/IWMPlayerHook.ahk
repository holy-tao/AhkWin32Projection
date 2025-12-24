#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPlayerHook interface can be implemented by a player application that uses DirectX Video Acceleration (DirectX VA).
 * @remarks
 * 
 * To assign an implementation of the <b>IWMPlayerHook</b> interface to an output in the reader object, call <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced5-setplayerhook">IWMReaderAdvanced5::SetPlayerHook</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmplayerhook
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMPlayerHook extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPlayerHook
     * @type {Guid}
     */
    static IID => Guid("{e5b7ca9a-0f1c-4f66-9002-74ec50d8b304}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PreDecode"]

    /**
     * The PreDecode method is called by the reader object before a sample from the output to which the IWMPlayerHook interface is assigned is passed to the video processor for decoding.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. You should return S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmplayerhook-predecode
     */
    PreDecode() {
        result := ComCall(3, this, "HRESULT")
        return result
    }
}
