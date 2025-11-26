#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * An IInkCommitRequestHandler object enables the app (instead of an IInkPresenterDesktop object) to commit all pending Microsoft DirectComposition commands to the app's DirectComposition visual tree.
 * @see https://docs.microsoft.com/windows/win32/api//inkpresenterdesktop/nn-inkpresenterdesktop-iinkcommitrequesthandler
 * @namespace Windows.Win32.UI.Input.Ink
 * @version v4.0.30319
 */
class IInkCommitRequestHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkCommitRequestHandler
     * @type {Guid}
     */
    static IID => Guid("{fabea3fc-b108-45b6-a9fc-8d08fa9f85cf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnCommitRequested"]

    /**
     * Requests that the app commit all pending Microsoft DirectComposition commands to the app's DirectComposition visual tree.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//inkpresenterdesktop/nf-inkpresenterdesktop-iinkcommitrequesthandler-oncommitrequested
     */
    OnCommitRequested() {
        result := ComCall(3, this, "HRESULT")
        return result
    }
}
