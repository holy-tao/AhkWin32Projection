#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web
 * @version WindowsRuntime 1.4
 */
class IWebErrorStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebErrorStatics
     * @type {Guid}
     */
    static IID => Guid("{fe616766-bf27-4064-87b7-6563bb11ce2e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStatus"]

    /**
     * 
     * @param {Integer} hresult_ 
     * @returns {Integer} 
     */
    GetStatus(hresult_) {
        result := ComCall(6, this, "int", hresult_, "int*", &status_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return status_
    }
}
