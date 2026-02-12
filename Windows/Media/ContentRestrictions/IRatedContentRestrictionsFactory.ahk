#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\RatedContentRestrictions.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.ContentRestrictions
 * @version WindowsRuntime 1.4
 */
class IRatedContentRestrictionsFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRatedContentRestrictionsFactory
     * @type {Guid}
     */
    static IID => Guid("{fb4b2996-c3bd-4910-9619-97cfd0694d56}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWithMaxAgeRating"]

    /**
     * 
     * @param {Integer} maxAgeRating 
     * @returns {RatedContentRestrictions} 
     */
    CreateWithMaxAgeRating(maxAgeRating) {
        result := ComCall(6, this, "uint", maxAgeRating, "ptr*", &ratedContentRestrictions_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RatedContentRestrictions(ratedContentRestrictions_)
    }
}
