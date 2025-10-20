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
     * 
     * @returns {HRESULT} 
     */
    OnCommitRequested() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
