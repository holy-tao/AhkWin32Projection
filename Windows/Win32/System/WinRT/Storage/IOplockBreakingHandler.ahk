#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * This interface is not currently implemented.
 * @see https://docs.microsoft.com/windows/win32/api//windowsstoragecom/nn-windowsstoragecom-ioplockbreakinghandler
 * @namespace Windows.Win32.System.WinRT.Storage
 * @version v4.0.30319
 */
class IOplockBreakingHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOplockBreakingHandler
     * @type {Guid}
     */
    static IID => Guid("{826abe3d-3acd-47d3-84f2-88aaedcf6304}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OplockBreaking"]

    /**
     * This method is not currently implemented.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//windowsstoragecom/nf-windowsstoragecom-ioplockbreakinghandler-oplockbreaking
     */
    OplockBreaking() {
        result := ComCall(3, this, "HRESULT")
        return result
    }
}
