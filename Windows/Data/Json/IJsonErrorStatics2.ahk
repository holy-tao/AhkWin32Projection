#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Data.Json
 * @version WindowsRuntime 1.4
 */
class IJsonErrorStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IJsonErrorStatics2
     * @type {Guid}
     */
    static IID => Guid("{404030da-87d0-436c-83ab-fc7b12c0cc26}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetJsonStatus"]

    /**
     * 
     * @param {Integer} hresult_ 
     * @returns {Integer} 
     */
    GetJsonStatus(hresult_) {
        result := ComCall(6, this, "int", hresult_, "int*", &status_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return status_
    }
}
