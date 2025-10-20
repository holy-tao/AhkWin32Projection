#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Extends the IInkTablet interface.
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinktablet2
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkTablet2 extends IDispatch{
    /**
     * The interface identifier for IInkTablet2
     * @type {Guid}
     */
    static IID => Guid("{90c91ad2-fa36-49d6-9516-ce8d570f6f85}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} Kind 
     * @returns {HRESULT} 
     */
    get_DeviceKind(Kind) {
        result := ComCall(7, this, "int*", Kind, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
