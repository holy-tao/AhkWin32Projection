#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class IDataPackage2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataPackage2
     * @type {Guid}
     */
    static IID => Guid("{041c1fe9-2409-45e1-a538-4c53eeee04a7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetApplicationLink", "SetWebLink"]

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    SetApplicationLink(value) {
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    SetWebLink(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
