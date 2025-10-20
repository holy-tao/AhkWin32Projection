#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * An IInkHostWorkItem object represents an ink operation to be executed on an IInkDesktopHost object thread.
 * @see https://docs.microsoft.com/windows/win32/api//inkpresenterdesktop/nn-inkpresenterdesktop-iinkhostworkitem
 * @namespace Windows.Win32.UI.Input.Ink
 * @version v4.0.30319
 */
class IInkHostWorkItem extends IUnknown{
    /**
     * The interface identifier for IInkHostWorkItem
     * @type {Guid}
     */
    static IID => Guid("{ccda0a9a-1b78-4632-bb96-97800662e26c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    Invoke() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
