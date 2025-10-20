#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Defines a collection of FSRM objects.
 * @see https://docs.microsoft.com/windows/win32/api//fsrm/nn-fsrm-ifsrmcollection
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmCollection extends IDispatch{
    /**
     * The interface identifier for IFsrmCollection
     * @type {Guid}
     */
    static IID => Guid("{f76fbf3b-8ddd-4b42-b05a-cb1c3ff1fee8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IUnknown>} unknown 
     * @returns {HRESULT} 
     */
    get__NewEnum(unknown) {
        result := ComCall(7, this, "ptr", unknown, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<VARIANT>} item 
     * @returns {HRESULT} 
     */
    get_Item(index, item) {
        result := ComCall(8, this, "int", index, "ptr", item, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} count 
     * @returns {HRESULT} 
     */
    get_Count(count) {
        result := ComCall(9, this, "int*", count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} state 
     * @returns {HRESULT} 
     */
    get_State(state) {
        result := ComCall(10, this, "int*", state, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Cancel() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} waitSeconds 
     * @param {Pointer<VARIANT_BOOL>} completed 
     * @returns {HRESULT} 
     */
    WaitForCompletion(waitSeconds, completed) {
        result := ComCall(12, this, "int", waitSeconds, "ptr", completed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} id 
     * @param {Pointer<VARIANT>} entry 
     * @returns {HRESULT} 
     */
    GetById(id, entry) {
        result := ComCall(13, this, "ptr", id, "ptr", entry, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
