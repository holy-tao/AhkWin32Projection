#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IConsoleNameSpace.ahk

/**
 * The IConsoleNameSpace2 interface is introduced in MMC 1.1.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-iconsolenamespace2
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IConsoleNameSpace2 extends IConsoleNameSpace{
    /**
     * The interface identifier for IConsoleNameSpace2
     * @type {Guid}
     */
    static IID => Guid("{255f18cc-65db-11d1-a7dc-00c04fd8d565}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * 
     * @param {Pointer} hItem 
     * @returns {HRESULT} 
     */
    Expand(hItem) {
        result := ComCall(10, this, "ptr", hItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hItem 
     * @param {Pointer<Guid>} lpClsid 
     * @returns {HRESULT} 
     */
    AddExtension(hItem, lpClsid) {
        result := ComCall(11, this, "ptr", hItem, "ptr", lpClsid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
