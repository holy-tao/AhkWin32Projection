#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class ICastingSourceInfo extends IUnknown{
    /**
     * The interface identifier for ICastingSourceInfo
     * @type {Guid}
     */
    static IID => Guid("{45101ab7-7c3a-4bce-9500-12c09024b298}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ICastingController>} controller 
     * @returns {HRESULT} 
     */
    GetController(controller) {
        result := ComCall(3, this, "ptr", controller, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<INamedPropertyStore>} props 
     * @returns {HRESULT} 
     */
    GetProperties(props) {
        result := ComCall(4, this, "ptr", props, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
