#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class FolderItemVerbs extends IDispatch{
    /**
     * The interface identifier for FolderItemVerbs
     * @type {Guid}
     */
    static IID => Guid("{1f8352c0-50b0-11cf-960c-0080c7f4ee85}")

    /**
     * The class identifier for FolderItemVerbs
     * @type {Guid}
     */
    static CLSID => Guid("{1f8352c0-50b0-11cf-960c-0080c7f4ee85}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} plCount 
     * @returns {HRESULT} 
     */
    get_Count(plCount) {
        result := ComCall(7, this, "int*", plCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppid 
     * @returns {HRESULT} 
     */
    get_Application(ppid) {
        result := ComCall(8, this, "ptr", ppid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppid 
     * @returns {HRESULT} 
     */
    get_Parent(ppid) {
        result := ComCall(9, this, "ptr", ppid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} index 
     * @param {Pointer<FolderItemVerb>} ppid 
     * @returns {HRESULT} 
     */
    Item(index, ppid) {
        result := ComCall(10, this, "ptr", index, "ptr", ppid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppunk 
     * @returns {HRESULT} 
     */
    _NewEnum(ppunk) {
        result := ComCall(11, this, "ptr", ppunk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
