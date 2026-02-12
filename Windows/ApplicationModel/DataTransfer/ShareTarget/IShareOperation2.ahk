#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.DataTransfer.ShareTarget
 * @version WindowsRuntime 1.4
 */
class IShareOperation2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShareOperation2
     * @type {Guid}
     */
    static IID => Guid("{0ffb97c1-9778-4a09-8e5b-cb5e482d0555}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DismissUI"]

    /**
     * 
     * @returns {HRESULT} 
     */
    DismissUI() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
