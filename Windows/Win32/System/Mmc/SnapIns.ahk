#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class SnapIns extends IDispatch{
    /**
     * The interface identifier for SnapIns
     * @type {Guid}
     */
    static IID => Guid("{2ef3de1d-b12a-49d1-92c5-0b00798768f1}")

    /**
     * The class identifier for SnapIns
     * @type {Guid}
     */
    static CLSID => Guid("{2ef3de1d-b12a-49d1-92c5-0b00798768f1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IUnknown>} retval 
     * @returns {HRESULT} 
     */
    get__NewEnum(retval) {
        result := ComCall(7, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<SnapIn>} SnapIn 
     * @returns {HRESULT} 
     */
    Item(Index, SnapIn) {
        result := ComCall(8, this, "int", Index, "ptr", SnapIn, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Count 
     * @returns {HRESULT} 
     */
    get_Count(Count) {
        result := ComCall(9, this, "int*", Count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} SnapinNameOrCLSID 
     * @param {VARIANT} ParentSnapin 
     * @param {VARIANT} Properties 
     * @param {Pointer<SnapIn>} SnapIn 
     * @returns {HRESULT} 
     */
    Add(SnapinNameOrCLSID, ParentSnapin, Properties, SnapIn) {
        SnapinNameOrCLSID := SnapinNameOrCLSID is String ? BSTR.Alloc(SnapinNameOrCLSID).Value : SnapinNameOrCLSID

        result := ComCall(10, this, "ptr", SnapinNameOrCLSID, "ptr", ParentSnapin, "ptr", Properties, "ptr", SnapIn, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SnapIn>} SnapIn 
     * @returns {HRESULT} 
     */
    Remove(SnapIn) {
        result := ComCall(11, this, "ptr", SnapIn, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
