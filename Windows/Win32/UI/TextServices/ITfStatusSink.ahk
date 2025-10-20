#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfStatusSink interface supports changes to the global document status. This advise sink is installed by calling ITfSource::AdviseSink with IID_ITfStatusSink. A text service can optionally implement this interface.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfstatussink
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfStatusSink extends IUnknown{
    /**
     * The interface identifier for ITfStatusSink
     * @type {Guid}
     */
    static IID => Guid("{6b7d8d73-b267-4f69-b32e-1ca321ce4f45}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ITfContext>} pic 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    OnStatusChange(pic, dwFlags) {
        result := ComCall(3, this, "ptr", pic, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
