#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Ole\IOleCommandTarget.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IUrlHistoryNotify extends IOleCommandTarget{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUrlHistoryNotify
     * @type {Guid}
     */
    static IID => Guid("{bc40bec1-c493-11d0-831b-00c04fd5ae38}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
