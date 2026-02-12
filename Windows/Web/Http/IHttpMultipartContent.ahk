#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class IHttpMultipartContent extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpMultipartContent
     * @type {Guid}
     */
    static IID => Guid("{df916aff-9926-4ac9-aaf1-e0d04ef09bb9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Add"]

    /**
     * You can add, show, hide, and delete sections in the ShapeSheet.
     * @param {IHttpContent} content 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/add-show-hide-or-delete-a-section
     */
    Add(content) {
        result := ComCall(6, this, "ptr", content, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
