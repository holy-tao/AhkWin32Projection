#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRelatedItem.ahk

/**
 * This interface is not supported. Do not use.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-iusetobrowseitem
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IUseToBrowseItem extends IRelatedItem{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUseToBrowseItem
     * @type {Guid}
     */
    static IID => Guid("{05edda5c-98a3-4717-8adb-c5e7da991eb1}")

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
