#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI
 * @version WindowsRuntime 1.4
 */
class IColorHelperStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IColorHelperStatics2
     * @type {Guid}
     */
    static IID => Guid("{24d9af02-6eb0-4b94-855c-fcf0818d9a16}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ToDisplayName"]

    /**
     * 
     * @param {Color} color_ 
     * @returns {HSTRING} 
     */
    ToDisplayName(color_) {
        returnValue := HSTRING()
        result := ComCall(6, this, "ptr", color_, "ptr", returnValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return returnValue
    }
}
