#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Not supported. This interface may be absent in later versions of Windows.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-icomputerinfochangenotify
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IComputerInfoChangeNotify extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComputerInfoChangeNotify
     * @type {Guid}
     */
    static IID => Guid("{0df60d92-6818-46d6-b358-d66170dde466}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ComputerInfoChanged"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-icomputerinfochangenotify-computerinfochanged
     */
    ComputerInfoChanged() {
        result := ComCall(3, this, "HRESULT")
        return result
    }
}
