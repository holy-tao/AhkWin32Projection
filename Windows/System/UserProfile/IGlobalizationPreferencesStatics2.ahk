#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.UserProfile
 * @version WindowsRuntime 1.4
 */
class IGlobalizationPreferencesStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGlobalizationPreferencesStatics2
     * @type {Guid}
     */
    static IID => Guid("{fcce85f1-4300-4cd0-9cac-1a8e7b7e18f4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TrySetHomeGeographicRegion", "TrySetLanguages"]

    /**
     * 
     * @param {HSTRING} region_ 
     * @returns {Boolean} 
     */
    TrySetHomeGeographicRegion(region_) {
        if(region_ is String) {
            pin := HSTRING.Create(region_)
            region_ := pin.Value
        }
        region_ := region_ is Win32Handle ? NumGet(region_, "ptr") : region_

        result := ComCall(6, this, "ptr", region_, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {IIterable<HSTRING>} languageTags 
     * @returns {Boolean} 
     */
    TrySetLanguages(languageTags) {
        result := ComCall(7, this, "ptr", languageTags, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
