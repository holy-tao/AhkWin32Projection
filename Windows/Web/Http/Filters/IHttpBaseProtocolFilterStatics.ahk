#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\HttpBaseProtocolFilter.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http.Filters
 * @version WindowsRuntime 1.4
 */
class IHttpBaseProtocolFilterStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpBaseProtocolFilterStatics
     * @type {Guid}
     */
    static IID => Guid("{6d4dee0c-e908-494e-b5a3-1263c9b8242a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateForUser"]

    /**
     * 
     * @param {User} user_ 
     * @returns {HttpBaseProtocolFilter} 
     */
    CreateForUser(user_) {
        result := ComCall(6, this, "ptr", user_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpBaseProtocolFilter(result_)
    }
}
