#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\Collections\IVectorView.ahk
#Include ..\Foundation\IPropertyValue.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization
 * @version WindowsRuntime 1.4
 */
class IApplicationLanguagesStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IApplicationLanguagesStatics2
     * @type {Guid}
     */
    static IID => Guid("{1df0de4f-072b-4d7b-8f06-cb2db40f2bb5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLanguagesForUser"]

    /**
     * 
     * @param {User} user_ 
     * @returns {IVectorView<HSTRING>} 
     */
    GetLanguagesForUser(user_) {
        result := ComCall(6, this, "ptr", user_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }
}
